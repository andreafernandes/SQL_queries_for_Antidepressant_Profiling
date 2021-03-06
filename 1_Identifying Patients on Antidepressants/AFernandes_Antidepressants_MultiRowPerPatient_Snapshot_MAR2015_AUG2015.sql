USE [SQLCRIS_User]
GO

/****** Object:  View [dbo].[AFernandes_Antidepressants_MultiRowPerPatient_Snapshot_MAR2015_AUG2015]    Script Date: 07/21/2016 18:00:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- To identify individuals on AD medication during the MARCH 2015 AND AUGUST 2015 observation period
-- Please run this code first. 


-- This view selects and creates a row per antidepressant that a patient is on 
-- during the observation period
-- From 1st March 2015 to 31st August 2015

ALTER VIEW [dbo].[AFernandes_Antidepressants_MultiRowPerPatient_Snapshot_MAR2015_AUG2015] AS



 

				(
				select * 

				from 
				(					 select   *
											,ROW_NUMBER() OVER (PARTITION BY brcid,
													(
													CASE 
														   WHEN drug like '%lithium%' 
															 or drug like '%camcolit%'  
															 or drug like '%liskonum%' 
															 or drug like '%priadel%' 
															 or drug like '%li-liquid%' 
														   THEN 'LITHIUM'
														   

														   WHEN drug like '%amitriptyline%' 
															 or drug like '%vanatrip%' --frOM drugs.COm
															 or drug like '%elavil%'   --frOM drugs.COm
															 or drug like '%endep%'    --frOM drugs.COm
															 or DRuG LIKE '%triptaf%'  --COnTAInS AMItRIpTyLINe AnD PErPHEnAZInE
														   THEN 'TCA_AMITRIPTYLINE'
														   
														   WHEN drug like '%clomipramin%' 
															 or drug like '%anafranil%' 
														   THEN 'TCA_Clomipramine'
														   
														   WHEN drug like '%dosulepin%' 
															 or drug like '%dothiepin%' --PreViOuSLy KnoWN As DoTHIEPIN
															 or drug like '%prothiden%' 
															 or drug like '%prothiaden%' 
														   THEN 'TCA_Dosulepin'
														     
														   WHEN drug like '%doxepin%' 
															 or drug like '%sinepin%' 
															 or drug like '%sineq%'  --FroM drug.SCOm
															-- or drug like '%xepin%' --FRom DRUGS.CoM ---picks up type of SSRI Mirtazapine
														   THEN 'TCA_Doxepin'
														     
														   WHEN drug like '%imipramine%' 
															 or drug like '%tofranil%' -- FroM DrUGS.coM
														   THEN 'TCA_Imipramine'  
														     
														   WHEN drug like '%lofepramine%' 
															 or drug like '%lomont%'
														   THEN 'TCA_Lofepramine'
																
														   WHEN drug like '%nortriptyli%' 
															 or drug like '%pamelo%'
															 or drug like '%allegr%' 
															 or drug like '%aventyl%'
														   THEN 'TCA_Nortriptylin'
														   
														   WHEN drug like '%trimipram%' 
															 or drug like '%surmonti%' 
														   THEN 'TCA_Trimipramine'
													       
														   WHEN drug like '%mianserin%' 
														   THEN 'TCArelated_Mianserin'
													       
														   WHEN drug like '%trazodone%' 
															 or drug like '%molipaxin%' 
														   THEN 'TCArelated_Trazodone'
													       
														   WHEN drug like '%phenelzine%' 
															 or drug like '%phenylethylhydrazine%'
															-- or drug like '%alazin%' picks up non-AD drugs
															 or drug like '%nardil%' 
														   THEN 'MAOI_Phenelzine'
													       
														   WHEN drug like '%isocarboxazid%' 
														   THEN 'MAOI_Isocarboxazid'
													       
														   WHEN drug like '%tranylcypromin%' 
															 or drug like '%parnate%'
														   THEN 'MAOI_Tranylcypromine'

														   WHEN drug like '%moclobemide%' 
															 or drug like '%manerix%' 
														   THEN 'REVERSEMAOI_Moclobemide'
													       
														   WHEN Drug like 'citalopram%' 
															 or drug like '%cipramil%' 
															 or drug like '%celexa%' 
														   THEN 'SSRI_Citalopram'
													         
														   WHEN drug like '%escitalopram%' 
															 or drug like '%cipralex%'
															 or drug like '%lexapro%'
														   THEN 'SSRI_Escitalopram' 
													         
														   WHEN drug like '%fluoxetine%' 
															 or drug like '%prozac%' 
															 or drug like '%sarafem%'
															 or drug like '%bellzac%' --from drugs.com; used in Ireland
															 or drug like '%oxactin%' --from drugs.com; drug company: Discovery
														   THEN 'SSRI_Fluoxetine'
													       
														   WHEN drug like '%fluvoxamine%' 
															 or drug like '%faverin%' 
														   THEN 'SSRI_Fluvoxamine'
														   
														   WHEN drug like'%paroxetin%' 
															 or drug like '%paxil%' --from drugs.com; not specified for UK use but used in US
															 or drug like '%seroxat%' 
														   THEN 'SSRI_Paroxetine'
														   
														   WHEN drug like '%sertra%' 
															 or drug like '%bellsert%' --from drugs.com; used in Ireland
															 or drug like '%lustral%' 
															 or drug like '%seretra%' --from drugs.com; used in Ireland   
															 or drug like '%zoloft%'  -- from drugs.come; not specified for UK but used in US
														   THEN 'SSRIs_Sertraline'
													 
														   WHEN drug like '%mirtazapin%' 
															 or drug like '%mirtazepin%' 
															 or drug like '%zispin%' 
															 or drug like '%mirza%'
															 or drug like '%mirtaxepin%'
														   THEN 'OTHERAD_Mirtazapin'
													       
														   WHEN  drug like '%reboxet%' 
															  or drug like '%reboxat%'
															  or drug like '%edronax%'
														   THEN 'SNRI_Reboxetin'
													       
														   WHEN  drug like '%venlafaxine%' 
															  or drug like '%effexor%'
															  or drug like '%efexor%'
														   THEN 'OTHERAD_Venlafaxine'
													       
														   WHEN drug like '%agomelatin%' 
															 or drug like '%valdoxan%' 
														   THEN 'OTHERAD_Agomelatin'
													       
														   WHEN  drug like '%duloxetin%'
															  or drug like '%duloxatin%' 
															  or drug like '%cymbalta%' 
															  or drug like '%yentreve%' 
														   THEN 'SNRI_Duloxetin'
													       
														  -- REMOVED THIS AS ROB AND RINA SUGGESTED AFTER SUPERVISION 15122015
														  -- WHEN drug like '%flupentixol%' 
															 --or drug like '%fluanxol%' 
															 --or drug like '%depixol%' 
														  -- THEN 'SNRI_Flupentixol'
														   
														   WHEN drug like '%tryptophan%' 
															 or drug like '%optimax%' 
														   THEN 'OTHERAD_Tryptophan'
														   
														   WHEN drug like '%bupropio%'
														   THEN 'OTHERAD_Bupropion'
														   
													end 
													) ORDER BY start_date asc, id desc, Table1.id) AS earliestmedstartdate,
													--most recent earliest AD medication mention within snapshot
													(
													CASE 
														   WHEN start_date between  '01-Mar-2015' and '31-Aug-2015'
														   THEN start_date
														   
														   WHEN start_date < '01-Mar-2015'
														   THEN '01-MAR-2015'
													End
													) MedicationStartDate
													

									from 
														 

														(
														select 
														drug
														,start_date
														,End_Date
														,brcid
														,CN_Doc_ID
														,id


														from SQLCrisImport.dbo.medication_combined
														where  
														(

																	(
																	drug like '%lithium%' 
																 or drug like '%camcolit%'  
																 or drug like '%liskonum%' 
																 or drug like '%priadel%' 
																 or drug like '%li-liquid%' 
																 --or drug like '%tca%'	  no hits  
																 or drug like '%tricyclic%' 
																 or drug like '%amitriptyline%' 
																 or drug like '%vanatrip%' --frOM drugs.COm
																 or drug like '%elavil%'   --frOM drugs.COm
																 or drug like '%endep%'    --frOM drugs.COm
																 or drug LIKE '%triptaf%'  --COnTAInS AMItRIpTyLINe AnD PErPHEnAZInE
																 or drug like '%clomipramin%' 
																 or drug like '%anafranil%' 
																 or drug like '%dosulepin%' 
																 or drug like '%dothiepin%' --PreViOuSLy KnoWN As DoTHIEPIN
																 or drug like '%prothiden%' 
																 or drug like '%prothiaden%' 
																 or drug like '%doxepin%' 
																 or drug like '%sinepin%' 
																 or drug like '%sineq%'  --FroM drug.SCOm
															   --  or drug like '%xepin%' --FRom DRUGS.CoM
																 or drug like '%imipramine%' 
																 or drug like '%tofranil%' -- FroM DrUGS.coM
																 or drug like '%lofepramine%' 
																 or drug like '%lomont%'
																 or drug like '%nortriptyli%' 
																 or drug like '%pamelo%'
																 or drug like '%allegr%' 
																 or drug like '%aventyl%'
																 or drug like '%trimipram%' 
																 or drug like '%surmonti%' 
																 or drug like '%mianserin%' 
																 or drug like '%trazodone%' 
																 or drug like '%molipaxin%' --start of MAOI
																 or drug like '%phenelzine%' 
																 or drug like '%phenylethylhydrazine%'
																 or drug like '%alazin%'
																 or drug like '%nardil%' 
																 or drug like '%isocarboxazid%' 
																 or drug like '%tranylcypromin%' 
																 or drug like '%parnate%'
																 or drug like '%moclobemide%' 
																 or drug like '%manerix%' 
																 or drug like 'citalopram%' 
																 or drug like '%cipramil%' 
																 or drug like '%celexa%' 
																 or drug like '%escitalopram%' 
																 or drug like '%cipralex%'
																 or drug like '%lexapro%'
																 or drug like '%fluoxetine%' 
																 or drug like '%prozac%' 
																 or drug like '%sarafem%'
																 or drug like '%bellzac%' --from drugs.com; used in Ireland
																 or drug like '%oxactin%' --from drugs.com; drug company: Discovery
																 or drug like '%fluvoxamine%' 
																 or drug like '%faverin%' 
																 or drug like'%paroxetin%' 
																 or drug like '%paxil%' --from drugs.com; not specified for UK use but used in US
																 or drug like '%seroxat%' 
																 or drug like '%sertra%' 
																 or drug like '%bellsert%' --from drugs.com; used in Ireland
																 or drug like '%lustral%' 
																 or drug like '%seretra%' --from drugs.com; used in Ireland   
																 or drug like '%zoloft%'  -- from drugs.come; not specified for UK but used in US
																 or drug like '%mirtazapin%' 
																 or drug like '%zispin%' 
																 or drug like '%mirza%'
																 or drug like '%mirtazep%'
																 or drug like '%reboxet%' 
																 or drug like '%reboxat%'
																 or drug like '%edronax%'
																 or drug like '%venlafaxine%' 
																 or drug like '%effexor%'
																 or drug like '%efexor%'
																 or drug like '%agomelatin%' 
																 or drug like '%valdoxan%' 
																 or drug like '%duloxetin%' 
																 or drug like '%duloxatin%' 
																 or drug like '%cymbalta%' 
																 or drug like '%yentreve%' 
																 --or drug like '%flupentixol%' 
																 --or drug like '%fluanxol%' 
																 --or drug like '%depixol%' 
																 or drug like '%tryptophan%' 
																 or drug like '%optimax%' 
																 or drug like '%bupropio%'
																 )
																 and 
															     
																 (
																  (SQLCrisImport.dbo.medication_combined.start_date between '01-Mar-2015' and '31-Aug-2015') or
																  (SQLCrisImport.dbo.medication_combined.End_Date between '01-Mar-2015' and '31-Aug-2015')
																 )

														)

														) Table1

				) Table2

				where Table2.earliestmedstartdate = '1'


) 

----------------------------------------------------------

--Select * 
--from SQLCrisImport.dbo.medication_combined






GO


