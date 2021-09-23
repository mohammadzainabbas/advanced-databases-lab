create database PhD;
GO
use PhD;

create table Professor (
  ProfNo char(5) not null,
  Name varchar(25) not null, 
  Laboratory varchar(25) not null,
  constraint PK_Professor primary key (ProfNo)
)
create table PhDStudent (
  StudentNo char(9) not null,
  Name varchar(25) not null,
  Laboratory varchar(25),
  Supervisor char(5),
  constraint PK_PhDStudent primary key (StudentNo),
  constraint FK_PhDStudent_Professor 
     foreign key (Supervisor) references Professor(ProfNo)
)
create table Course (
  CourseNo char(7) not null,
  Title varchar(30) not null,
  ProfNo char(5),
  constraint PK_Course primary key (CourseNo),
  constraint FK_Course_Professor 
     foreign key (ProfNo) references Professor(ProfNo)
)
create table CourseTaken (
  StudentNo char(9) not null,
  CourseNo char(7) not null,
  constraint PK_CourseTaken primary key (StudentNo,CourseNo),
  constraint FK_CourseTaken_Student 
     foreign key (StudentNo) references PhDStudent(StudentNo),
  constraint FK_CourseTaken_Course 
     foreign key (CourseNo) references Course(CourseNo)
)



