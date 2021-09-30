use PhD
delete from CourseTaken
delete from PhDStudent
delete from Course
delete from Professor
INSERT Professor (ProfNo, Name, Laboratory) values 
('12345', 'John B. Smith', 'Databases')
INSERT Professor (ProfNo, Name, Laboratory) values
('33344', 'Franklin T. Wong', 'Databases')
INSERT Professor (ProfNo, Name, Laboratory) values 
('99988', 'Alicia J. Zelaya', 'Networks')
INSERT Professor (ProfNo, Name, Laboratory) values 
('98765', 'Jennifer S. Wallace', 'Web Technologies')
INSERT Professor (ProfNo, Name, Laboratory) values
('66688', 'Ramesh K. Narayan', 'Web Technologies')

INSERT PhDStudent (StudentNo, Name, Laboratory, Supervisor) values 
('453453453', 'Joyce A. English', 'Databases', '12345')
INSERT PhDStudent (StudentNo, Name, Laboratory, Supervisor) values 
('987987987', 'Ahmad V. Jabbar', 'Databases', '33344')
INSERT PhDStudent (StudentNo, Name, Laboratory, Supervisor) values 
('888665555', 'James A. Borg', 'Web Technologies', '66688')

INSERT Course (CourseNo, Title, ProfNo) values 
('INFO364', 'Introduction to Databases', '12345')
INSERT Course (CourseNo, Title, ProfNo) values 
('INFO365', 'Advanced Databases', '33344')
INSERT Course (CourseNo, Title, ProfNo) values 
('INFO378', 'XML', '66688')
INSERT Course (CourseNo, Title, ProfNo) values 
('INFO379', 'Web Services', '66688')

INSERT CourseTaken (StudentNo, CourseNo) values 
('453453453', 'INFO364')
INSERT CourseTaken (StudentNo, CourseNo) values 
('453453453', 'INFO365')
INSERT CourseTaken (StudentNo, CourseNo) values 
('987987987', 'INFO364')
INSERT CourseTaken (StudentNo, CourseNo) values 
('987987987', 'INFO365')
INSERT CourseTaken (StudentNo, CourseNo) values 
('888665555', 'INFO378')
