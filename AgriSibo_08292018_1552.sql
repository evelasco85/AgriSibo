USE [master]
GO
/****** Object:  Database [AgriSibo]    Script Date: 29/08/2018 3:52:03 PM ******/
CREATE DATABASE [AgriSibo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AgriSibo', FILENAME = N'D:\RUNNABLES\DATABASES\AgriSibo.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AgriSibo_log', FILENAME = N'D:\RUNNABLES\DATABASES\AgriSibo_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AgriSibo] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AgriSibo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AgriSibo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AgriSibo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AgriSibo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AgriSibo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AgriSibo] SET ARITHABORT OFF 
GO
ALTER DATABASE [AgriSibo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AgriSibo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AgriSibo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AgriSibo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AgriSibo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AgriSibo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AgriSibo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AgriSibo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AgriSibo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AgriSibo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AgriSibo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AgriSibo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AgriSibo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AgriSibo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AgriSibo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AgriSibo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AgriSibo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AgriSibo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AgriSibo] SET  MULTI_USER 
GO
ALTER DATABASE [AgriSibo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AgriSibo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AgriSibo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AgriSibo] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [AgriSibo] SET DELAYED_DURABILITY = DISABLED 
GO
USE [AgriSibo]
GO
/****** Object:  Table [dbo].[ApiSecurity]    Script Date: 29/08/2018 3:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ApiSecurity](
	[FarmerId] [int] NOT NULL DEFAULT ((0)),
	[InvestorId] [int] NOT NULL DEFAULT ((0)),
	[AccessToken] [char](500) NOT NULL,
	[RefreshToken] [char](500) NOT NULL,
 CONSTRAINT [PK_ApiSecurity] PRIMARY KEY CLUSTERED 
(
	[FarmerId] ASC,
	[InvestorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Crop]    Script Date: 29/08/2018 3:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Crop](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [char](250) NOT NULL,
 CONSTRAINT [PK_Crop] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Farm]    Script Date: 29/08/2018 3:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Farm](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FarmerId] [int] NOT NULL,
	[Name] [char](250) NOT NULL,
	[Address] [char](2000) NOT NULL,
 CONSTRAINT [PK_Farm] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Farmer]    Script Date: 29/08/2018 3:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Farmer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [char](200) NOT NULL,
	[RemainingInvestmentFunds] [decimal](18, 2) NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_FarmingEntity] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FarmersCrop]    Script Date: 29/08/2018 3:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FarmersCrop](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FarmId] [int] NOT NULL,
	[CropId] [int] NOT NULL,
 CONSTRAINT [PK_FarmersCrop] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Investment]    Script Date: 29/08/2018 3:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Investment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[InvestorId] [int] NOT NULL,
	[ProjectId] [int] NOT NULL,
	[InvestedAmount] [decimal](18, 2) NOT NULL,
	[ExpectedReturnRate] [decimal](18, 2) NOT NULL,
	[ExpectedReturnAmount] [decimal](18, 2) NOT NULL,
	[AcceptedByFarmer] [bit] NOT NULL,
 CONSTRAINT [PK_WorkInvestment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Investor]    Script Date: 29/08/2018 3:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Investor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [char](250) NOT NULL,
	[RemainingInvestmentFunds] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Investor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Project]    Script Date: 29/08/2018 3:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FarmersCropId] [int] NOT NULL,
	[Name] [char](250) NOT NULL,
	[EstimatedBudget] [decimal](18, 2) NOT NULL,
	[CommittedDate] [datetime] NOT NULL,
	[DefaultReturnRate] [decimal](18, 2) NOT NULL CONSTRAINT [DF_Project_DefaultReturnRate]  DEFAULT ((0)),
	[DefaultReturnAmount] [decimal](18, 2) NOT NULL CONSTRAINT [DF_Project_DefaultReturnAmount]  DEFAULT ((0)),
	[Status] [int] NOT NULL CONSTRAINT [DF_Project_Status]  DEFAULT ((0)),
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ApiSecurity] ([FarmerId], [InvestorId], [AccessToken], [RefreshToken]) VALUES (1, 0, N'-UwPBX_J1NABsPT6-Rgvn57CPXYDj94Fnw3Ty-7oC501zcmV1kObXGAFsarzzJdFQDPGFSgT1trIsUWHnwdfEpgjkjBp7ealX_oAMUN3hWPRVbYwiPPZDkXr-RGKjNqiN7D3zg0xGwnGvJZNNjlwGMMPePi8uPgUiFDsMTChP4IbQjEL6lG70DYLK6D7Mnpcq0yhMu8CMWQxNcieUXt81TUu3MmPclXxriGDTA-xE3FrRsUBfdV9WDRaZ9bownTbryHSVfSaFkWMVFyF245KK-vgSFLoAEEzTpD2CPYnUcxna_cJ-ZMR-VbgoHiXKsV1Y2vaEv7uBYgQmDMP9NDUJfFEPIC3qpw                                                                                                                                                     ', N'AAFSNmGqFOU229Z3Uj2gaEyY3sg_KioL3n3qCjY3-Zq1aAcny4rZDQLZ-_Zi4zVh0ZKXruuQpBFN57WX-n5nF7-_QSB8E01KCqPUYVo_XREqa8WsTxTgnDDC0RievevebMlspV83i-rcLZjrQvBaHgSfYQ3It4Uauk3v1XoidtOZ5azI7PtOv47lzz1nj9wA2xBhnJ1Zc9tZH8DwtCxk3R7ITXIdcf67Dqvrw-psIIJ4Jbc1uHZC8DFs8w5mTRsBOmYFwVzwxZfOhCh3_10qJsa95GXdkdp_ZES3Ir7MKBltfyP38Mt2MBtWxe1-v0SYP43d7ZLY7ckT-R2EqUW7fpizEzthEk8AK5PYyMjmagUlhZZAGVUlvRe_bzGkruJiaoR-vZON-lf7L8h5s_JfECnp                                                                                            ')
GO
SET IDENTITY_INSERT [dbo].[Crop] ON 

GO
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (1, N'Durian                                                                                                                                                                                                                                                    ')
GO
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (2, N'Cacao                                                                                                                                                                                                                                                     ')
GO
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (3, N'Mango                                                                                                                                                                                                                                                     ')
GO
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (4, N'Banana                                                                                                                                                                                                                                                    ')
GO
SET IDENTITY_INSERT [dbo].[Crop] OFF
GO
SET IDENTITY_INSERT [dbo].[Farm] ON 

GO
INSERT [dbo].[Farm] ([Id], [FarmerId], [Name], [Address]) VALUES (1, 1, N'Aranda Farms                                                                                                                                                                                                                                              ', N'Tagurano Toril, Davao City                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ')
GO
INSERT [dbo].[Farm] ([Id], [FarmerId], [Name], [Address]) VALUES (2, 2, N'Talomo Farms                                                                                                                                                                                                                                              ', N'Talomo Davao City                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ')
GO
SET IDENTITY_INSERT [dbo].[Farm] OFF
GO
SET IDENTITY_INSERT [dbo].[Farmer] ON 

GO
INSERT [dbo].[Farmer] ([id], [Name], [RemainingInvestmentFunds]) VALUES (1, N'Jose Aranda Jr.                                                                                                                                                                                         ', CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Farmer] ([id], [Name], [RemainingInvestmentFunds]) VALUES (2, N'Erwin Velasco                                                                                                                                                                                           ', CAST(0.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Farmer] OFF
GO
SET IDENTITY_INSERT [dbo].[FarmersCrop] ON 

GO
INSERT [dbo].[FarmersCrop] ([Id], [FarmId], [CropId]) VALUES (3, 1, 1)
GO
INSERT [dbo].[FarmersCrop] ([Id], [FarmId], [CropId]) VALUES (4, 1, 2)
GO
INSERT [dbo].[FarmersCrop] ([Id], [FarmId], [CropId]) VALUES (5, 2, 3)
GO
INSERT [dbo].[FarmersCrop] ([Id], [FarmId], [CropId]) VALUES (6, 2, 4)
GO
SET IDENTITY_INSERT [dbo].[FarmersCrop] OFF
GO
SET IDENTITY_INSERT [dbo].[Investor] ON 

GO
INSERT [dbo].[Investor] ([Id], [Name], [RemainingInvestmentFunds]) VALUES (1, N'Enrico Velasco                                                                                                                                                                                                                                            ', CAST(25000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Investor] ([Id], [Name], [RemainingInvestmentFunds]) VALUES (2, N'Joneil Getigan                                                                                                                                                                                                                                            ', CAST(35000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Investor] ([Id], [Name], [RemainingInvestmentFunds]) VALUES (3, N'Escrow                                                                                                                                                                                                                                                    ', CAST(0.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Investor] OFF
GO
SET IDENTITY_INSERT [dbo].[Project] ON 

GO
INSERT [dbo].[Project] ([Id], [FarmersCropId], [Name], [EstimatedBudget], [CommittedDate], [DefaultReturnRate], [DefaultReturnAmount], [Status]) VALUES (17, 3, N'September Cycle (Durian)                                                                                                                                                                                                                                  ', CAST(15000.00 AS Decimal(18, 2)), CAST(N'2018-12-25 00:00:00.000' AS DateTime), CAST(0.00 AS Decimal(18, 2)), CAST(17500.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Project] ([Id], [FarmersCropId], [Name], [EstimatedBudget], [CommittedDate], [DefaultReturnRate], [DefaultReturnAmount], [Status]) VALUES (18, 4, N'September Cycle (Cacao)                                                                                                                                                                                                                                   ', CAST(8000.00 AS Decimal(18, 2)), CAST(N'2018-12-25 00:00:00.000' AS DateTime), CAST(0.00 AS Decimal(18, 2)), CAST(12000.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Project] ([Id], [FarmersCropId], [Name], [EstimatedBudget], [CommittedDate], [DefaultReturnRate], [DefaultReturnAmount], [Status]) VALUES (19, 5, N'September Cycle (Mango)                                                                                                                                                                                                                                   ', CAST(7000.00 AS Decimal(18, 2)), CAST(N'2018-12-25 00:00:00.000' AS DateTime), CAST(0.00 AS Decimal(18, 2)), CAST(8500.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Project] ([Id], [FarmersCropId], [Name], [EstimatedBudget], [CommittedDate], [DefaultReturnRate], [DefaultReturnAmount], [Status]) VALUES (20, 6, N'September Cycle (Banana)                                                                                                                                                                                                                                  ', CAST(7000.00 AS Decimal(18, 2)), CAST(N'2018-12-25 00:00:00.000' AS DateTime), CAST(0.00 AS Decimal(18, 2)), CAST(8500.00 AS Decimal(18, 2)), 0)
GO
SET IDENTITY_INSERT [dbo].[Project] OFF
GO
ALTER TABLE [dbo].[Investment] ADD  CONSTRAINT [DF_Investment_InvestedAmount]  DEFAULT ((0)) FOR [InvestedAmount]
GO
ALTER TABLE [dbo].[Investment] ADD  CONSTRAINT [DF_Investment_ExpectedReturnRate]  DEFAULT ((0)) FOR [ExpectedReturnRate]
GO
ALTER TABLE [dbo].[Investment] ADD  CONSTRAINT [DF_Investment_ExpectedReturnAmount]  DEFAULT ((0)) FOR [ExpectedReturnAmount]
GO
ALTER TABLE [dbo].[Investment] ADD  CONSTRAINT [DF_Table_1_Admitted]  DEFAULT ((0)) FOR [AcceptedByFarmer]
GO
/****** Object:  StoredProcedure [dbo].[AcceptInvestmentApplication]    Script Date: 29/08/2018 3:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AcceptInvestmentApplication]
	@ProjectId int,
	@InvestorId int
	
AS
BEGIN

	if exists(select * from project proj where proj.id = @ProjectId and proj.[status] != 0)
	begin
		return;
	end

	update inv
	set inv.AcceptedByFarmer = 1
	from Investment inv
	where
		inv.ProjectId = @ProjectId and
		inv.InvestorId = @InvestorId
END


GO
/****** Object:  StoredProcedure [dbo].[AddFundsToFarmer]    Script Date: 29/08/2018 3:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddFundsToFarmer]
	@id int,
	@fundsToAdd decimal(18, 2)
AS
BEGIN
	Update Farmer
	set RemainingInvestmentFunds = RemainingInvestmentFunds + @fundsToAdd
	where id = @id
END


GO
/****** Object:  StoredProcedure [dbo].[AddProject]    Script Date: 29/08/2018 3:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddProject]
	@farmersCropId int,
	@name char(250),
	@estimatedBudget decimal(18, 2),
	@committedDate datetime,
	@defaultReturnRate decimal(18, 2),
	@defaultReturnAmount decimal(18, 2)
AS
BEGIN
	insert into Project([FarmersCropId],
	[Name],
	[EstimatedBudget],
	[CommittedDate],
	[DefaultReturnRate],
	[DefaultReturnAmount])
	values(@farmersCropId,
	@name,
	@estimatedBudget,
	@committedDate,
	@defaultReturnRate,
	@defaultReturnAmount)

END


GO
/****** Object:  StoredProcedure [dbo].[CompleteProject]    Script Date: 29/08/2018 3:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CompleteProject]
	@ProjectId int
AS
BEGIN
	declare @OPEN_STATE int = 1;
	declare @HISTORY_STATE int = 2;

	if exists(select * from project proj where proj.id = @ProjectId and proj.[status] != @OPEN_STATE)
	begin
		return;
	end

	IF(OBJECT_ID('TEMPDB..#TMP_farmers') IS NOT NULL)
		DROP TABLE #TMP_farmers

	--Retrieve the farmer associated w/specified project
	select
		Farmer.*
	into #TMP_farmers
	from project proj
	inner join FarmersCrop fc
		on fc.Id = proj.FarmersCropId
		inner join Farm frm
			on frm.Id = fc.FarmId
				inner join Farmer farmer
					on farmer.id = frm.FarmerId
	where
		proj.Id = @ProjectId

	declare @farmerId int;

	select top 1 @farmerId = id from #TMP_farmers

	--Retrieve current farmers fund
	declare @farmerFunds decimal(18, 2);
	
	select
		@farmerFunds = sum(farmer.RemainingInvestmentFunds)
	from Farmer farmer
	where
		farmer.id = @farmerId

	IF(OBJECT_ID('TEMPDB..#TMP_investors') IS NOT NULL)
		DROP TABLE #TMP_investors

	--Retrieve expected return of investments approved by farmer
	select
		inv.InvestorId,
		inv.ExpectedReturnAmount
	into #TMP_investors
	from Investment inv
	where
		inv.ProjectId = @ProjectId and
		inv.AcceptedByFarmer = 1

	declare @committedAmount decimal(18, 2)

	select @committedAmount = sum(ExpectedReturnAmount) from #TMP_investors

	--Apply investors' earnings
	update inv set inv.RemainingInvestmentFunds = (inv.RemainingInvestmentFunds + tmp.ExpectedReturnAmount)
	from Investor inv
	inner join #TMP_investors tmp
		on inv.Id = tmp.InvestorId

	--Deduct investors' earnings from farmers
	update farmer
	set RemainingInvestmentFunds = RemainingInvestmentFunds - @committedAmount
	where id = @farmerId

	--Update project state
	update proj set proj.[Status] = @HISTORY_STATE
	from project proj 
	where proj.id = @ProjectId	
END


GO
/****** Object:  StoredProcedure [dbo].[InitiateProject]    Script Date: 29/08/2018 3:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InitiateProject]
	@ProjectId int
AS
BEGIN

	declare @WORK_STATE int = 0;
	declare @OPEN_STATE int = 1;


	if exists(select * from project proj where proj.id = @ProjectId and proj.[status] != @WORK_STATE)
	begin
		return;
	end

	if not exists(select * from Investment inv where inv.ProjectId = @ProjectId and AcceptedByFarmer = 1)
	begin
		return;
	end

	IF(OBJECT_ID('TEMPDB..#TMP_farmers') IS NOT NULL)
		DROP TABLE #TMP_farmers

	--Retrieve the farmer associated w/specified project
	select
		Farmer.*
	into #TMP_farmers
	from project proj
	inner join FarmersCrop fc
		on fc.Id = proj.FarmersCropId
		inner join Farm frm
			on frm.Id = fc.FarmId
				inner join Farmer farmer
					on farmer.id = frm.FarmerId
	where
		proj.Id = @ProjectId

	declare @farmerId int;

	select top 1 @farmerId = id from #TMP_farmers

	--Retrieve total invested amount approved by Farmer
	declare @appliedAmount decimal(18, 2);
	
	select
		@appliedAmount = sum(inv.InvestedAmount)
	from Investment inv
	where
		inv.ProjectId = @ProjectId and
		inv.AcceptedByFarmer = 1

	--Add funds to farmer
	update farmer
	set farmer.RemainingInvestmentFunds = farmer.RemainingInvestmentFunds + @appliedAmount
	where farmer.id = @farmerId

	IF(OBJECT_ID('TEMPDB..#TMP_Returns') IS NOT NULL)
		DROP TABLE #TMP_Returns

	--Retrieve investments not approved by farmer
	select
		inv.InvestorId,
		inv.InvestedAmount
	into #TMP_Returns
	from Investment inv
	where
		inv.ProjectId = @ProjectId and
		inv.AcceptedByFarmer = 0

	declare @returnsAmount decimal(18, 2);

	select @returnsAmount = sum(InvestedAmount) from #TMP_Returns

	--Remove non-approved investment amount from escrow
	update inv
	set inv.RemainingInvestmentFunds = inv.RemainingInvestmentFunds - (@appliedAmount + @returnsAmount)
	from Investor inv
	where inv.Name = 'Escrow'
	
	--Return funds to rejected investors
	update inv set inv.RemainingInvestmentFunds = inv.RemainingInvestmentFunds + ret.InvestedAmount
	from Investor inv
	inner join #TMP_Returns ret
		on inv.Id = ret.InvestorId

	--Update project state
	update proj set proj.[Status] = @OPEN_STATE
	from project proj 
	where proj.id = @ProjectId
END


GO
/****** Object:  StoredProcedure [dbo].[SubmitInvestmentApplication]    Script Date: 29/08/2018 3:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SubmitInvestmentApplication]
	@InvestorId int,
	@ProjectId int,
	@InvestedAmount decimal(18, 2),
	@ExpectedReturnRate decimal(18, 2),
	@ExpectedReturnAmount decimal(18, 2)
AS
BEGIN

	if exists(select * from project proj where proj.id = @ProjectId and proj.[status] != 0)
	begin
		return;
	end

	if exists(select * from investment inv where inv.investorId = @InvestorId and inv.projectId = @ProjectId and inv.AcceptedByFarmer = 1)
	begin
		return;
	end

	if exists(select * from investment inv where inv.investorId = @InvestorId and inv.projectId = @ProjectId)
	begin
		declare @summedInvestmentAmount decimal(18, 2);

		select @summedInvestmentAmount = sum(InvestedAmount) 
		from investment inv
		where inv.investorId = @InvestorId and inv.projectId = @ProjectId

		delete inv
		from investment inv
		where
			inv.investorId = @InvestorId and
			inv.projectId = @ProjectId;

		update inv
		set inv.RemainingInvestmentFunds = inv.RemainingInvestmentFunds + @summedInvestmentAmount
		from Investor inv
		where inv.id = @InvestorId

		update inv
		set inv.RemainingInvestmentFunds = inv.RemainingInvestmentFunds - @summedInvestmentAmount
		from Investor inv
		where inv.name = 'Escrow'
	end

	insert into Investment(InvestorId,
		ProjectId,
		InvestedAmount,
		ExpectedReturnRate,
		ExpectedReturnAmount)
	values(@InvestorId,
		@ProjectId,
		@InvestedAmount,
		@ExpectedReturnRate,
		@ExpectedReturnAmount)

	update inv
		set inv.RemainingInvestmentFunds = inv.RemainingInvestmentFunds - @InvestedAmount
		from Investor inv
		where inv.id = @InvestorId

	update inv
		set inv.RemainingInvestmentFunds = inv.RemainingInvestmentFunds + @InvestedAmount
		from Investor inv
		where inv.name = 'Escrow'
END


GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Work = 0; Open = 1; History = 2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Project', @level2type=N'COLUMN',@level2name=N'Status'
GO
USE [master]
GO
ALTER DATABASE [AgriSibo] SET  READ_WRITE 
GO
