use Lab_2

/*
-------------------------------
Exercise - 1
-------------------------------

- The age of employees must be greater than 18.

*/

alter table Employee
add CONSTRAINT employee_age_greater_than_18
CHECK( datediff( year, BDate, getdate() ) > 18 )

-- delete from Employee where SSN = 1234321

-- select * from Employee
-- insert into Employee values ('Zain', 'M', 'Abbas', 1234321, DATEADD( YEAR, -19, GETDATE()), 'Avenue de la Couronne 365', 'M', 200000, null, 1, GETDATE());