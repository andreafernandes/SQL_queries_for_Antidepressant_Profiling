USE [SQLCRIS_User]
GO

/****** Object:  View [dbo].[AFernandes_Antidepressant_Distinct_OneColumnPerAD_Mar15_Aug15]    Script Date: 07/21/2016 18:01:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





-- This is the third query to run to build a table of patients who are on 
-- antidepressant during the observation period. 
-- It uses the distinct list generated in 
-- dbo.AFernandes_Antidepressant_Distinct_Snapshot_Mar15_Aug15 and left joins
-- flags from dbo.AFernandes_Antidepressants_MultiRowPerPatient_Snapshot_MAR2015_AUG2015






ALTER VIEW [dbo].[AFernandes_Antidepressant_Distinct_OneColumnPerAD_Mar15_Aug15] AS 

select  dbo.AFernandes_Antidepressant_Distinct_Snapshot_Mar15_Aug15.BrcId as PatientonAD
	  , (CASE WHEN LithiumFlagTable.brcid IS NOT NULL THEN 1 ELSE 0 END ) LithiumFlag
	  , (CASE WHEN LithiumFlagTable.brcid IS NOT NULL THEN LithiumStartDate ELSE 0 END) LithiumStartDate
      , (CASE WHEN TCA_AMITRIPTYLINEFlagTable.brcid IS NOT NULL THEN 1 ELSE 0 END ) TCA_AmitriptylineFlag
      , (CASE WHEN TCA_AMITRIPTYLINEFlagTable.brcid IS NOT NULL THEN TCA_AmitriptylineStartDate ELSE 0 END) AmitStartDate
      , (CASE WHEN TCA_CLOMIPRAMINEFlagTable.brcid IS NOT NULL THEN 1 ELSE 0 END ) TCA_CLOMIPRAMINEFlag
      , (CASE WHEN TCA_CLOMIPRAMINEFlagTable.brcid IS NOT NULL  THEN TCA_CLOMIPRAMINEStartDate ELSE 0 END) ClomipStartDate
      , (CASE WHEN TCA_DOSULEPINFlagTable.brcid IS NOT NULL THEN 1 ELSE 0 END ) TCA_DOSULEPINFlag
      , (CASE WHEN TCA_DOSULEPINFlagTable.brcid IS NOT NULL  THEN TCA_DOSULEPINStartDate ELSE 0 END) DosulepStartDate
      , (CASE WHEN TCA_DOXEPINFlagTable.brcid IS NOT NULL THEN 1 ELSE 0 END )TCA_DOXEPINFlag
      , (CASE WHEN TCA_DOXEPINFlagTable.brcid IS NOT NULL THEN TCA_DoxepinStartDate ELSE 0 END) DoxepStartDate
      , (CASE WHEN TCA_IMIPRAMINEFlagTable.brcid IS NOT NULL THEN 1 ELSE 0 END )TCA_IMIPRAMINEFlag
      , (CASE WHEN TCA_IMIPRAMINEFlagTable.brcid IS NOT NULL  THEN TCA_IMIPRAMINEStartDate ELSE 0 END) ImipStartDate
      , (CASE WHEN TCA_LOFEPRAMINEFlagTable.brcid IS NOT NULL THEN 1 ELSE 0 END )TCA_LOFEPRAMINEFlag
      , (CASE WHEN TCA_LOFEPRAMINEFlagTable.brcid IS NOT NULL  THEN TCA_LOFEPRAMINEStartDate ELSE 0 END) LofepraStartDate
      , (CASE WHEN TCA_NORTRIPTYLINEFlagTable.brcid IS NOT NULL THEN 1 ELSE 0 END ) TCA_NORTRIPTYLINEFlag
      , (CASE WHEN TCA_NORTRIPTYLINEFlagTable.brcid IS NOT NULL  THEN TCA_NORTRIPTYLINEStartDate ELSE 0 END) NortripStartDate
      , (CASE WHEN TCA_TRIMIPRAMINEFlagTable.brcid IS NOT NULL THEN 1 ELSE 0 END ) TCA_TRIMIPRAMINEFlag
      , (CASE WHEN TCA_TRIMIPRAMINEFlagTable.brcid IS NOT NULL  THEN TCA_TRIMIPRAMINEStartDate ELSE 0 END) TrimipStartDate
      , (CASE WHEN TCARELATED_MIANSERINFlagTable.brcid IS NOT NULL THEN 1 ELSE 0 END ) TCARELATED_MIANSERINFlag
      , (CASE WHEN TCARELATED_MIANSERINFlagTable.brcid IS NOT NULL  THEN TCARELATED_MIANSERINStartDate ELSE 0 END) MianStartDate
      , (CASE WHEN TCARELATED_TRAZODONEFlagTable.brcid IS NOT NULL THEN 1 ELSE 0 END ) TCARELATED_TRAZODONEFlag
      , (CASE WHEN TCARELATED_TRAZODONEFlagTable.brcid IS NOT NULL  THEN TCARELATED_TRAZODONEStartDate ELSE 0 END) TrazoStartDate
      , (CASE WHEN MAOI_PHENELZINEFlagTable.brcid IS NOT NULL THEN 1 ELSE 0 END ) MAOI_PHENELZINEFlag
      , (CASE WHEN MAOI_PHENELZINEFlagTable.brcid IS NOT NULL  THEN MAOI_PHENELZINEStartDate ELSE 0 END) PhenelStartDate
      , (CASE WHEN MAOI_ISOCARBOXAZIDFlagTable.brcid IS NOT NULL THEN 1 ELSE 0 END) MAOI_ISOCARBOXAZIDFlag
      , (CASE WHEN MAOI_ISOCARBOXAZIDFlagTable.brcid IS NOT NULL  THEN MAOI_ISOCARBOXAZIDStartDate ELSE 0 END) IsocarbStartDate
      , (CASE WHEN MAOI_TRANYLCYPROMINEFlagTable.brcid IS NOT NULL THEN 1 ELSE 0 END) MAOI_TRANYLCYPROMAINEFlag
      , (CASE WHEN MAOI_TRANYLCYPROMINEFlagTable.brcid IS NOT NULL  THEN MAOI_TRANYLCYPROMINEStartDate ELSE 0 END) TranylStartDate
      , (CASE WHEN REVERSEMAOI_MOCLOBEMIDEFlagTable.brcid IS NOT NULL THEN 1 ELSE 0 END ) REVERSEMAOI_MOCLOBEMIDEFlag
      , (CASE WHEN REVERSEMAOI_MOCLOBEMIDEFlagTable.brcid IS NOT NULL  THEN REVMAOI_MOCLOBEMIDEStartDate ELSE 0 END) MocloStartDate
      , (CASE WHEN SSRI_CITALOPRAMFlagTable.brcid IS NOT NULL THEN 1 ELSE 0 END ) SSRI_CITALOPRAMFlag
      , (CASE WHEN SSRI_CITALOPRAMFlagTable.brcid IS NOT NULL  THEN SSRI_CITALOPRAMStartDate ELSE 0 END) CitalStartDate
      , (CASE WHEN SSRI_ESCITALOPRAMFlagTable.brcid IS NOT NULL THEN 1 ELSE 0 END) SSRI_ESCITALOPRAMFlag
      , (CASE WHEN SSRI_ESCITALOPRAMFlagTable.brcid IS NOT NULL  THEN SSRI_ESCITALOPRAMStartDate ELSE 0 END) EscitStartDate
      , (CASE WHEN SSRI_FLUOXETINEFlagTable.brcid IS NOT NULL THEN 1 ELSE 0 END ) SSRI_FLUOXETINEFlag
      , (CASE WHEN SSRI_FLUOXETINEFlagTable.brcid IS NOT NULL  THEN SSRI_FLUOXETINEStartDate ELSE 0 END) FluoxStartDate
      , (CASE WHEN SSRI_FLUVOXAMINEFlagTable.brcid IS NOT NULL THEN 1 ELSE 0 END) SSRI_FLUVOXAMINEFlag
      , (CASE WHEN SSRI_FLUVOXAMINEFlagTable.brcid IS NOT NULL  THEN SSRI_FLUVOXAMINEStartDate ELSE 0 END) FluvoxStartDate
      , (CASE WHEN SSRI_PAROXETINEFlagTable.brcid IS NOT NULL THEN 1 ELSE 0 END ) SSRI_PAROXETINEFlag
      , (CASE WHEN SSRI_PAROXETINEFlagTable.brcid IS NOT NULL  THEN SSRI_PAROXETINEStartDate ELSE 0 END) ParoxStartDate      
      , (CASE WHEN SSRI_SERTRALINEFlagTable.brcid IS NOT NULL THEN 1 ELSE 0 END ) SSRI_SERTRALINEFlag
      , (CASE WHEN SSRI_SERTRALINEFlagTable.brcid IS NOT NULL  THEN SSRI_SERTRALINEStartDate ELSE 0 END) SertStartDate
      , (CASE WHEN OTHERAD_MIRTAZAPINEFlagTable.brcid IS NOT NULL THEN 1 ELSE 0 END ) OTHERAD_MIRTAZAPINEFlag
      , (CASE WHEN OTHERAD_MIRTAZAPINEFlagTable.brcid IS NOT NULL  THEN OTHERAD_MIRTAZAPINEStartDate ELSE 0 END) MirtStartDate
      , (CASE WHEN SNRI_REBOXETINEFlagTable.brcid IS NOT NULL THEN 1 ELSE 0 END ) SNRI_REBOXETINEFlag      
      , (CASE WHEN SNRI_REBOXETINEFlagTable.brcid IS NOT NULL  THEN SNRI_REBOXETINEStartDate ELSE 0 END) ReboxStartDate
      , (CASE WHEN OTHERAD_VENLAFAXINEFlagTable.brcid IS NOT NULL THEN 1 ELSE 0 END ) OTHERAD_VENLAFAXINEFlag 
      , (CASE WHEN OTHERAD_VENLAFAXINEFlagTable.brcid IS NOT NULL  THEN OTHERAD_VENLAFAXINEStartDate ELSE 0 END) VenlaStartDate
      , (CASE WHEN OTHERAD_AGOMELATINFlagTable.brcid IS NOT NULL THEN 1 ELSE 0 END ) OTHERAD_AGOMELATINFlag              
      , (CASE WHEN OTHERAD_AGOMELATINFlagTable.brcid IS NOT NULL  THEN OTHERAD_AGOMELATINStartDate ELSE 0 END) AgoStartDate
      , (CASE WHEN SNRI_DOLUXETINEFlagTable.brcid IS NOT NULL THEN 1 ELSE 0 END ) SNRI_DOLUXETINEFlag  
      --, (CASE WHEN OTHERAD_FLUPENTIXOLFlagTable.brcid IS NOT NULL THEN 1 ELSE 0 END ) OTHERAD_FLUPENTIXOLFlag  
      , (CASE WHEN SNRI_DOLUXETINEFlagTable.brcid IS NOT NULL  THEN SNRI_DOLUXETINEStartDate ELSE 0 END) DoluxeStartDate     
      , (CASE WHEN OTHERAD_TRYPTOPHANFlagTable.brcid IS NOT NULL THEN 1 ELSE 0 END ) OTHERAD_TRYPTOPHANFlag                         
      , (CASE WHEN OTHERAD_TRYPTOPHANFlagTable.brcid IS NOT NULL  THEN OTHERAD_TRYPTOPHANStartDate ELSE 0 END) TrypStartDate
      , (CASE WHEN OTHERAD_BUPROPIONFlagTable.brcid IS NOT NULL THEN 1 ELSE 0 END ) OTHERAD_BUPROPIONFlag  
      , (CASE WHEN OTHERAD_BUPROPIONFlagTable.brcid IS NOT NULL  THEN OTHERAD_BUPROPIONStartDate ELSE 0 END) BuproStartDate 
           
from dbo.AFernandes_Antidepressant_Distinct_Snapshot_Mar15_Aug15

------------------------------------------------------------------------------------------------------------------------
left join
(
SELECT brcid, start_date as LithiumStartDate
FROM 
dbo.AFernandes_Antidepressants_MultiRowPerPatient_Snapshot_MAR2015_AUG2015
WHERE       
			(
			drug like '%lithium%' 
         or drug like '%camcolit%'  
         or drug like '%liskonum%' 
         or drug like '%priadel%' 
         or drug like '%li-liquid%' 
		    ) 
		 and
		   (earliestmedstartdate = '1')
		    
) LithiumFlagTable

on dbo.AFernandes_Antidepressant_Distinct_Snapshot_Mar15_Aug15.brcid = LithiumFlagTable.brcid
------------------------------------------------------------------------------------------------------------------------
left join
(
SELECT brcid, start_date as TCA_AmitriptylineStartDate
FROM 
dbo.AFernandes_Antidepressants_MultiRowPerPatient_Snapshot_MAR2015_AUG2015
WHERE       
			(
			drug like '%amitriptyline%' 
	     or drug like '%vanatrip%' --frOM drugs.COm
	     or drug like '%elavil%'   --frOM drugs.COm
	     or drug like '%endep%'    --frOM drugs.COm
	     or DRuG LIKE '%triptaf%'  --COnTAInS AMItRIpTyLINe AnD PErPHEnAZInE
	        )
		 and
		   (earliestmedstartdate = '1')
		    
) TCA_AMITRIPTYLINEFlagTable

on dbo.AFernandes_Antidepressant_Distinct_Snapshot_Mar15_Aug15.brcid = TCA_AMITRIPTYLINEFlagTable.brcid
-----------------------------------------------------------------------------------------------------------------------
left join
(
SELECT brcid, start_date as TCA_CLOMIPRAMINEStartDate
FROM 
dbo.AFernandes_Antidepressants_MultiRowPerPatient_Snapshot_MAR2015_AUG2015
WHERE       
			(
			drug like '%clomipramin%' 
	     or drug like '%anafranil%'
	        )
		 and
		   (earliestmedstartdate = '1')
		    
) TCA_CLOMIPRAMINEFlagTable

on dbo.AFernandes_Antidepressant_Distinct_Snapshot_Mar15_Aug15.brcid = TCA_CLOMIPRAMINEFlagTable.brcid
-----------------------------------------------------------------------------------------------------------------------
left join
(
SELECT brcid, start_date as TCA_DOSULEPINStartDate
FROM 
dbo.AFernandes_Antidepressants_MultiRowPerPatient_Snapshot_MAR2015_AUG2015
WHERE       
			(
			drug like '%dosulepin%' 
	     or drug like '%dothiepin%' --PreViOuSLy KnoWN As DoTHIEPIN
	     or drug like '%prothiden%' 
	     or drug like '%prothiaden%' 
			) 
		 and
		   (earliestmedstartdate = '1')
		    
) TCA_DOSULEPINFlagTable

on dbo.AFernandes_Antidepressant_Distinct_Snapshot_Mar15_Aug15.brcid = TCA_DOSULEPINFlagTable.brcid
-----------------------------------------------------------------------------------------------------------------------
left join
(
SELECT brcid, start_date as TCA_DoxepinStartDate
FROM 
dbo.AFernandes_Antidepressants_MultiRowPerPatient_Snapshot_MAR2015_AUG2015
WHERE       
			(
			drug like '%doxepin%' 
	     or drug like '%sinepin%' 
	     or drug like '%sineq%'  --FroM drug.SCOm
	   --  or drug like '%xepin%' --FRom DRUGS.CoM; removed this because it's picking up mirtazapine typos which is another class of drugs
			) 
		 and
		   (earliestmedstartdate = '1')
		    
) TCA_DOXEPINFlagTable

on dbo.AFernandes_Antidepressant_Distinct_Snapshot_Mar15_Aug15.brcid = TCA_DOXEPINFlagTable.brcid
-----------------------------------------------------------------------------------------------------------------------
left join
(
SELECT brcid, start_date as TCA_IMIPRAMINEStartDate
FROM 
dbo.AFernandes_Antidepressants_MultiRowPerPatient_Snapshot_MAR2015_AUG2015
WHERE       
			(
            drug like '%imipramine%' 
	     or drug like '%tofranil%' -- FroM DrUGS.coM
	        ) 
	     and
		   (earliestmedstartdate = '1')
		    
)AS TCA_IMIPRAMINEFlagTable

on dbo.AFernandes_Antidepressant_Distinct_Snapshot_Mar15_Aug15.brcid = TCA_IMIPRAMINEFlagTable.brcid
-----------------------------------------------------------------------------------------------------------------------
left join
(
SELECT brcid, start_date as TCA_LOFEPRAMINEStartDate
FROM 
dbo.AFernandes_Antidepressants_MultiRowPerPatient_Snapshot_MAR2015_AUG2015
WHERE       
			(
            drug like '%lofepramine%' 
	     or drug like '%lomont%' -- FroM DrUGS.coM
	        )
	     and
		   (earliestmedstartdate = '1')
		    
 ) TCA_LOFEPRAMINEFlagTable

on dbo.AFernandes_Antidepressant_Distinct_Snapshot_Mar15_Aug15.brcid =  TCA_LOFEPRAMINEFlagTable.brcid
-----------------------------------------------------------------------------------------------------------------------
left join
(
SELECT brcid, start_date as TCA_NORTRIPTYLINEStartDate
FROM 
dbo.AFernandes_Antidepressants_MultiRowPerPatient_Snapshot_MAR2015_AUG2015
WHERE       
			(
            drug like '%nortriptyli%' 
	     or drug like '%pamelo%'
	     or drug like '%allegr%' 
	     or drug like '%aventyl%'
	        )
	     and
		   (earliestmedstartdate = '1')
		    
 )  TCA_NORTRIPTYLINEFlagTable

on dbo.AFernandes_Antidepressant_Distinct_Snapshot_Mar15_Aug15.brcid =   TCA_NORTRIPTYLINEFlagTable.brcid
-----------------------------------------------------------------------------------------------------------------------
left join
(
SELECT brcid, start_date as TCA_TRIMIPRAMINEStartDate
FROM 
dbo.AFernandes_Antidepressants_MultiRowPerPatient_Snapshot_MAR2015_AUG2015
WHERE       
			(
            drug like '%trimipram%' 
	     or drug like '%surmonti%' 
		    )
	     and
		   (earliestmedstartdate = '1')
		    
 ) TCA_TRIMIPRAMINEFlagTable

on dbo.AFernandes_Antidepressant_Distinct_Snapshot_Mar15_Aug15.brcid =    TCA_TRIMIPRAMINEFlagTable.brcid
-----------------------------------------------------------------------------------------------------------------------
left join
(
SELECT brcid, start_date as TCARELATED_MIANSERINStartDate
FROM 
dbo.AFernandes_Antidepressants_MultiRowPerPatient_Snapshot_MAR2015_AUG2015
WHERE       
			(
            drug like '%mianserin%'
			) 
	     and
		   (earliestmedstartdate = '1')
		    
 ) TCARELATED_MIANSERINFlagTable

on dbo.AFernandes_Antidepressant_Distinct_Snapshot_Mar15_Aug15.brcid = TCARELATED_MIANSERINFlagTable.brcid
-----------------------------------------------------------------------------------------------------------------------
left join
(
SELECT brcid, start_date as TCARELATED_TRAZODONEStartDate
FROM 
dbo.AFernandes_Antidepressants_MultiRowPerPatient_Snapshot_MAR2015_AUG2015
WHERE       
			(
            drug like '%trazodone%' 
         or drug like '%molipaxin%' 
			) 
	     and
		   (earliestmedstartdate = '1')
		    
 ) TCARELATED_TRAZODONEFlagTable

on dbo.AFernandes_Antidepressant_Distinct_Snapshot_Mar15_Aug15.brcid = TCARELATED_TRAZODONEFlagTable.brcid
-----------------------------------------------------------------------------------------------------------------------
left join
(
SELECT brcid, start_date as MAOI_PHENELZINEStartDate
FROM 
dbo.AFernandes_Antidepressants_MultiRowPerPatient_Snapshot_MAR2015_AUG2015
WHERE       
			(
   			drug like '%phenelzine%' 
         or drug like '%phenylethylhydrazine%'
         --or drug like '%alazin%' ; removed this because it's picking up non AD drugs
         or drug like '%nardil%' 
			) 
	     and
		   (earliestmedstartdate = '1')
		    
 ) MAOI_PHENELZINEFlagTable

on dbo.AFernandes_Antidepressant_Distinct_Snapshot_Mar15_Aug15.brcid = MAOI_PHENELZINEFlagTable.brcid
-----------------------------------------------------------------------------------------------------------------------
left join
(
SELECT brcid, start_date as MAOI_ISOCARBOXAZIDStartDate
FROM 
dbo.AFernandes_Antidepressants_MultiRowPerPatient_Snapshot_MAR2015_AUG2015
WHERE       
			(
   			drug like '%isocarboxazid%' 
			) 
	     and
		   (earliestmedstartdate = '1')
		    
 ) MAOI_ISOCARBOXAZIDFlagTable

on dbo.AFernandes_Antidepressant_Distinct_Snapshot_Mar15_Aug15.brcid = MAOI_ISOCARBOXAZIDFlagTable.brcid
-----------------------------------------------------------------------------------------------------------------------
left join
(
SELECT brcid, start_date as MAOI_TRANYLCYPROMINEStartDate
FROM 
dbo.AFernandes_Antidepressants_MultiRowPerPatient_Snapshot_MAR2015_AUG2015
WHERE       
			(
   			drug like '%tranylcypromin%' 
         or drug like '%parnate%'
			) 
	     and
		   (earliestmedstartdate = '1')
		    
 ) MAOI_TRANYLCYPROMINEFlagTable

on dbo.AFernandes_Antidepressant_Distinct_Snapshot_Mar15_Aug15.brcid = MAOI_TRANYLCYPROMINEFlagTable.brcid
-----------------------------------------------------------------------------------------------------------------------
left join
(
SELECT brcid, start_date as REVMAOI_MOCLOBEMIDEStartDate
FROM 
dbo.AFernandes_Antidepressants_MultiRowPerPatient_Snapshot_MAR2015_AUG2015
WHERE       
			(
   			drug like '%moclobemide%' 
         or drug like '%manerix%'
			) 
	     and
		   (earliestmedstartdate = '1')
		    
 ) REVERSEMAOI_MOCLOBEMIDEFlagTable

on dbo.AFernandes_Antidepressant_Distinct_Snapshot_Mar15_Aug15.brcid = REVERSEMAOI_MOCLOBEMIDEFlagTable.brcid
-----------------------------------------------------------------------------------------------------------------------
left join
(
SELECT brcid, start_date as SSRI_CITALOPRAMStartDate
FROM 
dbo.AFernandes_Antidepressants_MultiRowPerPatient_Snapshot_MAR2015_AUG2015
WHERE       
			(
   			Drug like 'citalopram%' 
         or drug like '%cipramil%' 
         or drug like '%celexa%' 
			) 
	     and
		   (earliestmedstartdate = '1')
		    
 ) SSRI_CITALOPRAMFlagTable

on dbo.AFernandes_Antidepressant_Distinct_Snapshot_Mar15_Aug15.brcid = SSRI_CITALOPRAMFlagTable.brcid
-----------------------------------------------------------------------------------------------------------------------
left join
(
SELECT brcid, start_date as SSRI_ESCITALOPRAMStartDate
FROM 
dbo.AFernandes_Antidepressants_MultiRowPerPatient_Snapshot_MAR2015_AUG2015
WHERE       
			(
   			drug like '%escitalopram%' 
         or drug like '%cipralex%'
         or drug like '%lexapro%'
			) 
	     and
		   (earliestmedstartdate = '1')
		    
 ) SSRI_ESCITALOPRAMFlagTable

on dbo.AFernandes_Antidepressant_Distinct_Snapshot_Mar15_Aug15.brcid = SSRI_ESCITALOPRAMFlagTable.brcid
-----------------------------------------------------------------------------------------------------------------------
left join
(
SELECT brcid, start_date as SSRI_FLUOXETINEStartDate
FROM 
dbo.AFernandes_Antidepressants_MultiRowPerPatient_Snapshot_MAR2015_AUG2015
WHERE       
			(
   			drug like '%fluoxetine%' 
         or drug like '%prozac%' 
         or drug like '%sarafem%'
         or drug like '%bellzac%' --from drugs.com; used in Ireland
         or drug like '%oxactin%' --from drugs.com; drug company: Discovery
			) 
	     and
		   (earliestmedstartdate = '1')
		    
 ) SSRI_FLUOXETINEFlagTable

on dbo.AFernandes_Antidepressant_Distinct_Snapshot_Mar15_Aug15.brcid = SSRI_FLUOXETINEFlagTable.brcid
-----------------------------------------------------------------------------------------------------------------------
left join
(
SELECT brcid, start_date as SSRI_FLUVOXAMINEStartDate
FROM 
dbo.AFernandes_Antidepressants_MultiRowPerPatient_Snapshot_MAR2015_AUG2015
WHERE       
			(
			drug like '%fluvoxamine%' 
	     or drug like '%faverin%' 
			) 
	     and
		   (earliestmedstartdate = '1')
		    
 ) SSRI_FLUVOXAMINEFlagTable

on dbo.AFernandes_Antidepressant_Distinct_Snapshot_Mar15_Aug15.brcid = SSRI_FLUVOXAMINEFlagTable.brcid
-----------------------------------------------------------------------------------------------------------------------
left join
(
SELECT brcid, start_date as SSRI_PAROXETINEStartDate
FROM 
dbo.AFernandes_Antidepressants_MultiRowPerPatient_Snapshot_MAR2015_AUG2015
WHERE       
			(
			drug like'%paroxetin%' 
	     or drug like '%paxil%' --from drugs.com; not specified for UK use but used in US
	     or drug like '%seroxat%'  
			) 
	     and
		   (earliestmedstartdate = '1')
		    
 ) SSRI_PAROXETINEFlagTable

on dbo.AFernandes_Antidepressant_Distinct_Snapshot_Mar15_Aug15.brcid = SSRI_PAROXETINEFlagTable.brcid
-----------------------------------------------------------------------------------------------------------------------
left join
(
SELECT brcid, start_date as SSRI_SERTRALINEStartDate
FROM 
dbo.AFernandes_Antidepressants_MultiRowPerPatient_Snapshot_MAR2015_AUG2015
WHERE       
			(
			drug like '%sertra%' 
	     or drug like '%bellsert%' --from drugs.com; used in Ireland
	     or drug like '%lustral%' 
	     or drug like '%seretra%' --from drugs.com; used in Ireland   
	     or drug like '%zoloft%'  -- from drugs.come; not specified for UK but used in US
	     and
		   (earliestmedstartdate = '1')
		    )
 ) SSRI_SERTRALINEFlagTable

on dbo.AFernandes_Antidepressant_Distinct_Snapshot_Mar15_Aug15.brcid = SSRI_SERTRALINEFlagTable.brcid
-----------------------------------------------------------------------------------------------------------------------
left join
(
SELECT brcid, start_date as OTHERAD_MIRTAZAPINEStartDate
FROM 
dbo.AFernandes_Antidepressants_MultiRowPerPatient_Snapshot_MAR2015_AUG2015
WHERE       
			(
			drug like '%mirtazapin%' 
         or drug like '%zispin%' 
         or drug like '%mirza%'
	     and
		   (earliestmedstartdate = '1')
		    )
 ) OTHERAD_MIRTAZAPINEFlagTable

on dbo.AFernandes_Antidepressant_Distinct_Snapshot_Mar15_Aug15.brcid = OTHERAD_MIRTAZAPINEFlagTable.brcid
-----------------------------------------------------------------------------------------------------------------------
left join
(
SELECT brcid, start_date as SNRI_REBOXETINEStartDate
FROM 
dbo.AFernandes_Antidepressants_MultiRowPerPatient_Snapshot_MAR2015_AUG2015
WHERE       
			(
			 drug like '%reboxet%' 
          or drug like '%reboxat%'
          or drug like '%edronax%'
	     and
		   (earliestmedstartdate = '1')
		    )
 ) SNRI_REBOXETINEFlagTable

on dbo.AFernandes_Antidepressant_Distinct_Snapshot_Mar15_Aug15.brcid = SNRI_REBOXETINEFlagTable.brcid
-----------------------------------------------------------------------------------------------------------------------
left join
(
SELECT brcid, start_date as OTHERAD_VENLAFAXINEStartDate
FROM 
dbo.AFernandes_Antidepressants_MultiRowPerPatient_Snapshot_MAR2015_AUG2015
WHERE       
			(
		  	 drug like '%venlafaxine%' 
          or drug like '%effexor%'
          or drug like '%efexor%'
	     and
		   (earliestmedstartdate = '1')
		    )
 ) OTHERAD_VENLAFAXINEFlagTable

on dbo.AFernandes_Antidepressant_Distinct_Snapshot_Mar15_Aug15.brcid = OTHERAD_VENLAFAXINEFlagTable.brcid
-----------------------------------------------------------------------------------------------------------------------
left join
(
SELECT brcid, start_date as OTHERAD_AGOMELATINStartDate
FROM 
dbo.AFernandes_Antidepressants_MultiRowPerPatient_Snapshot_MAR2015_AUG2015
WHERE       
			(
			drug like '%agomelatin%' 
         or drug like '%valdoxan%' 
	     and
		   (earliestmedstartdate = '1')
		    )
 ) OTHERAD_AGOMELATINFlagTable

on dbo.AFernandes_Antidepressant_Distinct_Snapshot_Mar15_Aug15.brcid = OTHERAD_AGOMELATINFlagTable.brcid
-----------------------------------------------------------------------------------------------------------------------
left join
(
SELECT brcid, start_date as SNRI_DOLUXETINEStartDate
FROM 
dbo.AFernandes_Antidepressants_MultiRowPerPatient_Snapshot_MAR2015_AUG2015
WHERE       
			(
			 drug like '%duloxetin%' 
          or drug like '%cymbalta%' 
          or drug like '%yentreve%' 
	     and
		   (earliestmedstartdate = '1')
		    )
 ) SNRI_DOLUXETINEFlagTable

on dbo.AFernandes_Antidepressant_Distinct_Snapshot_Mar15_Aug15.brcid = SNRI_DOLUXETINEFlagTable.brcid
-----------------------------------------------------------------------------------------------------------------------
--EXCLUDED THIS AS ROB AND RINA SUGGESTED AFTER SUPERVISION MEETING. 15/12/2015

--left join
--(
--SELECT brcid, start_date
--FROM 
--dbo.AFernandes_Antidepressants_MultiRowPerPatient_Snapshot_MAR2015_AUG2015
--WHERE       
--			(
--			drug like '%flupentixol%' 
--         or drug like '%fluanxol%' 
--		 or drug like '%depixol%' 
--	     and
--		   (earliestmedstartdate = '1')
--		    )
-- ) OTHERAD_FLUPENTIXOLFlagTable

--on dbo.AFernandes_Antidepressant_Distinct_Snapshot_Mar15_Aug15.brcid = OTHERAD_FLUPENTIXOLFlagTable.brcid
-----------------------------------------------------------------------------------------------------------------------
left join
(
SELECT brcid, start_date as OTHERAD_TRYPTOPHANStartDate
FROM 
dbo.AFernandes_Antidepressants_MultiRowPerPatient_Snapshot_MAR2015_AUG2015
WHERE       
			(
				drug like '%tryptophan%' 
		     or drug like '%optimax%' 
	     and
		   (earliestmedstartdate = '1')
		    )
 ) OTHERAD_TRYPTOPHANFlagTable

on dbo.AFernandes_Antidepressant_Distinct_Snapshot_Mar15_Aug15.brcid = OTHERAD_TRYPTOPHANFlagTable.brcid
-----------------------------------------------------------------------------------------------------------------------
left join
(
SELECT brcid, start_date as OtherAD_BupropionStartDate
FROM 
dbo.AFernandes_Antidepressants_MultiRowPerPatient_Snapshot_MAR2015_AUG2015
WHERE       
			(
			drug like '%bupropion%' 
			)
	     and
		   (earliestmedstartdate = '1')
		    
 ) OTHERAD_BUPROPIONFlagTable

on dbo.AFernandes_Antidepressant_Distinct_Snapshot_Mar15_Aug15.brcid =  OTHERAD_BUPROPIONFlagTable.brcid  	  
		  

		









GO


