use Lab_2

/*
-------------------------------
Exercise - 6
-------------------------------

- The hire date of employees must be greater than their birth date.

=> It can be done with triggers too.

*/

select * from Employee

alter table Employee
add constraint employee_hire_date_must_be_greater_than_birth_date
check ( HireDate > BDate )

