use temporal_db;

SELECT name
from sys.tables

select * from EmployeeSalary;

with instants as (
    select distinct E.FromDate from EmployeeSalary E
    UNION
    select distinct E.ToDate from EmployeeSalary E
)
select * from instants