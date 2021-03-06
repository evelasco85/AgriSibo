USE [master]
GO
/****** Object:  Database [AgriSibo]    Script Date: 26/08/2018 12:37:20 AM ******/
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
/****** Object:  Table [dbo].[ApiSecurity]    Script Date: 26/08/2018 12:37:20 AM ******/
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
/****** Object:  Table [dbo].[Crop]    Script Date: 26/08/2018 12:37:20 AM ******/
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
/****** Object:  Table [dbo].[Farm]    Script Date: 26/08/2018 12:37:20 AM ******/
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
/****** Object:  Table [dbo].[Farmer]    Script Date: 26/08/2018 12:37:20 AM ******/
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
/****** Object:  Table [dbo].[FarmersCrop]    Script Date: 26/08/2018 12:37:20 AM ******/
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
/****** Object:  Table [dbo].[Investment]    Script Date: 26/08/2018 12:37:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Investment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[InvestorId] [int] NOT NULL,
	[ProjectId] [int] NOT NULL,
	[InvestedAmount] [decimal](18, 2) NOT NULL CONSTRAINT [DF_Investment_InvestedAmount]  DEFAULT ((0)),
	[ExpectedReturnRate] [decimal](18, 2) NOT NULL CONSTRAINT [DF_Investment_ExpectedReturnRate]  DEFAULT ((0)),
	[ExpectedReturnAmount] [decimal](18, 2) NOT NULL CONSTRAINT [DF_Investment_ExpectedReturnAmount]  DEFAULT ((0)),
	[AcceptedByFarmer] [bit] NOT NULL CONSTRAINT [DF_Table_1_Admitted]  DEFAULT ((0)),
 CONSTRAINT [PK_WorkInvestment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Investor]    Script Date: 26/08/2018 12:37:20 AM ******/
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
/****** Object:  Table [dbo].[Project]    Script Date: 26/08/2018 12:37:20 AM ******/
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
/****** Object:  StoredProcedure [dbo].[AcceptInvestmentApplication]    Script Date: 26/08/2018 12:37:20 AM ******/
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
/****** Object:  StoredProcedure [dbo].[CompleteProject]    Script Date: 26/08/2018 12:37:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[CompleteProject]
	@ProjectId int
AS
BEGIN
	return	
END


GO
/****** Object:  StoredProcedure [dbo].[InitiateProject]    Script Date: 26/08/2018 12:37:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InitiateProject]
	@ProjectId int
AS
BEGIN

	if exists(select * from project proj where proj.id = @ProjectId and proj.[status] != 0)
	begin
		return;
	end

	IF(OBJECT_ID('TEMPDB..#TMP_farmers') IS NOT NULL)
		DROP TABLE #TMP_farmers

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

	declare @appliedAmount decimal(18, 2);

	
	select
		@appliedAmount = sum(inv.InvestedAmount)
	from Investment inv
	where
		inv.ProjectId = @ProjectId and
		inv.AcceptedByFarmer = 1

	update farmer
	set farmer.RemainingInvestmentFunds = farmer.RemainingInvestmentFunds + @appliedAmount
	where farmer.id = @farmerId

	IF(OBJECT_ID('TEMPDB..#TMP_Returns') IS NOT NULL)
		DROP TABLE #TMP_Returns

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

	update inv
	set inv.RemainingInvestmentFunds = inv.RemainingInvestmentFunds - (@appliedAmount + @returnsAmount)
	from Investor inv
	where inv.Name = 'Escrow'
	
	update inv set inv.RemainingInvestmentFunds = inv.RemainingInvestmentFunds + ret.InvestedAmount
	from Investor inv
	inner join #TMP_Returns ret
		on inv.Id = ret.InvestorId

	update proj set proj.[Status] = 1
	from project proj 
	where proj.id = @ProjectId
END


GO
/****** Object:  StoredProcedure [dbo].[SubmitInvestmentApplication]    Script Date: 26/08/2018 12:37:20 AM ******/
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
