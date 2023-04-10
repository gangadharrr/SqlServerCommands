INSERT into dbo.Student values ('Gangadhar',39110202,20,'gangadharganga90@gmail.com','8919768667','01/06/2002','CSE',1);
INSERT into dbo.Student values ('Chandu',39110220,21,'chandhuman@gmail.com','837130215','01/12/2002','CSE',1);
INSERT into dbo.Student values ('Vikram',39110721,20,'Vivcka@gmail.com','836651628','12/21/2002','ECE',2);


UPDATE dbo.Student SET dateofbirth = '06/01/2002' where Id= 39110202;
UPDATE dbo.Student SET dateofbirth = '12/01/2002' where Id= 39110220;

Alter table dbo.Student ADD department nchar(5) NULL;
UPDATE dbo.Student SET department = 'CSE' where Id= 39110202;
UPDATE dbo.Student SET department = 'ECE' where Id= 39110220;
UPDATE dbo.Student SET department = 'EEE' where Id= 39110721;
select * from dbo.Student;

INSERT into dbo.Student values ('ABC',39110301,20,'ABC@gmail.com','987654321','01/06/2002','CSE',3);
INSERT into dbo.Student values ('XYZ',39110222,21,'XYZ@gmail.com','987654567','01/12/2002','MECH',4);
INSERT into dbo.Student values ('PQR',39110731,20,'PQR@gmail.com','876545678','12/21/2002','EEE',5);
alter table dbo.student add constraint DEPT_TYPE foreign key (department) references dbo.[department name] (deptname);


Alter table dbo.[Department Name] alter column DeptName nchar(5) null;
Alter table dbo.[student] alter column department nchar(10) not null;

CREATE TABLE EMPLOYEE IF NOT EXISTS 