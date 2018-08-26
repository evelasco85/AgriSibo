/*
--EXEC	[AgriSibo].[dbo].[AddProject]
--		@farmersCropId = 3,
--		@name = 'September Cycle (Durian)',
--		@estimatedBudget = 15000,
--		@committedDate = '2018-12-25',
--		@defaultReturnRate = '0',
--		@defaultReturnAmount = 17500.00

--EXEC	[AgriSibo].[dbo].[AddProject]
--		@farmersCropId = 4,
--		@name = 'September Cycle (Cacao)',
--		@estimatedBudget = 8000,
--		@committedDate = '2018-12-25',
--		@defaultReturnRate = 0,
--		@defaultReturnAmount = 12000

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