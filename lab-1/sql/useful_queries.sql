-- drop database
use master
alter database PhD set single_user with rollback immediate
drop database PhD

-- List triggers
SELECT  name
FROM sys.triggers  
WHERE type = 'TR';

-- drop trigger <trigger_name>;
drop trigger FirstExample;


-- Tests
-- First trigger laboratory of supervisor is database
INSERT PhDStudent (StudentNo, Name, Laboratory, Supervisor) values 
('453453454', 'Joyce A. English', 'Web Technologies', '12345')
