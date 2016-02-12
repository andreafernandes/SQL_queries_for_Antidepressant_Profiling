#final query

	select
		diagnosis_date,
		primary_diagnosis, -- this is closest diagnosis to 1st March 2014
		diagnosis_id,
		a, --brcid for patients with depression diagnosis
		PatientonAD,
		LithiumFlag,
		TCA_AmitriptylineFlag,
		TCA_CLOMIPRAMINEFlag,
		TCA_DOSULEPINFlag,
		TCA_DOXEPINFlag,
		TCA_IMIPRAMINEFlag,
		TCA_LOFEPRAMINEFlag,
		TCA_NORTRIPTYLINEFlag, 
		TCA_TRIMIPRAMINEFlag, 
		TCARELATED_MIANSERINFlag,
		TCARELATED_TRAZODONEFlag
		MAOI_ISOCARBOXAZIDFlag, 
		MAOI_PHENELZINEFlag, 
		MAOI_TRANYLCYPROMAINEFlag, 
		REVERSEMAOI_MOCLOBEMIDEFlag, 
		SSRI_CITALOPRAMFlag, 
		SSRI_ESCITALOPRAMFlag,
		SSRI_FLUOXETINEFlag,
		SSRI_FLUVOXAMINEFlag,
		SSRI_PAROXETINEFlag,
		SSRI_SERTRALINEFlag,
		SNRI_DOLUXETINEFlag,
		SNRI_REBOXETINEFlag,
		OTHERAD_AGOMELATINFlag,
		OTHERAD_BUPROPIONFlag,
		OTHERAD_MIRTAZAPINEFlag,
		OTHERAD_TRYPTOPHANFlag,
		OTHERAD_VENLAFAXINEFlag, -- this is an SNRI
		ethnicitycleaned,
		cleaneddateofbirth,
		Gender_ID,
		Marital_Status_ID,
		LatestNumberOfSpells, -- how many spells have they had so far (includes the spell they're at during snapshot)
		Accepted_Date, --referral accepted date
		--Honos Items
		Agitated_Behaviour_Score_ID,
		Self_Injury_Score_ID,
		Problem_Drinking_Drugs_Score_ID,
		Cognitive_Problems_Score_ID,
		Physical_Illness_Score_ID,
		Hallucinations_Score_ID,
		Depressed_Mood_Score_ID,
		Other_Mental_Problems_Score_ID,
		Other_Mental_Problems_Type_ID,
		Relationship_Problems_Score_ID,
		Daily_Living_Problems_Score_ID,
		Living_Conditions_Problems_Score_ID,
		Occupational_Problems_Score_ID,
		Adjusted_Total,
		PBR_Repeat_Self_Harm_ID,
		Rating_Date,
		noncompliant, --using the compliance application 
		compliant,
		-- were they receiving CBT during snapshot
		PTSessionDate,
		SessionNumber,
		--were they on antipsychotic during snapshot
		AntiPsychoticDate,
		AntiPsychoticFlag,
		--were they on lithium during snapshot
		CurrentLithium,
		CurrentLithiumdate,
		PastADdate,
		PastAD
	
		--COUNT(a), primary_diagnosis

	
	from 

	----------------------------------------------------------------------------------------------
--The two queries below were written to create a cohort of inidviduals wiht a diagnosis of depression and 
--who had clinical activity (in the form of face to face contact) during a randomly selected period of 
--1st of March, 2014 and 31st August 2014
--The tables generated from the two queries below are used to generate final cohort. 


--1st Query defining active referrals (i.e. f2f activity)
	
		select *
		INTO dbo.Afernandes_Active_Referrals_MAR14_AUG14
		from
			(SELECT Distinct (BRCID)
			FROM SQLCRIS.DBO.Event
			WHERE (EVENT.Start_Date BETWEEN '01-MAR-2014' and '31-AUG-2014') AND (eVENT.Event_Type_Of_Contact_ID LIKE '%face%')
			)TableMonkey


--2nd Query defining individuals with a depression diagnosis and not any other diagnoses before start of observation period
	--select 
	--ROW_NUMBER() OVER (PARTITION BY SQLCrisImport.dbo.Diagnosis_combined.BRCID ORDER BY DIAGNOSIS_DATE desc, diagnosis_id DESC,
	--SQLCrisImport.dbo.Diagnosis_combined.diagnosis_id) AS LatestDate, --for latest depression diagnosis; closest to 1ST MARCH 2014
	--diagnosis_date,primary_diagnosis,diagnosis_id,brcid as a 
	--FROM 
	--SQLCrisImport.dbo.Diagnosis_combined 
	--WHERE
-- these diagnoses were chosen as they were mentioned in the updated NICE guidelines
	--with distinct_six_month_depressiondiagnosis_AF as 
	--(	(
	--	--F32: Depressive episode (include with and without psychotic symptoms)
	--	primary_diagnosis like '%F32%'
	--	and 
	--	diagnosis_date <='01-MAR-2014'
	--	
	--	)
	--	OR
	--	(
	--	primary_diagnosis like '%depressi%'
	--	and 
	--	diagnosis_date <='01-MAR-2014'
	--	)
	--	OR
	--	(
	--	--recurrent depressive disorder
	--	primary_diagnosis like '%F33%'
	--	and 
	--	diagnosis_date <='01-MAR-2014'
	--	)
	--	OR
	--	(
	--	--Dysthymia; from F34 (Persistent mood disorders family; excluded F34.0 Cyclothymia and F34.8 Other persistent mood, F34.9 Persistent 	      --mood disorder)
	--	primary_diagnosis like '%F34.1%'
	--	and 
	--	diagnosis_date <='01-MAR-2014'
	--	) 
	--	OR
	--	(
	--	primary_diagnosis like '%dysthymi%'
	--	and 
	--	diagnosis_date <='01-MAR-2014'
	--	) 
	--	OR
	--	(
	--	-- mixed anxiety and depression; from F41 Other anxiety disorder family; exclued Panic disorder F41.0, GAD F41.1, F41.3 Other mixed an	      --xiety disorders
	--	primary_diagnosis like '%F41.2%'
	--	and 
	--	diagnosis_date <='01-MAR-2014'
	--	)
	--	OR
	--	--http://www.gpcare.org/guidelines/mixedanxdepd.htm
	--	(
	--	primary_diagnosis like '%mixed anxiety and depressi%'
	--	and 
	--	diagnosis_date <='01-MAR-2014'
	--	)
	--)
	--  select *
	--  from distinct_six_month_depressiondiagnosis_AF
	--  WHERE 
	--		(
		--	Latestdate = '1'
--	)
--	and 
--	(
--	a NOT in -- this line asks for the ids identified as having a depression diagnosis not to have the following disorders before the 
--		 --the snapshot. 
--	(select BrcId from SQLCrisImport.dbo.Diagnosis_combined
--	where 
--	(SQLCrisImport.dbo.Diagnosis_combined.primary_diagnosis like '%F0%'and 
--	 SQLCrisImport.dbo.Diagnosis_combined.diagnosis_date <='31-AUG-2014'
--	)
--	OR
--	(SQLCrisImport.dbo.Diagnosis_combined.primary_diagnosis like '%dementia%'and 
--	 SQLCrisImport.dbo.Diagnosis_combined.diagnosis_date <='31-AUG-2014'
--	)
---	OR 
--	(SQLCrisImport.dbo.Diagnosis_combined.primary_diagnosis like '%alzheim%'and 
--	 SQLCrisImport.dbo.Diagnosis_combined.diagnosis_date <='31-AUG-2014'
--	)
--	OR
--	(SQLCrisImport.dbo.Diagnosis_combined.primary_diagnosis like '%delirium%'and 
--	 SQLCrisImport.dbo.Diagnosis_combined.diagnosis_date <='31-AUG-2014'
--	)
--	OR  
--	(SQLCrisImport.dbo.Diagnosis_combined.primary_diagnosis like '%organi%'and 
--	 SQLCrisImport.dbo.Diagnosis_combined.diagnosis_date <='31-AUG-2014'
--	)
--	OR 
--	(SQLCrisImport.dbo.Diagnosis_combined.primary_diagnosis like '%schizo%'and 
--	 SQLCrisImport.dbo.Diagnosis_combined.diagnosis_date <='31-AUG-2014'
--	)
--	OR 
--	(SQLCrisImport.dbo.Diagnosis_combined.primary_diagnosis like 'F2%' and 
--	 SQLCrisImport.dbo.Diagnosis_combined.diagnosis_date <='31-AUG-2014'
--	)
--	OR 
--	(SQLCrisImport.dbo.Diagnosis_combined.primary_diagnosis like 'F31%' and 
--	 SQLCrisImport.dbo.Diagnosis_combined.diagnosis_date <='31-AUG-2014'
--	)
--	OR 
--	(SQLCrisImport.dbo.Diagnosis_combined.primary_diagnosis like '%bipolar%' and 
--	 SQLCrisImport.dbo.Diagnosis_combined.diagnosis_date <='31-AUG-2014'
--	 )
--	 )
--	 )

----------------------------------------------------------------------------------------------------------
--start of query to put query together


		(select * from dbo.Afernandes_Active_Referrals_MAR14_AUG14
		  inner join 
		  dbo.AFernandes_DepDiag_bef_MAR2014
		  on dbo.AFernandes_DepDiag_bef_MAR2014.a = dbo.Afernandes_Active_Referrals_MAR14_AUG14.brcid
		)Table1 
--this is final snapshot cohort with depression and active during snapshot
--i can now join my various variables to this cohort. 

-----------------------------------------------------------------------------------------------

----this joins ADs and Demographics to our table. 
		left join 
		SQLCRIS_User.dbo.Afernandes_Antidepressant_MAR14_AUG14
--the queries for "Afernandes_Antidepressant_MAR14_AUG14" are stored in SQLCRIS_User:
----dbo.AFernandes_Antidepressants_MultiRowPerPatient_Snapshot_Nov2015
----dbo.AFernandes_Antidepressant_Distinct_Snapshot_Nov2015
----dbo.AFernandes_Antidepressant_Distinct_OneColumnPerAD_Nov2015
		on Table1.a = SQLCRIS_User.dbo.Afernandes_Antidepressant_MAR14_AUG14_with_dates.PatientonAD

-----------------------------------------------------------------------------------

		left join
		SQLCRIS.DBO.EPR_Form
		ON Table1.a = EPR_Form.BrcId 

---------------------------------------------------------------------------------

--joining number of spell data
		left join
		(
			select * 
			from 
			     (
			select Spell_Number as LatestNumberOfSpells
			, Accepted_Date
			, BrcId
			, RANK() over (partition by brcid order by Spell_number desc) as RankSpell
			from SQLCRIS.DBO.Referral
			     )RankRef
			
			where RankSpell = '1'
		) RankedReferrallSpell

		on Table1.a = RankedReferrallSpell.BrcId

-------------------------------------------------------------------------------
--joining honos items

		left join

		(
			select 
				Agitated_Behaviour_Score_ID,
				Self_Injury_Score_ID,
				Problem_Drinking_Drugs_Score_ID,
				Cognitive_Problems_Score_ID,
				Physical_Illness_Score_ID,
				Hallucinations_Score_ID,
				Depressed_Mood_Score_ID,
				Other_Mental_Problems_Score_ID,
				Other_Mental_Problems_Type_ID,
				Relationship_Problems_Score_ID,
				Daily_Living_Problems_Score_ID,		
				Living_Conditions_Problems_Score_ID,		
				Occupational_Problems_Score_ID,		
				Adjusted_Total,		
				PBR_Repeat_Self_Harm_ID,		
				Rating_Date,		
				BrcId,		
				CN_Doc_ID
			from 
				(
				select *
				from 
					(
					select 
					(ABS(DATEDIFF(DD,'01-Mar-2014',Rating_Date)))DaysSinceRecentHonos
					,RANK () OVER (PARTITION BY BRCID ORDER BY (ABS(DATEDIFF(DD,'01-Mar-2014',Rating_Date)) ) ASC, cn_doc_id ) as RankedHonos
					,*
					from SQLCRIS.DBO.HoNOS
					)HonosClosesttoStartofSnapshot
				where RankedHONOS ='1'
				) TableHonos
		)Honos
	

		on Table1.a = Honos.brcid

-------------------------------------------------------------------------------------------------------------------
--this will join a table that counts the number of time "non-compliance" was mentioned during snapshot period
	left join

	(		
	select  brcid
		, count (match) as noncompliant 
		
	from	
		(select * 
		 from 
				(select   BrcId
					, CONVERT(datetime,[SQLCrisImport].[dbo].[tbl_gate_hunter_compliance].document_date,103) as AdherenceMentionDocDate
					, match

				 from 
				  	[SQLCrisImport].[dbo].[tbl_gate_hunter_compliance]
					
				) Table1
				
		 where Table1.AdherenceMentionDocDate between '01-Mar-2014' and '31-Aug-2014'
		 ) Table2
		
	where match like '%non%' --to get non-compliance annotations
	group by BrcId
	)	 
	as ComplianceIndicator
	on Table1.a = ComplianceIndicator.brcid

----------------------------------------------------------------------------------------------------------
--this will join a table that counts the number of times "compliance" was mentioned during snapshot period

left join

(

	select  brcid
	        , count (match) as compliant 

	from
		(select * 
		 from 
				(select BrcId
				        , CONVERT(datetime,[SQLCrisImport].[dbo].[tbl_gate_hunter_compliance].document_date,103) as AdherenceMentionDocDate
				        , match	
				 from [SQLCrisImport].[dbo].[tbl_gate_hunter_compliance]
				 
				) Table1
				
		 where Table1.AdherenceMentionDocDate between '01-Mar-2014' and '31-Aug-2014'
		 
		 ) Table2
		
	where match like 'complian%'
	group by BrcId
	
) 
as ComplianceIndicatorII
on Table1.a = ComplianceIndicatorII.brcid 

-------------------------------------------------------------------------------------------------------
--this table joins CBT session during the snapshot 

left join

(
	select * 
	
	from 
	
		(SELECT PsychoTherapySess.brcid
		      , PsychoTherapySess.PTSessionDate
		      , PsychoTherapySess.SessionNumber
		      , Rank () over (Partition by brcid order by PsychoTherapySess.cn_doc_id DESC ) as ranking
		      
		 FROM
		 	(select * 
			 from 
			
					(
					 select distinct brcid
					 	, CONVERT(datetime,SQLCRISIMPORT.dbo.vw_cbt_combined.Session_Date,103) as PTMentionDate
						, SQLCRISIMPORT.dbo.vw_cbt_combined.Session_Date as PTSessionDate
						, SQLCrisImport.dbo.vw_cbt_combined.Session_n as SessionNumber
						, SQLCRISImport.dbo.vw_cbt_combined.CN_DOC_ID
						--, SQLCRISImport.dbo.vw_cbt_combined.id										
						
					  from   SQLCRISIMPORT.dbo.vw_cbt_combined
					  
				        ) as PsychoTherapySession
					
		  	where (PsychoTherapySession.PTMentionDate between '01-Mar-2014' and '31-Aug-2014')
			) PsychoTherapySess
			
			
		) as PsychoTherapyIndicator

		
	where PsychoTherapyIndicator.ranking = '1'
	
	  and (PsychoTherapyIndicator.PTSessionDate between '01-Mar-2014' and '31-Aug-2014')
)	as PTIndicator
on Table1.a = PTIndicator.brcid 


---------------------------------------------------------------------------------------------------------------------------
--this table joins any antipsychotic data during snapshot period
left join
(

	select * 
	from 
		(select distinct brcid
		       , [SQLCRIS_User].[dbo].[andreamedicationtable].drug  as AntiPsychoticFlag
		       , [SQLCRIS_User].[dbo].[andreamedicationtable].start_date as AntiPsychoticDate
		       , Rank () over (Partition by brcid order by [SQLCRIS_User].[dbo].[andreamedicationtable].id DESC ) as ranking
		       
		 FROM [SQLCRIS_User].[dbo].[andreamedicationtable]
		 where 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%chlorpromazin%')) 
or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%largactil%')) 
or  
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%levomepromazin%')) 
or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%methotrimeprazin%')or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%nozinan%')) 
or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%promazin%')) 
or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%pericyazin%')) or 

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%periciazin%')) or
		
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%neulactil%')) or

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%pipotiazin%')) or 

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%fluphenazin%')) or 

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%perphenazin%')) or
	
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%fentazin%')) or

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%prochlorperazin%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%trifluoperazin%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%stelazin%')) or 

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%benperidol%')) or 

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%haloperidol%')) or

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%dozic%')) or 

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%haldol%')) or 

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%serenace%')) or 

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%pimozid%')) or 

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%orap%')) or 

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%flupentixol%')) or 

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%fluphenazin%')) or 

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%modecat%')) or 

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%depixol%')) or 

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%zuclopenthixol%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%clopixol%')) or 

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%sulpirid%')) or 

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%dolmatil%')) or 

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%sulpor%')) or 

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%amisulpride%')) or 

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%solian%')) or

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%clozapin%')) or 

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%clozaril%')) or

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%denzapine%')) or 

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%zaponex%')) or 

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%olanzapin%')) or 

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%zyprexa%')) or 

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%quetiapin%')) or 

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%seroquel%')) or 

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%risperid%')) or 

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%sertindol%')) or

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%serdolect%')) or  

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%zotepin%')) or 

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%zoleptil%')) or 

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%aripiprazol%')) or 

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%abilify%')) or 

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%paliperidone%')) or 

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%invega%')) or 

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%pipotiazin%')) or

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%pipothiazin%')) or 

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%piportil%')) or 

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%zuclopenthixol%')) or 

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-Mar-2014' and '30-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%clopixol%'))

) as AntiPsychoticIndication
														

