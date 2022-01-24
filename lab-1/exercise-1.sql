/*

==========================================
Exercise No. 1
==========================================

=====================
Constraint(s)
=====================

A PhD student must work in the same laboratory as his/her supervisor.

=====================
Event(s)
=====================

1. Insert to PhDStudent table.
2. Update to Lab or Supervisor column in PhDStudent table.
3. Update to Lab in Professor table.
4. Deletion of record in Professor table.

=====================
Action(s)
=====================

Abort -> Cancel the updation
Instead of -> Modify the updation

1. Insert to PhDStudent table. (Abort the insertion if it don't meet the constraints)
2. Update to Lab or Supervisor column in PhDStudent table. (Abort the insertion if it don't meet the constraints)
3. Update to Lab in Professor table. (Modify the labs in PhDStudent table for that professor in order to meet the constraints)
4. Deletion of record in Professor table.
    => Abort and show error
    => Delete the PhDstudents as well

*/

/*
=================================
Trigger for 1st & 2nd event(s)
=================================
*/

CREATE TRIGGER on_phd_student_insert_and_update
ON PhDStudent
AFTER UPDATE, INSERT
AS
IF EXISTS (
    SELECT * FROM inserted I, Professor P
    WHERE I.Supervisor = P.ProfNo 
    AND I.Laboratory != P.Laboratory
)
BEGIN

RAISERROR('[[ Constraint Error ]]: A PhD student must work in the same laboratory as his/her supervisor', 1, 1)

ROLLBACK

END

/*
Checking for no. 1
*/
USE PhD
INSERT INTO PhDStudent (StudentNo, Name, Laboratory, Supervisor)
VALUES ('12345678', 'Mohammad Zain Abbas', 'Databases', '66688')

/*
Checking for no. 2
*/
USE PhD
UPDATE PhDStudent
SET Laboratory = 'Networks'
WHERE StudentNo = '12345678'

/*====================================================================================================================*/

/*
=================================
Trigger for 3rd event(s)
=================================
*/
