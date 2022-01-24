/*

==========================================
Exercise No. 3
==========================================

=====================
Constraint(s)
=====================

A PhD student must take all courses taught by his/her supervisor.

=====================
Event(s)
=====================

1. Insert to PhDStudent table.
2. Update to Supervisor column in PhDStudent table.
3. Update to ProfNo column in Course table.
4. Update to StudentNo or CourseNo column in CourseTaken table.
5. Deletion of record in CourseTaken table.
6. Deletion of record in Supervisor table.

=====================
Action(s)
=====================

Abort -> Cancel the updation
Instead of -> Modify the updation

1. Insert to PhDStudent table. (Abort the insertion if it don't meet the constraints)
2. Update to Supervisor column in PhDStudent table. (Abort the updation if it don't meet the constraints)
3. Update to ProfNo column in Course table. (Abort the updation if it don't meet the constraints)
4. Update to StudentNo or CourseNo column in CourseTaken table. (Abort the updation if it don't meet the constraints)
5. Deletion of record in CourseTaken table. (Abort the deletion if it don't meet the constraints)
6. Deletion of record in Supervisor table. (Abort the deletion if it don't meet the constraints)

*/

/*
=================================
Trigger for 1st & 2nd event(s)
=================================
*/

select * from PhDStudent;
select * from Course;
select * from CourseTaken;
select * from Professor;

GO
CREATE TRIGGER on_phd_student_insert_or_update_take_all_courses
ON PhDStudent
AFTER INSERT, UPDATE
AS
IF EXISTS (
    SELECT * FROM inserted I
    WHERE EXISTS (
        SELECT * FROM Course C
        WHERE C.ProfNo = I.Supervisor
        AND C.CourseNo NOT IN ( select CourseNo from CourseTaken CT WHERE CT.StudentNo = I.StudentNo )
    )
)
BEGIN

RAISERROR('[[ Constraint Error ]]: A PhD student must take all courses taught by his/her supervisor.', 1, 1)

ROLLBACK

END
GO

/*====================================================================================================================*/

/*
=================================
Trigger for 3rd event(s)
=================================
*/
GO
CREATE TRIGGER on_course_update_take_all_courses
ON Course
AFTER UPDATE
AS
IF EXISTS (
    SELECT * FROM inserted I
    WHERE EXISTS (
        SELECT * FROM PhDStudent P
        WHERE P.Supervisor = I.ProfNo
        AND I.CourseNo NOT IN ( select CourseNo from CourseTaken CT WHERE CT.StudentNo = P.StudentNo )
    )
)
BEGIN

RAISERROR('[[ Constraint Error ]]: A PhD student must take all courses taught by his/her supervisor.', 1, 1)

ROLLBACK

END
GO

/*====================================================================================================================*/

/*
=================================
Trigger for 4th & 5th event(s)
=================================
*/

GO
CREATE TRIGGER on_course_taken_update_or_delete_take_all_courses
ON CourseTaken
AFTER UPDATE, DELETE
AS
IF EXISTS (
    SELECT * FROM PhDStudent P
    WHERE EXISTS (
        SELECT * FROM Course C
        WHERE C.ProfNo = P.Supervisor
        AND C.CourseNo NOT IN ( select CourseNo from CourseTaken CT WHERE CT.StudentNo = P.StudentNo )
    )
)
BEGIN

RAISERROR('[[ Constraint Error ]]: A PhD student must take all courses taught by his/her supervisor.', 1, 1)

ROLLBACK

END
GO

/*
=================================
Trigger for 6th event(s)
=================================
*/

GO
CREATE TRIGGER on_professor_delete_take_all_courses
ON Professor
AFTER DELETE
AS
IF EXISTS (
    SELECT * FROM PhDStudent P
    WHERE EXISTS (
        SELECT * FROM Course C
        WHERE C.ProfNo = P.Supervisor
        AND C.CourseNo NOT IN ( select CourseNo from CourseTaken CT WHERE CT.StudentNo = P.StudentNo )
    )
)
BEGIN

RAISERROR('[[ Constraint Error ]]: A PhD student must take all courses taught by his/her supervisor.', 1, 1)

ROLLBACK

END
GO
