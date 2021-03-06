USE [EnrollmentWebApp]
GO
/****** Object:  Table [dbo].[Enrollees]    Script Date: 20.01.2018 1:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollees](
	[EnrolleeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NOT NULL,
	[Passport] [nvarchar](50) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[Town] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[CTLanguage] [int] NULL,
	[CTFirstSubject] [int] NULL,
	[CTSecondSubject] [int] NULL,
	[AverageScore] [decimal](17, 1) NOT NULL,
	[SpecialityId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EnrolleeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Specialities]    Script Date: 20.01.2018 1:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UniversityId] [int] NOT NULL,
	[FacultyId] [int] NOT NULL,
	[SpecialityId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SpecialityInfo]    Script Date: 20.01.2018 1:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecialityInfo](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Type] [int] NOT NULL,
 CONSTRAINT [PK_SpecialityInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TreeNodes]    Script Date: 20.01.2018 1:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TreeNodes](
	[NodeId] [int] NOT NULL,
	[DataId] [int] NOT NULL,
	[ParentId] [int] NOT NULL,
 CONSTRAINT [PK_TreeNodes] PRIMARY KEY CLUSTERED 
(
	[NodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Enrollees] ON 

INSERT [dbo].[Enrollees] ([EnrolleeId], [Name], [Surname], [Patronymic], [Passport], [BirthDate], [Town], [Address], [PhoneNumber], [CTLanguage], [CTFirstSubject], [CTSecondSubject], [AverageScore], [SpecialityId]) VALUES (8, N'Pavel', N'Katskel', N'Sergey', N'AB1234567', CAST(N'1999-02-27' AS Date), N'Minsk', N'Kagantsa,4', N'+357441234567', 90, 90, 90, CAST(9.0 AS Decimal(17, 1)), 4)
INSERT [dbo].[Enrollees] ([EnrolleeId], [Name], [Surname], [Patronymic], [Passport], [BirthDate], [Town], [Address], [PhoneNumber], [CTLanguage], [CTFirstSubject], [CTSecondSubject], [AverageScore], [SpecialityId]) VALUES (9, N'Ivan', N'Ivanov', N'Ivan', N'CD1233487', CAST(N'2000-01-05' AS Date), N'Brest', N'Lenina,27', N'+375251233245', 80, 80, 87, CAST(8.0 AS Decimal(17, 1)), 2)
INSERT [dbo].[Enrollees] ([EnrolleeId], [Name], [Surname], [Patronymic], [Passport], [BirthDate], [Town], [Address], [PhoneNumber], [CTLanguage], [CTFirstSubject], [CTSecondSubject], [AverageScore], [SpecialityId]) VALUES (11, N'Petr', N'Petrov', N'Petr', N'GH4988965', CAST(N'1997-05-14' AS Date), N'Gorki', N'Serova,1', N'+375440987655', 15, 100, 100, CAST(7.4 AS Decimal(17, 1)), 1)
INSERT [dbo].[Enrollees] ([EnrolleeId], [Name], [Surname], [Patronymic], [Passport], [BirthDate], [Town], [Address], [PhoneNumber], [CTLanguage], [CTFirstSubject], [CTSecondSubject], [AverageScore], [SpecialityId]) VALUES (12, N'Arseni', N'Laskutin', N'Anton', N'HG2340986', CAST(N'1998-12-12' AS Date), N'Vitebsk', N'Gornaya,90', N'+375290988654', 100, 100, 100, CAST(10.0 AS Decimal(17, 1)), 1)
INSERT [dbo].[Enrollees] ([EnrolleeId], [Name], [Surname], [Patronymic], [Passport], [BirthDate], [Town], [Address], [PhoneNumber], [CTLanguage], [CTFirstSubject], [CTSecondSubject], [AverageScore], [SpecialityId]) VALUES (13, N'Vasiliy', N'Kapralov', N'Artem', N'TR23498713', CAST(N'2001-01-01' AS Date), N'Brest', N'Lenina,1', N'+375449872345', 90, 78, 85, CAST(8.4 AS Decimal(17, 1)), 1)
INSERT [dbo].[Enrollees] ([EnrolleeId], [Name], [Surname], [Patronymic], [Passport], [BirthDate], [Town], [Address], [PhoneNumber], [CTLanguage], [CTFirstSubject], [CTSecondSubject], [AverageScore], [SpecialityId]) VALUES (14, N'Yelisey', N'Vazov', N'Fyodor', N'TY23498725', CAST(N'1999-07-07' AS Date), N'Minsk', N'Drozda,7', N'+375292343456', 95, 94, 89, CAST(9.7 AS Decimal(17, 1)), 1)
SET IDENTITY_INSERT [dbo].[Enrollees] OFF
SET IDENTITY_INSERT [dbo].[Specialities] ON 

INSERT [dbo].[Specialities] ([Id], [UniversityId], [FacultyId], [SpecialityId]) VALUES (1, 1, 3, 6)
INSERT [dbo].[Specialities] ([Id], [UniversityId], [FacultyId], [SpecialityId]) VALUES (2, 1, 3, 7)
INSERT [dbo].[Specialities] ([Id], [UniversityId], [FacultyId], [SpecialityId]) VALUES (3, 2, 4, 10)
INSERT [dbo].[Specialities] ([Id], [UniversityId], [FacultyId], [SpecialityId]) VALUES (4, 1, 3, 8)
SET IDENTITY_INSERT [dbo].[Specialities] OFF
INSERT [dbo].[SpecialityInfo] ([Id], [Name], [Type]) VALUES (1, N'БГУИР', 1)
INSERT [dbo].[SpecialityInfo] ([Id], [Name], [Type]) VALUES (2, N'БГУ', 1)
INSERT [dbo].[SpecialityInfo] ([Id], [Name], [Type]) VALUES (3, N'КСиС', 2)
INSERT [dbo].[SpecialityInfo] ([Id], [Name], [Type]) VALUES (4, N'ФПМИ', 2)
INSERT [dbo].[SpecialityInfo] ([Id], [Name], [Type]) VALUES (5, N'ФРЭ', 2)
INSERT [dbo].[SpecialityInfo] ([Id], [Name], [Type]) VALUES (6, N'ИиТП', 3)
INSERT [dbo].[SpecialityInfo] ([Id], [Name], [Type]) VALUES (7, N'ПОИТ', 3)
INSERT [dbo].[SpecialityInfo] ([Id], [Name], [Type]) VALUES (8, N'ЭВС', 3)
INSERT [dbo].[SpecialityInfo] ([Id], [Name], [Type]) VALUES (9, N'ВМСиС', 3)
INSERT [dbo].[SpecialityInfo] ([Id], [Name], [Type]) VALUES (10, N'Информатика', 3)
INSERT [dbo].[TreeNodes] ([NodeId], [DataId], [ParentId]) VALUES (1, 1, 0)
INSERT [dbo].[TreeNodes] ([NodeId], [DataId], [ParentId]) VALUES (2, 2, 0)
INSERT [dbo].[TreeNodes] ([NodeId], [DataId], [ParentId]) VALUES (3, 3, 1)
INSERT [dbo].[TreeNodes] ([NodeId], [DataId], [ParentId]) VALUES (4, 4, 2)
INSERT [dbo].[TreeNodes] ([NodeId], [DataId], [ParentId]) VALUES (5, 5, 1)
INSERT [dbo].[TreeNodes] ([NodeId], [DataId], [ParentId]) VALUES (6, 6, 3)
INSERT [dbo].[TreeNodes] ([NodeId], [DataId], [ParentId]) VALUES (7, 7, 3)
INSERT [dbo].[TreeNodes] ([NodeId], [DataId], [ParentId]) VALUES (8, 8, 3)
INSERT [dbo].[TreeNodes] ([NodeId], [DataId], [ParentId]) VALUES (9, 9, 3)
INSERT [dbo].[TreeNodes] ([NodeId], [DataId], [ParentId]) VALUES (10, 10, 4)
