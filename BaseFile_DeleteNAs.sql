/****** Script for SelectTopNRows command from SSMS  ******/
delete 
    
  FROM [ustull0036\apsreport].[Finance].[dbo].[Item_BaseFileStage] 
  where shortitem in (
  SELECT  distinct
     ShortItem
   
   
	  from [ustull0036\apsreport].[Finance].[dbo].Item_BaseFile )



	  