/*

==========================================
Exercise No. 2
==========================================

=====================
Constraint(s)
=====================

A PhD student must take at least one course.

=====================
Event(s)
=====================

1. Insert to PhDStudent table.
2. Update to StudentNo or CourseNo column in CourseTaken table.
3. Deletion of record in Course table.

=====================
Action(s)
=====================

Abort -> Cancel the updation
Instead of -> Modify the updation

1. Insert to PhDStudent table. (Abort the insertion if it don't meet the constraints)
2. Update to StudentNo or CourseNo column in CourseTaken table. (Abort the updation if it don't meet the constraints)
3. Deletion of record in Course table. (Abort the deletion if it don't meet the constraints)

*/

/*
=================================
Trigger for 1st event(s)
=================================
*/

select * from PhDStudent;
select * from Course;
select * from CourseTaken;

GO
CREATE TRIGGER on_phd_student_insert_atleast_one_course
ON PhDStudent
AFTER INSERT
AS
IF EXISTS (
    SELECT * FROM inserted I
    WHERE NOT EXISTS (
        SELECT *
        FROM CourseTaken CT
        WHERE I.StudentNo = CT.StudentNo
    )
)
BEGIN

RAISERROR('[[ Constraint Error ]]: A PhD student must take at least one course.', 1, 1)

ROLLBACK

END
GO

/*====================================================================================================================*/

/*
=================================
Trigger for 2nd event(s)
=================================
*/
GO
CREATE TRIGGER on_professor_update
ON Professor
AFTER UPDATE
AS
IF EXISTS (
    SELECT * FROM inserted I, PhDStudent P
    WHERE P.Supervisor = I.ProfNo 
    AND I.Laboratory != P.Laboratory
)
BEGIN

UPDATE PhDStudent
SET Laboratory = ( SELECT I.Laboratory FROM inserted I WHERE I.ProfNo = Supervisor )
WHERE Supervisor = ( SELECT I2.ProfNo FROM inserted I2 )

END

/*====================================================================================================================*/

/*
=================================
Trigger for 4th event(s)
=================================
*/

GO
CREATE TRIGGER on_professor_delete
ON Professor
AFTER DELETE
AS
IF EXISTS (
    SELECT * FROM deleted D, PhDStudent P
    WHERE P.Supervisor = D.ProfNo
    AND D.Laboratory = P.Laboratory
)
BEGIN

RAISERROR('[[ Constraint Error ]]: A PhD student must work in the same laboratory as his/her supervisor', 1, 1)

ROLLBACK

END
