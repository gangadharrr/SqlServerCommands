USE [master]
GO
/****** Object:  Database [Practice Database]    Script Date: 06-04-2023 11:41:07 ******/
CREATE DATABASE [Practice Database]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Practice Database', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Practice Database.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Practice Database_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Practice Database_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Practice Database] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Practice Database].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Practice Database] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Practice Database] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Practice Database] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Practice Database] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Practice Database] SET ARITHABORT OFF 
GO
ALTER DATABASE [Practice Database] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Practice Database] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Practice Database] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Practice Database] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Practice Database] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Practice Database] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Practice Database] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Practice Database] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Practice Database] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Practice Database] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Practice Database] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Practice Database] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Practice Database] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Practice Database] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Practice Database] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Practice Database] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Practice Database] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Practice Database] SET RECOVERY FULL 
GO
ALTER DATABASE [Practice Database] SET  MULTI_USER 
GO
ALTER DATABASE [Practice Database] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Practice Database] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Practice Database] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Practice Database] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Practice Database] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Practice Database] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Practice Database', N'ON'
GO
ALTER DATABASE [Practice Database] SET QUERY_STORE = ON
GO
ALTER DATABASE [Practice Database] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Practice Database]
GO
/****** Object:  UserDefinedTableType [dbo].[EMPLOYEELIST]    Script Date: 06-04-2023 11:41:07 ******/
CREATE TYPE [dbo].[EMPLOYEELIST] AS TABLE(
	[EMPNAME] [varchar](50) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[SINGLE_COL]    Script Date: 06-04-2023 11:41:07 ******/
CREATE TYPE [dbo].[SINGLE_COL] AS TABLE(
	[VALUES_ONE] [int] NULL
)
GO
/****** Object:  UserDefinedFunction [dbo].[COUNT_OF_VAL_IN_RANGE]    Script Date: 06-04-2023 11:41:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[COUNT_OF_VAL_IN_RANGE] (@TB_NAME SINGLE_COL READONLY ,@START INT,@END INT) 
RETURNS INT--RETURNS @CNT TABLE(COUNT_VAL INT)
AS
BEGIN
	DECLARE @SUBQUERY VARCHAR(MAX)
	RETURN(SELECT COUNT(*) FROM @TB_NAME)
END
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 06-04-2023 11:41:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[empId] [int] IDENTITY(1,1) NOT NULL,
	[empName] [nchar](30) NULL,
	[dateOfBirth] [datetime] NULL,
	[department] [nchar](30) NULL,
	[technology] [nchar](30) NULL,
	[baseLocation] [nchar](30) NULL,
	[salary] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[empId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[EXE_EMPLOYEE]    Script Date: 06-04-2023 11:41:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[EXE_EMPLOYEE] () RETURNS TABLE
AS	RETURN(SELECT * FROM EMPLOYEE)
GO
/****** Object:  Table [dbo].[Department name]    Script Date: 06-04-2023 11:41:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department name](
	[Id] [int] NOT NULL,
	[DeptName] [nchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOGS]    Script Date: 06-04-2023 11:41:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOGS](
	[TRANSACTION_TIME] [datetime] NULL,
	[ID] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 06-04-2023 11:41:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[name] [nvarchar](50) NULL,
	[Id] [int] NOT NULL,
	[age] [int] NULL,
	[email] [text] NULL,
	[phone number] [nchar](10) NULL,
	[dateofbirth] [date] NULL,
	[department] [nchar](10) NOT NULL,
	[faculty incharge] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Department name] ([Id], [DeptName]) VALUES (106, N'CIVIL     ')
INSERT [dbo].[Department name] ([Id], [DeptName]) VALUES (101, N'CSE       ')
INSERT [dbo].[Department name] ([Id], [DeptName]) VALUES (103, N'ECE       ')
INSERT [dbo].[Department name] ([Id], [DeptName]) VALUES (104, N'EEE       ')
INSERT [dbo].[Department name] ([Id], [DeptName]) VALUES (102, N'IT        ')
INSERT [dbo].[Department name] ([Id], [DeptName]) VALUES (108, N'MATH      ')
INSERT [dbo].[Department name] ([Id], [DeptName]) VALUES (105, N'MECH      ')
INSERT [dbo].[Department name] ([Id], [DeptName]) VALUES (107, N'PHY       ')
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([empId], [empName], [dateOfBirth], [department], [technology], [baseLocation], [salary]) VALUES (1, N'name1                         ', CAST(N'2000-01-01T00:00:00.000' AS DateTime), N'banking                       ', N'csharp                        ', N'chennai                       ', 2000)
INSERT [dbo].[Employee] ([empId], [empName], [dateOfBirth], [department], [technology], [baseLocation], [salary]) VALUES (2, N'name2                         ', CAST(N'2000-01-02T00:00:00.000' AS DateTime), N'health                        ', N'java                          ', N'chennai                       ', 2030)
INSERT [dbo].[Employee] ([empId], [empName], [dateOfBirth], [department], [technology], [baseLocation], [salary]) VALUES (3, N'name3                         ', CAST(N'2001-12-03T00:00:00.000' AS DateTime), N'retail                        ', N'python                        ', N'banglore                      ', 6500)
INSERT [dbo].[Employee] ([empId], [empName], [dateOfBirth], [department], [technology], [baseLocation], [salary]) VALUES (4, N'name4                         ', CAST(N'2000-11-15T00:00:00.000' AS DateTime), N'banking                       ', N'.net                          ', N'chennai                       ', 3000)
INSERT [dbo].[Employee] ([empId], [empName], [dateOfBirth], [department], [technology], [baseLocation], [salary]) VALUES (5, N'name5                         ', CAST(N'2002-05-20T00:00:00.000' AS DateTime), N'finance                       ', N'html                          ', N'chennai                       ', 2500)
INSERT [dbo].[Employee] ([empId], [empName], [dateOfBirth], [department], [technology], [baseLocation], [salary]) VALUES (6, N'name6                         ', CAST(N'2004-12-03T00:00:00.000' AS DateTime), N'retail                        ', N'python                        ', N'banglore                      ', 4000)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
INSERT [dbo].[LOGS] ([TRANSACTION_TIME], [ID]) VALUES (CAST(N'2023-04-06T09:48:17.500' AS DateTime), N'1803600d-81b4-4a65-95f0-207b2809c422')
GO
INSERT [dbo].[Student] ([name], [Id], [age], [email], [phone number], [dateofbirth], [department], [faculty incharge]) VALUES (N'Gangadhar', 39110202, 20, N'gangadharganga90@gmail.com', N'8919768667', CAST(N'2002-06-01' AS Date), N'CSE       ', 1)
INSERT [dbo].[Student] ([name], [Id], [age], [email], [phone number], [dateofbirth], [department], [faculty incharge]) VALUES (N'Chandu', 39110220, 21, N'chandhuman@gmail.com', N'837130215 ', CAST(N'2002-12-01' AS Date), N'ECE       ', 1)
INSERT [dbo].[Student] ([name], [Id], [age], [email], [phone number], [dateofbirth], [department], [faculty incharge]) VALUES (N'XYZ', 39110222, 21, N'XYZ@gmail.com', N'987654567 ', CAST(N'2002-01-12' AS Date), N'MECH      ', 4)
INSERT [dbo].[Student] ([name], [Id], [age], [email], [phone number], [dateofbirth], [department], [faculty incharge]) VALUES (N'ABC', 39110301, 20, N'ABC@gmail.com', N'987654321 ', CAST(N'2002-01-06' AS Date), N'CSE       ', 3)
INSERT [dbo].[Student] ([name], [Id], [age], [email], [phone number], [dateofbirth], [department], [faculty incharge]) VALUES (N'Rahul', 39110342, 27, N'rahul@gmail.com', N'8923473992', CAST(N'2000-07-21' AS Date), N'PHY       ', 6)
INSERT [dbo].[Student] ([name], [Id], [age], [email], [phone number], [dateofbirth], [department], [faculty incharge]) VALUES (N'Vikram', 39110721, 20, N'Vivcka@gmail.com', N'836651628 ', CAST(N'2002-12-21' AS Date), N'EEE       ', 2)
INSERT [dbo].[Student] ([name], [Id], [age], [email], [phone number], [dateofbirth], [department], [faculty incharge]) VALUES (N'PQR', 39110731, 20, N'PQR@gmail.com', N'876545678 ', CAST(N'2002-12-21' AS Date), N'EEE       ', 5)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Departme__5E50826558D084AD]    Script Date: 06-04-2023 11:41:07 ******/
ALTER TABLE [dbo].[Department name] ADD UNIQUE NONCLUSTERED 
(
	[DeptName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [DEPT_TYPE] FOREIGN KEY([department])
REFERENCES [dbo].[Department name] ([DeptName])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [DEPT_TYPE]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [studentincharge] FOREIGN KEY([faculty incharge])
REFERENCES [dbo].[Employee] ([empId])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [studentincharge]
GO
/****** Object:  StoredProcedure [dbo].[Department_name_WITH_TRY_CATCH]    Script Date: 06-04-2023 11:41:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[Department_name_WITH_TRY_CATCH] @ID INT,@DEPT VARCHAR(5)
AS
BEGIN TRY
insert into [Department name] values(@ID,@DEPT);
SELECT * FROM [Department name]
END TRY
BEGIN CATCH
PRINT('error DUPLICATE KEY '+CAST(@ID AS VARCHAR(5)))
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[DISPLAY_ALL_TABLES]    Script Date: 06-04-2023 11:41:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DISPLAY_ALL_TABLES]
AS
SELECT 'DEPARTMENT TABLE'
SELECT *FROM [Department name]
SELECT 'EMPLOYEE TABLE'
SELECT * FROM Employee
SELECT 'STUDENT TABLE'
SELECT * FROM  Student
GO
/****** Object:  StoredProcedure [dbo].[DISPLAY_DETAILS]    Script Date: 06-04-2023 11:41:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DISPLAY_DETAILS]
AS
select * from Employee 
GO;
GO
/****** Object:  StoredProcedure [dbo].[DISPLAY_DETAILS_AT_LOCATION]    Script Date: 06-04-2023 11:41:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DISPLAY_DETAILS_AT_LOCATION] @PLACE CHAR(50)
AS
select * from Employee WHERE baseLocation=@PLACE
GO
/****** Object:  StoredProcedure [dbo].[EMPLOYEE_WITH_SALARY_RANGE]    Script Date: 06-04-2023 11:41:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[EMPLOYEE_WITH_SALARY_RANGE] (@START INT, @END INT, @EMP_NAME  VARCHAR(MAX) OUTPUT)
AS
SELECT @EMP_NAME = ISNULL(@EMP_NAME + ',', '(') + TRIM(CAST(EMPNAME AS VARCHAR)) FROM Employee WHERE salary>=@START AND salary<=@END
SET @EMP_NAME=TRIM(@EMP_NAME)+')'
GO
/****** Object:  StoredProcedure [dbo].[INSERTDETAILSDEPARTMENT]    Script Date: 06-04-2023 11:41:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INSERTDETAILSDEPARTMENT] @IDNUM INT,@DEPT VARCHAR(20)
AS
INSERT INTO [Department name] VALUES (@IDNUM,@DEPT)
GO
/****** Object:  StoredProcedure [dbo].[SORTBY_COLUMN]    Script Date: 06-04-2023 11:41:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SORTBY_COLUMN] @TABLE_NAME VARCHAR(50), @COLUMN_NAME VARCHAR(50), @SORTBY NCHAR(5)='ASC'
AS
DECLARE @SUBQUERY VARCHAR(1000);
SET @SUBQUERY='SELECT * FROM '+@TABLE_NAME+' ORDER BY '+@COLUMN_NAME+' '+@SORTBY
EXEC(@SUBQUERY)
GO
/****** Object:  StoredProcedure [dbo].[SORTBY_COLUMN_DESC]    Script Date: 06-04-2023 11:41:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SORTBY_COLUMN_DESC] @TABLE_NAME VARCHAR(50), @COLUMN_NAME VARCHAR(50)
AS
DECLARE @SUBQUERY VARCHAR(1000);
SET @SUBQUERY='SELECT * FROM '+@TABLE_NAME+' ORDER BY '+@COLUMN_NAME+' DESC'
EXEC(@SUBQUERY)
GO
USE [master]
GO
ALTER DATABASE [Practice Database] SET  READ_WRITE 
GO