where AntiPsychoticIndication.ranking = '1'
)as AntiPsychoticSnapshot

on Table1.a = AntiPsychoticSnapshot.BrcId 


---------------------------------------------------------------------------------------------------------------
--this table joins if patients are on Lithium treatment during snapshot
left join

(
select * 
from 
	(select distinct brcid
	, [SQLCRIS_User].[dbo].[andreamedicationtable].drug  as CurrentLithium
	, [SQLCRIS_User].[dbo].[andreamedicationtable].start_date as CurrentLithiumdate
 	, Rank () over (Partition by brcid order by [SQLCRIS_User].[dbo].[andreamedicationtable].id DESC) as ranking
	FROM [SQLCRIS_User].[dbo].[andreamedicationtable]
	where 
	
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date BETWEEN '01-Mar-2014' and '31-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%lithium%')) or 

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date BETWEEN '01-Mar-2014' and '31-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%camcolit%')) or 

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date BETWEEN '01-Mar-2014' and '31-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%liskonum%')) or 

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date BETWEEN '01-Mar-2014' and '31-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%li-liquid%')) or 

(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date BETWEEN '01-Mar-2014' and '31-Aug-2014') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%priadel%')) 

) as PastLithiumIndication ---should be renamed to CurrentLihiumIndication
									
