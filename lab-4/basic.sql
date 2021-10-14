create database temporal_db;
GO
use temporal_db;

create table Employee (
    SSN int not null,
    FName varchar(25) not null,
    MInit char(1),
    LName varchar(25) not null,
    BirthDate smalldatetime not null,
    Sex char(1) not null,
    constraint PK_employee primary key (SSN),
);

create table EmployeeSalary (
    SalaryID int not null,
    ES_Salary int not null,
    ES_start_date smalldatetime not null,
    ES_end_date smalldatetime not null,
    SSN int not null,
    constraint PK_employee_salary primary key (SalaryID),
    constraint FK_employee_salary foreign key (SSN) references (Employee.SSN)
)

create table EmployeeAddress (
    AddressID int not null,
    EA_StreetNo varchar(25) not null,
    EA_City varchar(25) not null,
    EA_Zip char(10) not null,
    EA_State varchar(25) not null,
    SSN int not null,
    constraint PK_employee_address primary key (AddressID),
    constraint FK_employee_address foreign key (SSN) references (Employee.SSN)
)