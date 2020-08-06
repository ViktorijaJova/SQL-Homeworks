
CREATE TABLE [dbo].[Teacher](
	[Id] [smallint] NOT NULL,
	[FirstName] [nvarchar](50)  NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[AcademicRank] [nvarchar](50) NOT NULL,
	[HireDate] [date] NOT NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
))
GO

CREATE TABLE [dbo].[Grade](
	[Id] [int] NOT NULL,
	[StudentId] [int]  NOT NULL,
	[CourseId] [smallint] NOT NULL,
	[TeacherID] [smallint] NOT NULL,
	[Grade] [tinyint] NOT NULL,
	[Comment] [nvarchar] (100)  NULL,
	[CreatedData] [datetime] NOT NULL,
 CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
))
GO

CREATE TABLE [dbo].[GradeDetails](
	[Id] [int] NOT NULL,
	[GradeId] [int]  NOT NULL,
	[AchievmentTypeId] [smallint] NOT NULL,
	[AchievmentPoints] [decimal] (18,2) NOT NULL,
	[AchievmentMaxPoints] [decimal] (18,2) NOT NULL,
	[AchivmentData] [date] NOT NULL,
 CONSTRAINT [PK_GradeDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
))
GO


CREATE TABLE [dbo].[Student](
	[Id] [int] NOT NULL,
	[FirstName] [nvarchar](50)  NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[EnrolledDate] [date] NOT NULL,
	[Gender] [nchar] (1) NOT NULL,
	[NationalIdNumber] [nvarchar] (20) NOT NULL,
	[StudentCardNumber] [nvarchar] (20) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
))
GO

CREATE TABLE [dbo].[Course] (
[Id] [smallint] NOT NULL,
[Name] [nvarchar] (50) NOT NULL,
[Credit] [int]  NOT NULL,
[AcademicYear] [date] NOT NULL,
[Semester] [date] NOT NULL,
CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
[Id] ASC
))
GO

CREATE TABLE [dbo].[AchivementType] (
[Id] [int] NOT NULL,
[Name] [nvarchar] (50) NOT NULL,
[Description] [nvarchar](MAX) NOT NULL,
[ParticipationRate] [decimal] (18,2) NOT NULL,
CONSTRAINT [PK_AchievmentType] PRIMARY KEY CLUSTERED 
(
[Id] ASC
))
GO


