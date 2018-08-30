

insert into [ustull0036\apsreport].finance.dbo.item_basefile (
[RoutingType]
      ,[ShortItem]
      ,[PartNumber]
      ,[BranchPlant]
      ,[WorkCenter]
      ,[TimeBasis]
      ,[OpSeq]
      ,[UnitOfMeasure]
      ,[MachineStandard]
      ,[LaborStandard]
      ,[SetUpStandard]
      ,[CrewSize]
      ,[BaseAddDate]
      ,[UPMJ]
      ,[RecordAddDate])

	  select * from [ustull0036\apsreport].finance.dbo.item_basefilestage