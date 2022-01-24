use Lab_2

/*
-------------------------------
Exercise - 3
-------------------------------

- The salary of an employee can not be greater than the salary of his/her supervisor.

*/

GO
CREATE TRIGGER no_employee_earns_more_than_their_poor_supervisor
on Employee
after INSERT, UPDATE
AS
if exists(
    SELECT *
    from inserted I, Employee E
    WHERE ((I.SuperSSN = E.SSN) and (I.Salary > E.Salary)) /* For insertion/updation of employee */
    or ((I.SSN = E.SuperSSN) and (I.Salary < E.Salary)) /* For insertion/updation of supervisor */
)
BEGIN
    RAISERROR('Constraint Violation: The salary of an employee can not be greater than the salary of his/her supervisor', 1, 1)

    ROLLBACK
END
