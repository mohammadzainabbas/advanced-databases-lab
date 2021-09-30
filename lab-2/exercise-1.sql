use Lab_2

/*
-------------------------------
Exercise - 1
-------------------------------

- The age of employees must be greater than 18.

*/

alter table Employee
add CONSTRAINT age_no_greater_than_18
CHECK( datediff( year, BDate, getdate() ) > 18 )
