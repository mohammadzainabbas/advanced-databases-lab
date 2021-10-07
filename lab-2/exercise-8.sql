use Lab_2

/*
-------------------------------
Exercise - 7
-------------------------------

- A supervisor must be hired at least 1 year before every employee s/he supervises.

*/

select * from Employee

create trigger superVisor_must_be_hired_one_year_before_supervised_employees
on Employee
after insert, update 
as
if exists(
    select * 
    from Inserted I, Employee E
    where
     ( I.SuperSSN = E.SSN and DATEDIFF( YEAR, E.HireDate, I.HireDate ) < 1 )
    or
     ( E.SuperSSN = I.SSN and DATEDIFF( YEAR, I.HireDate, E.HireDate ) < 1 )
)
BEGIN

    RAISERROR('Sorry dude! You can not have an employee with a manager having less than 1 year of experience. Now go home and cry ...', 1, 1)

    ROLLBACK

END
