

use master;

insert into 
[ustull0036\apsreport].finance.dbo.item_basefile (
		[RoutingType]
      ,[ShortItem]
      ,[PartNumber]
      ,[BranchPlant]
      ,[WorkCenter]
      ,[EffectiveDate]
      ,[EndDate]
      ,[TimeBasis]
      ,[OpSeq]
      ,[UnitOfMeasure]
      ,[MachineStandard]
      ,[LaborStandard]
      ,[SetUpStandard]
      ,[CrewSize_Base]
      ,[BaseAddDate]
      ,[LastUpdate])

	  SELECT DISTINCT 
a.IRTRT AS RoutingType ,
a.IRKIT AS ShortItem ,
a.IRKITL AS PartNumber ,
ltrim(rtrim(a.IRMMCU)) AS BranchPlant ,
ltrim(rtrim(a.iRMCU)) AS WorkCenter ,
a1.onjobn AS EffectiveDate,
a2.onjobn AS EndDate,
a.IRTIMB AS TimeBasis,
CAST(a.iropsq/100 AS int) AS OpSeq,
a.iruom AS UnitOfMeasure,
a.irrunm*.01 AS MachineStandard ,
a.irrunl*.01 AS LaborStandard,
a.irsetl*.01 AS SetUpStandard,
CAST(a.irsetc*.1 AS int) AS CrewSize_Base,
a3.onjobn AS BaseAddDate,
a4.onjobn AS LastUpdate

FROM as400.s1049zkm.amsdta.F3003_B a LEFT JOIN as400.s1049zkm.amsdta.f00365 a1 ON a1.ONDTEJ = a.IREFFF 
				LEFT JOIN as400.s1049zkm.amsdta.F00365 a2 ON a2.ONDTEJ = a.IREFFT 
					LEFT JOIN as400.s1049zkm.amsdta.F00365 a3 ON a3.ONDTEJ = a.IRURDT
						LEFT JOIN as400.s1049zkm.amsdta.F00365 a4 ON a4.ONDTEJ = a.IRUPMJ 

