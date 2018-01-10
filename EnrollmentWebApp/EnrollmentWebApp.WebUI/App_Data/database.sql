USE [EnrollmentWebApp]
GO
/****** Object:  Table [dbo].[Enrollees]    Script Date: 10.01.2018 13:14:49 ******/
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
PRIMARY KEY CLUSTERED 
(
	[EnrolleeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Faculties]    Script Date: 10.01.2018 13:14:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculties](
	[FacultyId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Faculties] PRIMARY KEY CLUSTERED 
(
	[FacultyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Specialities]    Script Date: 10.01.2018 13:14:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialities](
	[SpecialityId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[FacultyId] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TreeNodes]    Script Date: 10.01.2018 13:14:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TreeNodes](
	[Id] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[ParentId] [int] NOT NULL,
 CONSTRAINT [PK_TreeNodes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Enrollees] ON 

INSERT [dbo].[Enrollees] ([EnrolleeId], [Name], [Surname], [Patronymic], [Passport], [BirthDate], [Town], [Address], [PhoneNumber], [CTLanguage], [CTFirstSubject], [CTSecondSubject], [AverageScore]) VALUES (8, N'Pavel', N'Katskel', N'Sergey', N'AB1234567', CAST(N'1999-02-27' AS Date), N'Minsk', N'Kagantsa,4', N'+357441234567', 90, 90, 90, CAST(9.0 AS Decimal(17, 1)))
INSERT [dbo].[Enrollees] ([EnrolleeId], [Name], [Surname], [Patronymic], [Passport], [BirthDate], [Town], [Address], [PhoneNumber], [CTLanguage], [CTFirstSubject], [CTSecondSubject], [AverageScore]) VALUES (9, N'Ivan', N'Ivanov', N'Ivan', N'CD1233487', CAST(N'2000-01-05' AS Date), N'Brest', N'Lenina,27', N'+375251233245', 80, 80, 87, CAST(8.5 AS Decimal(17, 1)))
INSERT [dbo].[Enrollees] ([EnrolleeId], [Name], [Surname], [Patronymic], [Passport], [BirthDate], [Town], [Address], [PhoneNumber], [CTLanguage], [CTFirstSubject], [CTSecondSubject], [AverageScore]) VALUES (11, N'Petr', N'Petrov', N'Petr', N'GH4988965', CAST(N'1997-05-14' AS Date), N'Gorki', N'Serova,1', N'+375440987655', 15, 100, 100, CAST(7.4 AS Decimal(17, 1)))
INSERT [dbo].[Enrollees] ([EnrolleeId], [Name], [Surname], [Patronymic], [Passport], [BirthDate], [Town], [Address], [PhoneNumber], [CTLanguage], [CTFirstSubject], [CTSecondSubject], [AverageScore]) VALUES (12, N'Arseni', N'Laskutin', N'Anton', N'HG2340986', CAST(N'1998-12-12' AS Date), N'Vitebsk', N'Gornaya,90', N'+375290988654', 100, 100, 100, CAST(10.0 AS Decimal(17, 1)))
INSERT [dbo].[Enrollees] ([EnrolleeId], [Name], [Surname], [Patronymic], [Passport], [BirthDate], [Town], [Address], [PhoneNumber], [CTLanguage], [CTFirstSubject], [CTSecondSubject], [AverageScore]) VALUES (13, N'Vasiliy', N'Kapralov', N'Artem', N'TR23498713', CAST(N'2001-01-01' AS Date), N'Brest', N'Lenina,1', N'+375449872345', 90, 78, 85, CAST(8.4 AS Decimal(17, 1)))
INSERT [dbo].[Enrollees] ([EnrolleeId], [Name], [Surname], [Patronymic], [Passport], [BirthDate], [Town], [Address], [PhoneNumber], [CTLanguage], [CTFirstSubject], [CTSecondSubject], [AverageScore]) VALUES (14, N'Yelisey', N'Vazov', N'Fyodor', N'TY23498725', CAST(N'1999-07-07' AS Date), N'Minsk', N'Drozda,7', N'+375292343456', 95, 94, 89, CAST(9.7 AS Decimal(17, 1)))
SET IDENTITY_INSERT [dbo].[Enrollees] OFF
INSERT [dbo].[Faculties] ([FacultyId], [Name]) VALUES (1, N'КСиС')
INSERT [dbo].[Faculties] ([FacultyId], [Name]) VALUES (2, N'ФРЭ')
INSERT [dbo].[Faculties] ([FacultyId], [Name]) VALUES (3, N'ФИТУ')
INSERT [dbo].[Faculties] ([FacultyId], [Name]) VALUES (4, N'ФКП')
INSERT [dbo].[Faculties] ([FacultyId], [Name]) VALUES (5, N'ФИК')
INSERT [dbo].[Faculties] ([FacultyId], [Name]) VALUES (6, N'ИЭФ')
INSERT [dbo].[Faculties] ([FacultyId], [Name]) VALUES (7, N'ФИНО')
INSERT [dbo].[Faculties] ([FacultyId], [Name]) VALUES (8, N'ФДПиПО')
INSERT [dbo].[Faculties] ([FacultyId], [Name]) VALUES (9, N'Военный факультет')
INSERT [dbo].[Specialities] ([SpecialityId], [Name], [FacultyId]) VALUES (1, N'ИиТП', 1)
INSERT [dbo].[Specialities] ([SpecialityId], [Name], [FacultyId]) VALUES (2, N'ПОИТ', 1)
INSERT [dbo].[Specialities] ([SpecialityId], [Name], [FacultyId]) VALUES (3, N'ВМСиС', 1)
INSERT [dbo].[Specialities] ([SpecialityId], [Name], [FacultyId]) VALUES (4, N'ЭВС', 1)
INSERT [dbo].[Specialities] ([SpecialityId], [Name], [FacultyId]) VALUES (5, N'ПиППУЭС', 4)
INSERT [dbo].[Specialities] ([SpecialityId], [Name], [FacultyId]) VALUES (6, N'МиКПРС', 4)
INSERT [dbo].[Specialities] ([SpecialityId], [Name], [FacultyId]) VALUES (7, N'ПМС', 4)
INSERT [dbo].[Specialities] ([SpecialityId], [Name], [FacultyId]) VALUES (8, N'ПУЭОС', 4)
INSERT [dbo].[Specialities] ([SpecialityId], [Name], [FacultyId]) VALUES (9, N'Медицинская электроника', 4)
INSERT [dbo].[Specialities] ([SpecialityId], [Name], [FacultyId]) VALUES (10, N'ИПОИТ', 4)
INSERT [dbo].[Specialities] ([SpecialityId], [Name], [FacultyId]) VALUES (11, N'ЭСБ', 4)
INSERT [dbo].[Specialities] ([SpecialityId], [Name], [FacultyId]) VALUES (12, N'ИСИТ (в ОПБ)', 4)
INSERT [dbo].[Specialities] ([SpecialityId], [Name], [FacultyId]) VALUES (13, N'ИСИТ (в БМ)', 4)
INSERT [dbo].[Specialities] ([SpecialityId], [Name], [FacultyId]) VALUES (14, N'АСОИ', 3)
INSERT [dbo].[Specialities] ([SpecialityId], [Name], [FacultyId]) VALUES (15, N'ИИ', 3)
INSERT [dbo].[Specialities] ([SpecialityId], [Name], [FacultyId]) VALUES (16, N'ИТиУ в ТС', 3)
INSERT [dbo].[Specialities] ([SpecialityId], [Name], [FacultyId]) VALUES (17, N'ПЭ', 3)
INSERT [dbo].[Specialities] ([SpecialityId], [Name], [FacultyId]) VALUES (18, N'ИСИТ (в ИИ)', 3)
INSERT [dbo].[Specialities] ([SpecialityId], [Name], [FacultyId]) VALUES (19, N'МиНТиС', 2)
INSERT [dbo].[Specialities] ([SpecialityId], [Name], [FacultyId]) VALUES (20, N'КИС', 2)
INSERT [dbo].[Specialities] ([SpecialityId], [Name], [FacultyId]) VALUES (21, N'НиНвЭ', 2)
INSERT [dbo].[Specialities] ([SpecialityId], [Name], [FacultyId]) VALUES (22, N'Радиотехника', 2)
INSERT [dbo].[Specialities] ([SpecialityId], [Name], [FacultyId]) VALUES (23, N'Радиоэлектронные системы', 2)
INSERT [dbo].[Specialities] ([SpecialityId], [Name], [FacultyId]) VALUES (24, N'Радиоинформатика', 2)
INSERT [dbo].[Specialities] ([SpecialityId], [Name], [FacultyId]) VALUES (25, N'РЗИ', 2)
INSERT [dbo].[Specialities] ([SpecialityId], [Name], [FacultyId]) VALUES (26, N'ЭиИСФУ', 2)
INSERT [dbo].[Specialities] ([SpecialityId], [Name], [FacultyId]) VALUES (27, N'Профессиональное образование', 2)
INSERT [dbo].[Specialities] ([SpecialityId], [Name], [FacultyId]) VALUES (28, N'Инфокоммуникационные технологии', 5)
INSERT [dbo].[Specialities] ([SpecialityId], [Name], [FacultyId]) VALUES (29, N'Инфокоммуникационные системы', 5)
INSERT [dbo].[Specialities] ([SpecialityId], [Name], [FacultyId]) VALUES (30, N'Защита информации', 5)
INSERT [dbo].[Specialities] ([SpecialityId], [Name], [FacultyId]) VALUES (31, N'ИСИТ (в Э)', 6)
INSERT [dbo].[Specialities] ([SpecialityId], [Name], [FacultyId]) VALUES (32, N'ИСИТ (в Л)', 6)
INSERT [dbo].[Specialities] ([SpecialityId], [Name], [FacultyId]) VALUES (33, N'Электронный маркетинг', 6)
INSERT [dbo].[Specialities] ([SpecialityId], [Name], [FacultyId]) VALUES (34, N'Экономика электронного бизнеса', 6)
INSERT [dbo].[Specialities] ([SpecialityId], [Name], [FacultyId]) VALUES (35, N'Инфокоммуникационные технологии', 9)
INSERT [dbo].[Specialities] ([SpecialityId], [Name], [FacultyId]) VALUES (36, N'Радиотехника', 9)
INSERT [dbo].[Specialities] ([SpecialityId], [Name], [FacultyId]) VALUES (37, N'ВМСиС', 9)
INSERT [dbo].[TreeNodes] ([Id], [Title], [ParentId]) VALUES (1, N'КСиС', 0)
INSERT [dbo].[TreeNodes] ([Id], [Title], [ParentId]) VALUES (2, N'ФРЭ', 0)
INSERT [dbo].[TreeNodes] ([Id], [Title], [ParentId]) VALUES (3, N'ФИТУ', 0)
INSERT [dbo].[TreeNodes] ([Id], [Title], [ParentId]) VALUES (4, N'ИиТП', 1)
INSERT [dbo].[TreeNodes] ([Id], [Title], [ParentId]) VALUES (5, N'ВМСиС', 1)
INSERT [dbo].[TreeNodes] ([Id], [Title], [ParentId]) VALUES (6, N'Радиоинформатика', 2)
INSERT [dbo].[TreeNodes] ([Id], [Title], [ParentId]) VALUES (7, N'Кацкель', 4)
INSERT [dbo].[TreeNodes] ([Id], [Title], [ParentId]) VALUES (8, N'Конончук', 4)
INSERT [dbo].[TreeNodes] ([Id], [Title], [ParentId]) VALUES (9, N'Сидоров', 4)
INSERT [dbo].[TreeNodes] ([Id], [Title], [ParentId]) VALUES (10, N'Петров', 4)
INSERT [dbo].[TreeNodes] ([Id], [Title], [ParentId]) VALUES (11, N'Иванов', 4)
INSERT [dbo].[TreeNodes] ([Id], [Title], [ParentId]) VALUES (12, N'Кучинский', 4)
INSERT [dbo].[TreeNodes] ([Id], [Title], [ParentId]) VALUES (13, N'Белясова', 4)
INSERT [dbo].[TreeNodes] ([Id], [Title], [ParentId]) VALUES (14, N'Глотов', 4)