where PastLithiumIndication.ranking = '1'

) as PastLithium

on Table1.a = PastLithium.BrcId 

------------------------------------------------------------------------------------------------------

	left join
	
		(
		select * 
		from 
			(select distinct brcid
				, [SQLCRIS_User].[dbo].[andreamedicationtable].drug  as PastAD
				, [SQLCRIS_User].[dbo].[andreamedicationtable].start_date as PastADdate
				, Rank () over (Partition by brcid order by [SQLCRIS_User].[dbo].[andreamedicationtable].id DESC) as ranking
			
			 FROM [SQLCRIS_User].[dbo].[andreamedicationtable]
			 where 
			 
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  AND drug like '%tca%') or 
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%tricyclic%') or 
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%amitriptyline%') or 
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%vanatrip%') or 
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%elavil%') or 
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%endep%') or  --frOM drugs.COm 
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and DRuG LIKE '%triptaf%')  or --COnTAInS AMItRIpTyLINe AnD PErPHEnAZInE
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%clomipramin%') or
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%anafranil%') or
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%dosulepin%') or 
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%dothiepin%') or --PreViOuSLy KnoWN As DoTHIEPIN 
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%prothiden%') or
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and	drug like '%prothiaden%') or
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%doxepin%') or
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%sinepin%') or
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%sineq%')  or --FroM drug.SCOm 
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and	drug like '%xepin%') or --FRom DRUGS.CoM
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%imipramine%') or  
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%tofranil%') or -- FroM DrUGS.coM
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%lofepramine%') or 
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and	drug like '%lomont%') or -- FroM DrUGS.coM
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%nortriptyli%') or
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%pamelo%') or
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%allegr%') or
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%aventyl%') or
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%trimipram%') or
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%surmonti%') or
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%mianserin%') or
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%trazodone%') or
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%molipaxin%') or
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and	drug like '%phenelzine%') or
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%phenylethylhydrazine%') or
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%alazin%') or
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%nardil%')  or
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%isocarboxazid%')  or
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%tranylcypromin%') or
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%moclobemide%') or
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%manerix%') or
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and Drug like 'citalopram%') or
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%cipramil%') or
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%celexa%') or
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%escitalopram%') or
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%cipralex%') or
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%lexapro%') or
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%fluoxetine%') or
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%prozac%') or
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%sarafem%') or
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%bellzac%') or --from drugs.com; used in Ireland
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%oxactin%') or --from drugs.com; drug company: Discovery
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%fluvoxamine%') or 
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%faverin%') or 
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like'%paroxetin%' ) or
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%paxil%') or  --from drugs.com; not specified for UK use but used in US
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%seroxat%' ) or
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%sertra%' ) or 
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%bellsert%') or  --from drugs.com; used in Ireland
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%lustral%' ) or
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%seretra%' ) or --from drugs.com; used in Ireland   
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%zoloft%') or   -- from drugs.come; not specified for UK but used in US
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%mirtazapin%') or
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%zispin%' ) or 
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%mirza%') or 
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%reboxet%' ) or 
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%reboxat%') or 
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%edronax%') or 
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%venlafaxine%' ) or 
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%effexor%') or 
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%efexor%') or 
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%agomelatin%' ) or 
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%valdoxan%' ) or 
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%duloxetin%' ) or 
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%cymbalta%' ) or 
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%yentreve%' ) or 
	--([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%flupentixol%' ) or
	--([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%fluanxol%' ) or
	--([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%depixol%' ) or
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%tryptophan%' ) or
	([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2014'  and drug like '%optimax%' ) 
	) as PastADIndication

	where PastADIndication.ranking = '1') as PastAD

	on Table1.a = PastAD.BrcId

-----------------------------------------------------------------------------------------------

