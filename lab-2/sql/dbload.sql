Begin transaction
use Lab_2
delete from Dependent
delete from DeptLocations
delete from WorksOn
delete from Project
delete from Department
delete from Employee
alter table Employee
  nocheck constraint FK_Employee_Employee
alter table Employee
  nocheck constraint FK_Employee_Department
set dateformat dmy
INSERT Employee values(
'John', 'B', 'Smith', '123456789', '09-05-1955',
'731 Fondren, Houston, TX', 'M', 30000, '333445555', 5, '01-01-1985')
INSERT Employee values(
'Franklin', 'T', 'Wong', '333445555', '08-12-1945',
'638 Voss, Houston, TX', 'M', 40000, '888665555', 5, '01-01-1982')
INSERT Employee values(
'Alicia', 'J', 'Zelaya', '999887777', '19-07-1958',
'3321 Castle, Spring, TX', 'F', 25000, '987654321', 4, '01-01-1985')
INSERT Employee values(
'Jennifer', 'S', 'Wallace', '987654321', '20-06-1931',
'291 Berry, Bellaire, TX', 'F', 43000, '888665555', 4, '01-01-1982')
INSERT Employee values(
'Ramesh', 'K', 'Narayan', '666884444', '15-09-1952',
'975 Fire Oak, Humble, TX', 'M', 38000, '333445555', 5, '01-01-1985')
INSERT Employee values(
'Joyce', 'A', 'English', '453453453', '31-07-1962',
'5631 Rice, Houston, TX', 'F', 25000, '333445555', 5, '01-01-1985')
INSERT Employee values(
'Ahmad', 'V', 'Jabbar', '987987987', '29-03-1959',
'980 Dallas, Houston, TX', 'M', 25000, '987654321', 4, '01-01-1985')
INSERT Employee values(
'James', 'A', 'Borg', '888665555', '10-11-1927',
'450 Stone, Houston, TX', 'M', 55000, NULL, 1, '01-01-1980')
alter table Employee
  check constraint FK_Employee_Employee
alter table Employee
  check constraint FK_Employee_Department
INSERT Department values('Research', 5, '333445555', '22-05-1978', 4)
INSERT Department values('Administration', 4, '987654321', '01-01-1985', 3)
INSERT Department values('Headquarters', 1, '888665555', '19-06-1971', 1)
INSERT DeptLocations values(1, 'Houston')
INSERT DeptLocations values(4, 'Stafford')
INSERT DeptLocations values(5, 'Bellaire')
INSERT DeptLocations values(5, 'Sugarland')
INSERT DeptLocations values(5, 'Houston')
INSERT Project values('ProductX', 1, 'Bellaire', 5)
INSERT Project values('ProductY', 2, 'Sugarland', 5)
INSERT Project values('ProductZ', 3, 'Houston', 5)
INSERT Project values('Computerization', 10, 'Stafford', 4)
INSERT Project values('Reorganization', 20, 'Houston', 1)
INSERT Project values('Newbenefits', 30, 'Stafford', 4)
INSERT WorksOn values('123456789', 1, 32.5)
INSERT WorksOn values('123456789', 2, 7.5)
INSERT WorksOn values('333445555', 1, 10)
INSERT WorksOn values('333445555', 2, 10)
INSERT WorksOn values('333445555', 3, 20)
INSERT WorksOn values('453453453', 1, 20)
INSERT WorksOn values('453453453', 2, 20)
INSERT WorksOn values('666884444', 3, 40)
INSERT WorksOn values('888665555', 20, 30.0)
INSERT WorksOn values('987654321', 10, 5.0)
INSERT WorksOn values('987654321', 20, 15.0)
INSERT WorksOn values('987654321', 30, 20.0)
INSERT WorksOn values('987987987', 10, 35.0)
INSERT WorksOn values('987987987', 30, 5.0)
INSERT WorksOn values('999887777', 10, 10.0)
INSERT WorksOn values('999887777', 30, 30.0)
INSERT Dependent values('333445555', 'Alice', 'F', '05-04-1976', 'Daughter')
INSERT Dependent values('333445555', 'Theodore', 'M', '25-10-1973', 'Son')
INSERT Dependent values('333445555', 'Joy', 'F', '03-05-1948', 'Spouse')
INSERT Dependent values('987654321', 'Abner', 'M', '29-02-1932', 'Spouse')
INSERT Dependent values('123456789', 'Michael', 'M', '01-01-1978', 'Son')
INSERT Dependent values('123456789', 'Alice', 'F', '31-12-1978', 'Daughter')
INSERT Dependent values('123456789', 'Elizabeth', 'F', '05-05-1957', 'Spouse')
commit
