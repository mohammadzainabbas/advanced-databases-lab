use Lab_2

/*
-------------------------------
Exercise - 4
-------------------------------

- The manager of a department must be an employee of that department.

=> It can be done with triggers too but we need two triggers here (one for each table "Employee" & "Department")

*/

select * from Employee
select * from Department

/*
1.1 Add unique constraint for (SSN + Dept. No.) for Employee table
*/

alter table Employee
add constraint manager_should_be_employee_of_that_department__employee_table
unique ( SSN, DNo )

/*
1.2 Add foreign constraint for (MgrSSN + DNumber) for Department table with (SSN + Dept. No.) from Employee table
*/

alter table Department
add constraint manager_should_be_employee_of_that_department__department_table
foreign key( MgrSSN, DNumber )
references Employee( SSN, DNo )

