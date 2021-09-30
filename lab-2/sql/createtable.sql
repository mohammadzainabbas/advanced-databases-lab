create table Employee (
  FName varchar(15) not null,
  MInit char(1),
  LName varchar(15) not null,
  SSN char(9) not null,
  BDate smalldatetime null,
  Address varchar(30),
  Sex char(1),
  Salary decimal(18,2),
  SuperSSN char(9),
  DNo int not null,
  HireDate smalldatetime null,
  constraint PK_Employee primary key (SSN),
  constraint FK_Employee_Employee foreign key (SuperSSN) references Employee (SSN),
) 
create table Department (
  DName varchar(15) not null,
  DNumber int not null,
  MgrSSN char(9) not null,
  MgrStartDate smalldatetime,
  nbrEmployees int,
  constraint PK_Department primary key (DNumber),
  constraint FK_Department_Employee foreign key (MgrSSN) references Employee (SSN) 
    on delete cascade on update cascade 
) 
alter table Employee
  add constraint FK_Employee_Department foreign key (DNo) references Department (DNumber)
create table Project (
  PName varchar(15) not null,
  PNumber int not null,
  PLocation varchar(15),
  DNumber int not null,
  constraint PK_Project primary key (PNumber),
  constraint FK_Project_Department foreign key (DNumber) references Department (DNumber)
) 
create table DeptLocations (
  DNumber int not null,
  DLocation varchar(15) not null,
  constraint PK_Dept_Locations primary key (DNumber,DLocation),
  constraint FK_Dept_Locations_Department foreign key (DNumber) references Department (DNumber)
) 
create table Dependent (
  ESSN char(9) not null,
  DependentName varchar(15) not null,
  Sex char(1),
  BDate smalldatetime null,
  Relationship varchar(8),
  constraint PK_Dependent primary key (ESSN,DependentName),
  constraint FK_Dependent_Employee foreign key (ESSN) references Employee (SSN)
) 
create table WorksOn (
  ESSN char(9) not null,
  PNo int not null,
  hours decimal(18,1) not null,
  constraint PK_WorksOn primary key (ESSN,PNo),
  constraint FK_WorksOn_Employee foreign key (ESSN) references Employee (SSN),
  constraint FK_WorksOn_Project foreign key (PNo) references Project (PNumber)
) 

