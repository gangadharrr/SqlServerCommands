CREATE OR ALTER PROCEDURE INSERT_DETAILS @USERNAME VARCHAR(30),
                        @PASSWORD_U VARCHAR(50),
                        @EMAIL VARCHAR(320),
                        @PHONENUMBER VARCHAR(10),
                        @COMPANYNAME VARCHAR(30),
                        @DESIGNATION VARCHAR(30) AS
INSERT INTO USERS VALUES
(@USERNAME,
HASHBYTES('MD5',@PASSWORD_U),
@EMAIL,
@PHONENUMBER,
@COMPANYNAME,
@DESIGNATION
);
GO
CREATE OR ALTER PROCEDURE FETCH_PASSWORD @EMAIL VARCHAR(320)
AS
SELECT PASSWORD_U FROM USERS WHERE EMAIL=TRIM(@EMAIL);
GO
CREATE OR ALTER PROCEDURE UPDATE_PASSWORD @EMAIL VARCHAR(320),@PASSWORD_U VARCHAR(50)
AS
UPDATE USERS SET PASSWORD_U = HASHBYTES('MD5',@PASSWORD_U) WHERE EMAIL=TRIM(@EMAIL);
GO
CREATE OR ALTER PROCEDURE FETCH_DETAILS @EMAIL VARCHAR(320)
AS
SELECT * FROM USERS WHERE EMAIL=TRIM(@EMAIL);
GO
CREATE OR ALTER PROCEDURE FETCH_DETAILS_ALL
AS
SELECT * FROM USERS;
GO
CREATE OR ALTER PROCEDURE FETCH_APPOINTMENT_DETAILS @EMAIL VARCHAR(320)
AS
SELECT * FROM APPOINTMENTS WHERE COLLABORATOREMAIL=TRIM(@EMAIL);
GO
CREATE OR ALTER PROCEDURE INSERT_APPOINTMENT_DETAILS 
                                    @EMAIL VARCHAR(320),
                                    @COLLABORATOREMAIL VARCHAR(320),
                                    @MEETINGTITLE VARCHAR(50),
                                    @MEETINGDESCRIPTION VARCHAR(1000),
                                    @STARTTIME DATETIME,
                                    @ENDTIME DATETIME,
                                    @MEETINGURL TEXT      
AS
INSERT INTO APPOINTMENTS 
SELECT 
USERNAME,
@EMAIL,
PHONENUMBER,
COMPANYNAME,
DESIGNATION ,
@COLLABORATOREMAIL,
@MEETINGTITLE,
@MEETINGDESCRIPTION,
@STARTTIME ,
@ENDTIME ,
@MEETINGURL  FROM USERS WHERE EMAIL=TRIM(@EMAIL);
GO
IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'Appointment Scheduler')  
CREATE DATABASE [Appointment Scheduler];
USE [Appointment Scheduler];

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Users' and xtype='U')
BEGIN
    CREATE TABLE USERS (
        USERNAME VARCHAR(30),
        PASSWORD_U VARBINARY(MAX),
        EMAIL VARCHAR(320)PRIMARY KEY,
        PHONENUMBER VARCHAR(10),
        COMPANYNAME VARCHAR(30),
        DESIGNATION VARCHAR(30)
    )
END
INSERT INTO USERS VALUES
('Gangadhar',
HASHBYTES('MD5','Genius@123'),
'gangadharganga90@gmail.com',
'8919768667',
'Presidio',
'Associate Engineer'
);

SELECT* FROM USERS
--DROP TABLE USERS;
declare @email varchar(320);
set @email='rahul@gmail.com';
SELECT PASSWORD_U FROM USERS WHERE EMAIL=@EMAIL
--EXEC INSERT_DETAILS 'Gangadhar','ganga_dharr','Genius@123','gangadharganga90@gmail.com','8919768667','Presidio','Associate Engineer'
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Appointments' and xtype='U')
BEGIN
    CREATE TABLE APPOINTMENTS (
        ID INT IDENTITY(1,1) PRIMARY KEY,
        USERNAME VARCHAR(30),
        EMAIL VARCHAR(320),
        PHONENUMBER VARCHAR(10),
        COMPANYNAME VARCHAR(30),
        DESIGNATION VARCHAR(30),
        COLLABORATOREMAIL VARCHAR(320),
        MEETINGTITLE VARCHAR(50),
        MEETINGDESCRIPTION VARCHAR(1000),
        STARTTIME DATETIME,
        ENDTIME DATETIME,
        MEETINGURL TEXT,
        FOREIGN KEY(COLLABORATOREMAIL) REFERENCES USERS(EMAIL) ON DELETE CASCADE
    )
END
--DROP TABLE APPOINTMENTS
INSERT INTO APPOINTMENTS VALUES
('Gangadhar',
'gangadharganga90@gmail.com',
'8919768667',
'Presidio',
'Associate Engineer',
'rahul@gmail.com',
'Marketing Trends',
'Discussing about Current Marketing Trends for Business Analytics',
'2023-04-14 13:00:00',
'2023-04-14 15:00:00',
'https://meet.google.com/otn-hzdq-vbg'
);
INSERT INTO APPOINTMENTS VALUES
('Vivek',
'vivek@gmail.com',
'8886652106',
'Infosys',
'Software Tester',
'rahul@gmail.com',
'Client Business Strategies',
'Business Analysis of Client Requirements in current project',
'2023-04-14 14:00:00',
'2023-04-14 17:00:00',
'https://meet.google.com/otn-hzdq-vbg'
);
SELECT * FROM APPOINTMENTS;

EXEC FETCH_APPOINTMENT_DETAILS 'rahul@gmail.com';
--EXEC INSERT_APPOINTMENT_DETAILS 'vivek@gmail.com','rahul@gmail.com','Client Business Strategies','Business Analysis of Client Requirements in current project','2023-04-14 14:00:00','2023-04-14 17:00:00','https://meet.google.com/otn-hzdq-vbg';
--EXEC UPDATE_PASSWORD 'gangadharganga90@gmail.com','Gangadhar@3001';
--EXEC UPDATE_PASSWORD 'gangadharganga90@gmail.com','Genius@123';

