use temporal_db;

select * from Employee
select * from Department

select E.FName as "First Name", E.LName as "Last Name"
from Department D, Employee E, EmployeeAddress EA
where D.DName = 'Research' and E.SSN = EA.SSN and EA.ToDate >= GETDATE() and EA.FromDate < GETDATE() and EA.City = 'Houston' and D.ToDate >= GETDATE()

