delete from [AgriSibo].dbo.Investment

/*
delete from [AgriSibo].dbo.Project

EXEC	[AgriSibo].[dbo].[AddProject]
		@farmersCropId = 3,
		@name = 'September Cycle (Durian)',
		@estimatedBudget = 15000,
		@committedDate = '2018-12-25',
		@defaultReturnRate = '0',
		@defaultReturnAmount = 17500.00

EXEC	[AgriSibo].[dbo].[AddProject]
		@farmersCropId = 4,
		@name = 'September Cycle (Cacao)',
		@estimatedBudget = 8000,
		@committedDate = '2018-12-25',
		@defaultReturnRate = 0,
		@defaultReturnAmount = 12000

EXEC	[AgriSibo].[dbo].[AddProject]
		@farmersCropId = 5,
		@name = 'September Cycle (Mango)',
		@estimatedBudget = 7000,
		@committedDate = '2018-12-25',
		@defaultReturnRate = 0,
		@defaultReturnAmount = 8500

EXEC	[AgriSibo].[dbo].[AddProject]
		@farmersCropId = 6,
		@name = 'September Cycle (Banana)',
		@estimatedBudget = 7000,
		@committedDate = '2018-12-25',
		@defaultReturnRate = 0,
		@defaultReturnAmount = 8500
*/

update AgriSibo.dbo.Investor set RemainingInvestmentFunds = 25000 where id = 1
update AgriSibo.dbo.Investor set RemainingInvestmentFunds = 35000 where id = 2
update AgriSibo.dbo.Investor set RemainingInvestmentFunds = 0 where id = 3

update AgriSibo.dbo.Project set Status = 0

update AgriSibo.dbo.Farmer set RemainingInvestmentFunds = 0 where id in(1, 2)