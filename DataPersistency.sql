/*
EXEC	[AgriSibo].[dbo].SubmitInvestmentApplication
		@InvestorId = 1,	--Enrico
		@ProjectId = 17,
		@InvestedAmount = 10000,
		@ExpectedReturnRate = 0,
		@ExpectedReturnAmount = 12500

EXEC	[AgriSibo].[dbo].SubmitInvestmentApplication
		@InvestorId = 2,	--Jonel
		@ProjectId = 17,
		@InvestedAmount = 5000,
		@ExpectedReturnRate = 0,
		@ExpectedReturnAmount = 10000

EXEC	[AgriSibo].[dbo].AcceptInvestmentApplication
		@ProjectId = 17,
		@InvestorId = 1

--Escrow to Farmer
EXEC	[AgriSibo].[dbo].[InitiateProject] @ProjectId = 17

--Add funds to Farmer
EXEC	[AgriSibo].[dbo].[AddFundsToFarmer] @id = 1, @fundsToAdd = 10000

--Complete the project
EXEC	[AgriSibo].[dbo].[CompleteProject] @ProjectId = 17
*/