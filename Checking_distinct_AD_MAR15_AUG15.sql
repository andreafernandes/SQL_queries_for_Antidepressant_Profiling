SELECT * 

INTO SQLCRIS_User.dbo.Afernandes_Antidepressant_MAR15_AUG15_with_dates

FROM 

(SELECT [PatientonAD]
      ,[LithiumFlag]
      ,[LithiumStartDate]
      ,[TCA_AmitriptylineFlag]
      ,[AmitStartDate]
      ,[TCA_CLOMIPRAMINEFlag]
      ,[ClomipStartDate]
      ,[TCA_DOSULEPINFlag]
      ,[DosulepStartDate]
      ,[TCA_DOXEPINFlag]
      ,[DoxepStartDate]
      ,[TCA_IMIPRAMINEFlag]
      ,[ImipStartDate]
      ,[TCA_LOFEPRAMINEFlag]
      ,[LofepraStartDate]
      ,[TCA_NORTRIPTYLINEFlag]
      ,[NortripStartDate]
      ,[TCA_TRIMIPRAMINEFlag]
      ,[TrimipStartDate]
      ,[TCARELATED_MIANSERINFlag]
      ,[MianStartDate]
      ,[TCARELATED_TRAZODONEFlag]
      ,[TrazoStartDate]
      ,[MAOI_PHENELZINEFlag]
      ,[PhenelStartDate]
      ,[MAOI_ISOCARBOXAZIDFlag]
      ,[IsocarbStartDate]
      ,[MAOI_TRANYLCYPROMAINEFlag]
      ,[TranylStartDate]
      ,[REVERSEMAOI_MOCLOBEMIDEFlag]
      ,[MocloStartDate]
      ,[SSRI_CITALOPRAMFlag]
      ,[CitalStartDate]
      ,[SSRI_ESCITALOPRAMFlag]
      ,[EscitStartDate]
      ,[SSRI_FLUOXETINEFlag]
      ,[FluoxStartDate]
      ,[SSRI_FLUVOXAMINEFlag]
      ,[FluvoxStartDate]
      ,[SSRI_PAROXETINEFlag]
      ,[ParoxStartDate]
      ,[SSRI_SERTRALINEFlag]
      ,[SertStartDate]
      ,[OTHERAD_MIRTAZAPINEFlag]
      ,[MirtStartDate]
      ,[SNRI_REBOXETINEFlag]
      ,[ReboxStartDate]
      ,[OTHERAD_VENLAFAXINEFlag]
      ,[VenlaStartDate]
      ,[OTHERAD_AGOMELATINFlag]
      ,[AgoStartDate]
      ,[SNRI_DOLUXETINEFlag]
      ,[DoluxeStartDate]
      ,[OTHERAD_TRYPTOPHANFlag]
      ,[TrypStartDate]
      ,[OTHERAD_BUPROPIONFlag]
      ,[BuproStartDate]
  FROM [SQLCRIS_User].[dbo].[AFernandes_Antidepressant_Distinct_OneColumnPerAD_Mar15_Aug15]
  )gOTABLE

--- 10799 rows (this took just over 20 minutes to run) 


SELECT Count(distinct([PatientonAD]))
     
  FROM [SQLCRIS_User].[dbo].[AFernandes_Antidepressant_Distinct_OneColumnPerAD_Mar15_Aug15]
GO
--- 10799 rows (this took just under 20 minutes to run) 

-- Putting the query in a table took 27.27minutes

--(10799 row(s) affected)