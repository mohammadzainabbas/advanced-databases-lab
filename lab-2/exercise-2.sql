use Lab_2

/*
-------------------------------
Exercise - 2
-------------------------------

- The supervisor of an employee must be older than the employee.

*/

select * from Employee

CREATE TRIGGER no_older_employee_for_poor_supervisor
on Employee
after INSERT, UPDATE
AS
if exists(
    SELECT *
    from inserted I, Employee E
    WHERE ((I.SuperSSN = E.SSN) and (I.BDate < E.BDate)) /* For insertion/updation of employee */
    or ((I.SSN = E.SuperSSN) and (I.BDate > E.BDate))
)
BEGIN
    RAISERROR('Constraint Violation: The age of an employee must be less than the age of his/her supervisor', 1, 1)

    ROLLBACK
END
