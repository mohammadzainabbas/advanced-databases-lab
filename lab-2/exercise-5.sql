use Lab_2

/*
-------------------------------
Exercise - 5
-------------------------------

- The location of a project must be one of the locations of its department.

=> It can be done with triggers too but we need two triggers here (one for each table "Project" & "DeptLocations")

*/

select * from Project
select * from Department
select * from DeptLocations

/*
Add foreign constraint for (DNumber, PLocation) for Project table with (DNumber, DLocation) from DeptLocations table
*/

alter table Project
add constraint project_location_should_be_one_of_the_department_location
foreign key( DNumber, PLocation )
references DeptLocations( DNumber, DLocation )
