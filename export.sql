USE [master]
GO
/****** Object:  Database [Practice Database]    Script Date: 07-04-2023 9.31.13 AM ******/
CREATE DATABASE [Practice Database]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Practice Database', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Practice Database.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Practice Database_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Practice Database_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
ALTER DATABASE [Practice Database] SET RECOVERY SIMPLE 
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
ALTER DATABASE [Practice Database] SET QUERY_STORE = ON
GO
ALTER DATABASE [Practice Database] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Practice Database]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 07-04-2023 9.31.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[dept_number] [int] NOT NULL,
	[dept_name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[dept_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeptMaster]    Script Date: 07-04-2023 9.31.14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeptMaster](
	[DeptId] [int] NOT NULL,
	[DeptName] [nchar](25) NOT NULL,
	[DeptHod] [nchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[DeptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DupEmployeeDetails]    Script Date: 07-04-2023 9.31.14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DupEmployeeDetails](
	[EmployeeId] [int] NOT NULL,
	[EmployeeName] [nchar](30) NULL,
	[DeptID] [int] NOT NULL,
	[Dept] [nchar](25) NOT NULL,
	[Salary] [float] NULL,
	[Position] [nchar](25) NULL,
	[Location] [nchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeDetails]    Script Date: 07-04-2023 9.31.14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeDetails](
	[EmployeeId] [int] NOT NULL,
	[EmployeeName] [nchar](30) NULL,
	[DeptId] [int] NOT NULL,
	[Dept] [nchar](25) NULL,
	[Salary] [float] NULL,
	[Position] [nchar](25) NULL,
	[Location] [nchar](30) NULL,
 CONSTRAINT [PK_EMPID] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 07-04-2023 9.31.14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[ProjectId] [int] NOT NULL,
	[EmployeeId] [int] NULL,
	[Status] [nchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 07-04-2023 9.31.14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[RollNo] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Dept] [varchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[Dob] [varchar](50) NOT NULL,
	[Mail] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RollNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Department] ([dept_number], [dept_name]) VALUES (1, N'Computer Science')
INSERT [dbo].[Department] ([dept_number], [dept_name]) VALUES (2, N'Mathematics')
INSERT [dbo].[Department] ([dept_number], [dept_name]) VALUES (3, N'English')
GO
INSERT [dbo].[DeptMaster] ([DeptId], [DeptName], [DeptHod]) VALUES (101, N'CIVIL                    ', N'Hod1                          ')
INSERT [dbo].[DeptMaster] ([DeptId], [DeptName], [DeptHod]) VALUES (102, N'CSE                      ', N'Hod2                          ')
INSERT [dbo].[DeptMaster] ([DeptId], [DeptName], [DeptHod]) VALUES (103, N'ECE                      ', N'Hod3                          ')
INSERT [dbo].[DeptMaster] ([DeptId], [DeptName], [DeptHod]) VALUES (104, N'EEE                      ', N'Hod4                          ')
INSERT [dbo].[DeptMaster] ([DeptId], [DeptName], [DeptHod]) VALUES (105, N'IT                       ', N'Hod5                          ')
INSERT [dbo].[DeptMaster] ([DeptId], [DeptName], [DeptHod]) VALUES (106, N'MECH                     ', N'Hod6                          ')
GO
INSERT [dbo].[DupEmployeeDetails] ([EmployeeId], [EmployeeName], [DeptID], [Dept], [Salary], [Position], [Location]) VALUES (1005, N'ighnu                         ', 105, N'MECH                     ', 50000, N'Asso.Prof                ', N'Chennai                       ')
INSERT [dbo].[DupEmployeeDetails] ([EmployeeId], [EmployeeName], [DeptID], [Dept], [Salary], [Position], [Location]) VALUES (1011, N'sfsf                          ', 106, N'CIVIL                    ', 50000, N'Asso.Prof                ', NULL)
INSERT [dbo].[DupEmployeeDetails] ([EmployeeId], [EmployeeName], [DeptID], [Dept], [Salary], [Position], [Location]) VALUES (1014, N'jagu                          ', 106, N'CIVIL                    ', 25000, N'Prof                     ', N'Banglore                      ')
INSERT [dbo].[DupEmployeeDetails] ([EmployeeId], [EmployeeName], [DeptID], [Dept], [Salary], [Position], [Location]) VALUES (1016, N'Prb                           ', 104, N'IT                       ', 25000, N'Prof                     ', N'Coimbatore                    ')
INSERT [dbo].[DupEmployeeDetails] ([EmployeeId], [EmployeeName], [DeptID], [Dept], [Salary], [Position], [Location]) VALUES (1019, N'ssff                          ', 102, N'EEE                      ', 50000, N'Asso.Prof                ', N'Madurai                       ')
INSERT [dbo].[DupEmployeeDetails] ([EmployeeId], [EmployeeName], [DeptID], [Dept], [Salary], [Position], [Location]) VALUES (1020, N'sdvn                          ', 106, N'CIVIL                    ', 50000, N'Asso.Prof                ', N'Chennai                       ')
INSERT [dbo].[DupEmployeeDetails] ([EmployeeId], [EmployeeName], [DeptID], [Dept], [Salary], [Position], [Location]) VALUES (1031, N'sfcmf                         ', 101, N'ECE                      ', 50000, N'Asso.Prof                ', NULL)
GO
INSERT [dbo].[EmployeeDetails] ([EmployeeId], [EmployeeName], [DeptId], [Dept], [Salary], [Position], [Location]) VALUES (1009, N'EFFDF                         ', 104, N'IT                       ', 25000, N'Prof                     ', N'Coimbatore                    ')
INSERT [dbo].[EmployeeDetails] ([EmployeeId], [EmployeeName], [DeptId], [Dept], [Salary], [Position], [Location]) VALUES (1010, N'EFDF                          ', 103, N'CSE                      ', 100000, N'Prof                     ', N'Chennai                       ')
INSERT [dbo].[EmployeeDetails] ([EmployeeId], [EmployeeName], [DeptId], [Dept], [Salary], [Position], [Location]) VALUES (1012, N'ighnu                         ', 105, N'MECH                     ', 100000, N'Asso.Prof                ', N'Chennai                       ')
INSERT [dbo].[EmployeeDetails] ([EmployeeId], [EmployeeName], [DeptId], [Dept], [Salary], [Position], [Location]) VALUES (1013, N'bhi                           ', 102, N'EEE                      ', 25000, N'Prof                     ', N'Banglore                      ')
INSERT [dbo].[EmployeeDetails] ([EmployeeId], [EmployeeName], [DeptId], [Dept], [Salary], [Position], [Location]) VALUES (1014, N'jagu                          ', 106, N'CIVIL                    ', 25000, N'Prof                     ', N'Banglore                      ')
INSERT [dbo].[EmployeeDetails] ([EmployeeId], [EmployeeName], [DeptId], [Dept], [Salary], [Position], [Location]) VALUES (1016, N'EFFDF                         ', 104, N'IT                       ', 100000, N'Prof                     ', N'Chennai                       ')
GO
INSERT [dbo].[Project] ([ProjectId], [EmployeeId], [Status]) VALUES (1, 1004, N'In Progress         ')
INSERT [dbo].[Project] ([ProjectId], [EmployeeId], [Status]) VALUES (2, 1005, N'Complete            ')
INSERT [dbo].[Project] ([ProjectId], [EmployeeId], [Status]) VALUES (3, 1006, N'On Hold             ')
INSERT [dbo].[Project] ([ProjectId], [EmployeeId], [Status]) VALUES (4, 1016, N'In Progress         ')
INSERT [dbo].[Project] ([ProjectId], [EmployeeId], [Status]) VALUES (5, 1015, N'In Progress         ')
GO
INSERT [dbo].[Student] ([RollNo], [Name], [Dept], [Age], [Dob], [Mail]) VALUES (1, N'immanuel', N'IT', 22, N'03-03-2001', N'now@gmail.com')
INSERT [dbo].[Student] ([RollNo], [Name], [Dept], [Age], [Dob], [Mail]) VALUES (2, N'nowpert', N'IT', 22, N'03-03-2001', N'nowImm@gmail.com')
INSERT [dbo].[Student] ([RollNo], [Name], [Dept], [Age], [Dob], [Mail]) VALUES (3, N'another', N'CSE', 21, N'1-04-2001', N'another@gmail.com')
GO
ALTER TABLE [dbo].[EmployeeDetails]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeDetails_DeptMaster] FOREIGN KEY([DeptId])
REFERENCES [dbo].[DeptMaster] ([DeptId])
GO
ALTER TABLE [dbo].[EmployeeDetails] CHECK CONSTRAINT [FK_EmployeeDetails_DeptMaster]
GO
/****** Object:  StoredProcedure [dbo].[ChangeEmployeeName]    Script Date: 07-04-2023 9.31.14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ChangeEmployeeName]
    @oldEmployeeName nchar(50),
    @newEmployeeName nchar(50)
AS
BEGIN
    UPDATE EmployeeDetails
    SET EmployeeName = @newEmployeeName
    WHERE EmployeeName = @oldEmployeeName;
	SELECT * FROM EmployeeDetails
END
GO
/****** Object:  StoredProcedure [dbo].[FetchEmployeeDetails]    Script Date: 07-04-2023 9.31.14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[FetchEmployeeDetails] @employeeAddress nchar(50) As
select * from EmployeeDetails where Location=@employeeAddress;

exec FetchEmployeeDetails 'Madurai';
GO
/****** Object:  StoredProcedure [dbo].[GetEmployeesByProjectId]    Script Date: 07-04-2023 9.31.14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetEmployeesByProjectId]
    @ProjectId INT
output AS
BEGIN
   ( SELECT EmployeeId from Project where ProjectId = @ProjectId)
END
GO
USE [master]
GO
ALTER DATABASE [Practice Database] SET  READ_WRITE 
GO
