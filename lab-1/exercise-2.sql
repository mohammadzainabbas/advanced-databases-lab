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
CREATE TRIGGER on_course_taken_update_atleast_one_course
ON CourseTaken
AFTER UPDATE
AS
IF EXISTS (
    SELECT * FROM PhDStudent P
    WHERE NOT EXISTS (
        SELECT *
        FROM CourseTaken CT
        WHERE P.StudentNo = CT.StudentNo
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
Trigger for 3rd event(s)
=================================
*/

GO
CREATE TRIGGER on_course_delete_atleast_one_course
ON Course
AFTER DELETE
AS
IF EXISTS (
    SELECT * FROM PhDStudent P
    WHERE NOT EXISTS (
        SELECT *
        FROM CourseTaken CT
        WHERE P.StudentNo = CT.StudentNo
    )
)
BEGIN

RAISERROR('[[ Constraint Error ]]: A PhD student must take at least one course.', 1, 1)

ROLLBACK

END
GO
