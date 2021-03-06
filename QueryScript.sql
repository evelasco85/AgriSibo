use AgriSibo

SELECT Id, name Farmers, RemainingInvestmentFunds Funds  FROM [AgriSibo].[dbo].[Farmer]
SELECT Id, name [Investors], RemainingInvestmentFunds [Funds] FROM [AgriSibo].[dbo].[Investor]

SELECT
	proj.[Name] [Projects]
	,farm.Name [Farm]
	,crop.Name [Crop]
	,farmer.Name [Farmer]
	,proj.[EstimatedBudget] [Expected Budget]
	,proj.[CommittedDate] [Payment to investor date]
	,[Status] [S-Code]
	,case([status])
		 when 0 then 'Work'
		 when 1 then 'Open'
		 when 2 then 'History'
	end [Status]
FROM [AgriSibo].[dbo].[Project] proj
inner join FarmersCrop fc on
	fc.Id = proj.FarmersCropId
	inner join Farm farm on
		farm.id = fc.FarmId
		inner join Farmer farmer on
			farmer.id = farm.FarmerId
	inner join Crop crop on
		crop.Id = fc.CropId



SELECT
	investor.Name [Investor Name],
	proj.Name [Project],
	inv.InvestedAmount [Investment Amount],
	inv.ExpectedReturnAmount [Expected Returns],
	(inv.ExpectedReturnAmount - inv.InvestedAmount) [Expected Earnings],
	inv.AcceptedByFarmer [Approved by Farmer]
FROM [AgriSibo].[dbo].Investment inv
inner join Investor investor on
	inv.InvestorId = investor.id
inner join Project proj on
	inv.ProjectId = proj.Id

