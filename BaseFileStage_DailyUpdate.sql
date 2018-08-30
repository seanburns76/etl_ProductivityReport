

use master;
declare @maxurdt int = (select max(upmj)  from [ustull0036\apsreport].finance.dbo.item_basefile)

insert into 
[ustull0036\apsreport].finance.dbo.item_basefilestage (
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
	  ,RecordAddDate)

	  SELECT 
a.IRTRT AS RoutingType ,
a.IRKIT AS ShortItem ,
a.IRKITL AS PartNumber ,
ltrim(rtrim(a.IRMMCU)) AS BranchPlant ,
ltrim(rtrim(a.iRMCU)) AS WorkCenter ,
a.IRTIMB AS TimeBasis,
a.iropsq  AS OpSeq,
a.iruom AS UnitOfMeasure,
a.irrunm AS MachineStandard ,
a.irrunl AS LaborStandard,
a.irsetl AS SetUpStandard,
w.iwsetc  AS CrewSize,
cast(getdate() as date) as BaseAddDate,
a.irupmj as UPMJ,
GETDATE() as RecordAddDate


FROM as400.s1049zkm.amsdta.F3003 a LEFT JOIN as400.s1049zkm.amsdta.f30006 w on w.iwmmcu=a.irmmcu and w.iwmcu=a.irmcu
where a.irupmj >= @maxurdt and a.irtrt = 'm'
						

