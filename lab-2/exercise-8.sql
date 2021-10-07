use Lab_2

/*
-------------------------------
Exercise - 8
-------------------------------

- The attribute Department.NbrEmployees is a derived attribute from Employee.DNo

*/

select * from Employee
select * from Department

create trigger derive_attribute_for_no_of_employees
on Employee
after insert, update, delete
AS
BEGIN

    update D
    set nbrEmployees = (select COUNT(*) from Employee E where E.DNo = D.DNumber)
    from Department D
    where D.DNumber in ( select distinct I.DNo from inserted I ) or D.DNumber in ( select distinct DD.DNo from deleted DD )

/*

-------------------------------------------------------------------------------------------------
The below one will not work in SQL Server but it will work in Oracle, MySQL and other SQL DBMS.

https://stackoverflow.com/questions/4981481/how-to-write-update-sql-with-table-alias-in-sql-server-2008
-------------------------------------------------------------------------------------------------

update Department D
set nbrEmployees = (select COUNT(*) from Employee E where E.DNo = D.DNumber)
where D.DNumber in ( select distinct I.DNo from inserted I ) or D.DNumber in ( select distinct DD.DNo from deleted DD )

*/

END
