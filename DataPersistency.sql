/*
EXEC	[AgriSibo].[dbo].SubmitInvestmentApplication
		@InvestorId = 1,	--Enrico
		@ProjectId = 1,
		@InvestedAmount = 80,
		@ExpectedReturnRate = 0,
		@ExpectedReturnAmount = 110

EXEC	[AgriSibo].[dbo].SubmitInvestmentApplication
		@InvestorId = 2,	--Jonel
		@ProjectId = 1,
		@InvestedAmount = 70,
		@ExpectedReturnRate = 0,
		@ExpectedReturnAmount = 110

EXEC	[AgriSibo].[dbo].AcceptInvestmentApplication
		@ProjectId = 1,
		@InvestorId = 1

--Escrow to Farmer
EXEC	[AgriSibo].[dbo].[InitiateProject] @ProjectId = 1

--Add funds to Farmer
EXEC	[AgriSibo].[dbo].[AddFundsToFarmer] @id = 1, @fundsToAdd = 200

--Add funds to Farmer
EXEC	[AgriSibo].[dbo].[CompleteProject] @ProjectId = 1
*/