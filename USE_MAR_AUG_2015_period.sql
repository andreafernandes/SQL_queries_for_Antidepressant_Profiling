select * into SQLCRIS_USER.DBO.AFERNANDES_Antidepressant_Profile_cohort_July2016_corrected_6month_V2
from 

(

select *,
	   --LSOA,
	   imd_score as FinalImd_score
from 	

(
select 
	diagnosis_date,
	primary_diagnosis,
	diagnosis_id,
	a,
	PatientonAD,
	LithiumFlag, -- from the medication table I generate
	TCA_AmitriptylineFlag,
	AmitStartDate,
	TCA_CLOMIPRAMINEFlag,
	ClomipStartDate,
	TCA_DOSULEPINFlag,
	DosulepStartDate,
	TCA_DOXEPINFlag,
	DoxepStartDate,
	TCA_IMIPRAMINEFlag,
	ImipStartDate,
	TCA_LOFEPRAMINEFlag,
	LofepraStartDate,
	TCA_NORTRIPTYLINEFlag, 
	NortripStartDate,
	TCA_TRIMIPRAMINEFlag, 
	TrimipStartDate,
	TCARELATED_MIANSERINFlag,
	MianStartDate,
	TCARELATED_TRAZODONEFlag
	TrazoStartDate,
	MAOI_ISOCARBOXAZIDFlag, 
	IsocarbStartDate,
	MAOI_PHENELZINEFlag, 
	PhenelStartDate,
	MAOI_TRANYLCYPROMAINEFlag, 
	TranylStartDate,
	REVERSEMAOI_MOCLOBEMIDEFlag, 
	MocloStartDate,
	SSRI_CITALOPRAMFlag, 
	CitalStartDate,
	SSRI_ESCITALOPRAMFlag,
	EscitStartDate,
	SSRI_FLUOXETINEFlag,
	FluoxStartDate,
	SSRI_FLUVOXAMINEFlag,
	FluvoxStartDate,
	SSRI_PAROXETINEFlag,
	paroxstartdate,
	SSRI_SERTRALINEFlag,
	SertStartDate,
	SNRI_DOLUXETINEFlag,
	DoluxeStartDate,
	SNRI_REBOXETINEFlag,
	ReboxStartDate,
	OTHERAD_AGOMELATINFlag,
	AgoStartDate,
	OTHERAD_BUPROPIONFlag,
	BuproStartDate
	OTHERAD_MIRTAZAPINEFlag,
	MirtStartDate,
	OTHERAD_TRYPTOPHANFlag,
	TrypStartDate,
	OTHERAD_VENLAFAXINEFlag,
	VenlaStartDate,
   ethnicitycleaned
   ,cleaneddateofbirth
   ,Gender_ID
   ,SpellTable.Spell_Number
   ,Marital_Status_ID
   --,LatestNumberOfSpells
   ,Accepted_Date
   ,Discharge_Date
   ,Accepted_Date2
   ,Discharge_Date2
   ,Agitated_Behaviour_Score_ID,
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
	NonComplianceIndicator.noncompliancebrcid,
	NonComplianceIndicator.noncompliant,
	CurrentPTIndicator.PTBrcid,
	CurrentPTIndicator.SessionNumber,
	CurrentPTIndicator.Session_date as PTduringObservationPeriod,
	PastPTIndicator.PTBrcidPast,
	PastPTIndicator.SessionNumberforPastPT,
	PastPTIndicator.Session_date as PTbeforeObservationPeriod,
	AntiPsychoticDate,
	AntiPsychoticFlag,
	AntiPsychoticFlagPast,
	CurrentLithium.LithiumBrcId
	,CurrentLithium.CurrentLithiumdate
	,PastLithium.LithiumBrcIdPast
	,PastADdate
	,PastAD
	,TableInpatient.InpatientBrcid as BeenInpatientin12months,
	FDiagnosisClosestFcodeToSnapshotForMostRecentSeverity.Diag,
	--Table2.LSOA,
	Table2.Address_Start,
	Table2.AddressFormLSOA
	,HallucinationsRecent.b as RecentHallucinations
	,HallucinationsCurrentCount.hallucinationcountcurrent
	,HallucinationsPast.c as SixmonthsPastHallucinations
	,HallucinationsPastCount.hallucinationcountpast
	,PoorMotivationPast.e as PoorMotivationPast
	,PoorMotivationPastCount.poormotivationcountpast
	,PoorMotivationRecent.d as PoorMotivationRecent
	,PoorMotivationCurrentCount.poormotivationcountcurrent
	,FlatAffectPast.g as PoorAffectPast
	,FlatAffectCurrentCount.flataffectcountcurrent
	,FlatAffectRecent.f as PoorAffectRecent
	,FlatAffectPastCount.flataffectcountpast
	,AnhedoniaPast.i as AnhedoniaPast
	,AnhedoniaPastCount.anhedoniacountpast
	,AnhedoniaRecent.h as AnhedoniaRecent
	,AnhedoniaCurrentCount.anhedoniacountcurrent
	,HopelessPast.k as HopelessnessPast
	,HopelessPastCount.hopelesscountpast
	,HopelessRecent.j as HopelessnessRecent
	,HopelessCurrentCount.hopelesscountcurrent
	,WorthlessPast.m as WorthlessnessPast
	,WorthlessPastCount.worthlesscountpast
	,WorthlessRecent.l as WorthlessnessRecent
	,WorthlessCurrentCount.worthlesscountcurrent
	,SuicideAPast.o as SuicideAttemptPast
	,SuicideAPastCount.suicideattemptcountpast
	,SuicideARecent.n as SuicideAttemptRecent
	,SuicideACurrentCount.suicideattemptcountcurrent
	,AnergiaPast.q as AnergiaPast
	,AnergiaPastCount.anergiacountpast
	,AnergiaRecent.p as AnergiaRecent
	,AnergiaCurrentCount.anergiacountcurrent
	,ApathyPast.s as ApathyPast
	,ApathyPastCount.apathycountpast
	,ApathyRecent.r as ApathyRecent
	,ApathyCurrentCount.apathycountcurrent
	,InsomniaPast.u as InsomniaPast
	,InsomniaPastCount.insomniacountpast
	,InsomniaRecent.t as InsomniaRecent
	,InsomniaCurrentCount.insomniacountcurrent
	,AgressionPast.w as AggressionPast
	,AggressionPastCount.aggressioncountpast
	,AgressionRecent.v as AggressionRecent
	,AggressionCurrentCount.aggressioncountcurrent
	,AgitationPast.y as AgitationPast
	,AgitationPastCount.agitationcountpast
	,AgitationRecent.x as AgitationRecent
	,AgitationCurrentCount.agitationcountcurrent
	,EnergyPast.a1 as EnergyPast
	,EnergyPastCount.energycountpast
	,EnergyRecent.z as EnergyRecent
	,EnergyCurrentCount.energycountcurrent
	,DelusionPast.d1 as DelusionPast
	,DelusionPastCount.delusioncountpast
	,DelusionRecent.b1 as DelusionRecent
	,DelusionCurrentCount.delusioncountcurrent
	,AppetitePast.f1 as AppetitePast
	,AppetitePastCount.appetitecountpast
	,AppetiteRecent.e1 as AppetiteRecent
	,AppetiteCurrentCount.appetitecountcurrent
	,SocWitPast.h1 as SocWitPast
	,SocialWithdrawalPastCount.socwitcountpast
	,SocWitRecent.g1 as SocWitRecent
	,SocWitCurrentCount.socwithcountcurrent
	,concentrationPast.j1 as ConcentrationPast
	,concentrationPastCount.concentrationcountpast
	,concentrationRecent.i1 as concentrationRecent
	,concentrationCurrentCount.concentrationhcountcurrent
	,IrritablePast.l1 as IrritablePast
	,IrritablePastCount.irritabilitycountpast
	,IrritableRecent.k1 as IrritableRecent
	,IrritableCurrentCount.irritablehcountcurrent
	,helplessPast.r1 as HelplessPast
	,helplessPastCount.helplesscountpast
	,helplessRecent.q1 as HelplessCurrent
	,helplessCurrentCount.helplesshcountcurrent
	,LowMoodPast.r1 as LowMoodPast
	,LowMoodPastCount.LowMoodcountpast
	,LowMoodRecent.q1 as LowMoodRecent
	,LowMoodCurrentCount.LowMoodhcountcurrent
	,BenzoPastSnapshot.BenzoPastBrcid
	,BenzoSnapshot.BenzoBrcid

	
   --COUNT(a), primary_diagnosis

from 

--(
----------------------------------------------------------------------------------------------
--This table defines individuals with f2f activity within obs period, 
--AND depress* diag before start of obs period & 


(
select * from SQLCris_User.dbo.Afernandes_Active_Referrals_MAR15_AUG15

inner join 

SQLCRIS_User.dbo.AFernandes_DepDiag_bef_MAR15_AUG15
on SQLCRIS_User.dbo.AFernandes_DepDiag_bef_MAR15_AUG15.a = SQLCris_User.dbo.Afernandes_Active_Referrals_MAR15_AUG15.brcid
) 
Table1   
-----------------------------------------------------------------------------------------------
----this joins ADs and Demographics to our table. 

left join 

SQLCRIS_User.dbo.Afernandes_Antidepressant_MAR15_AUG15_with_dates

on Table1.a = SQLCRIS_User.dbo.Afernandes_Antidepressant_MAR15_AUG15_with_dates.PatientonAD
-------------------------------------------------------------------------------------------------
--joining LSOA code and address start date closest to 1st of maruary 2015
left join

(
select *
from 
			(
			select BrcId as AddressBrcid
				 , Address_Start
				 , LSOA as AddressFormLSOA
				 ,
					ROW_NUMBER() OVER 
					(PARTITION BY  BRCID 
						ORDER BY   ABS(DATEDIFF(DD,Address_Start,'01-MAR-2015')) asc
					) 
					AS ClosestAddressToSnapshot
			from SQLCRIS.DBO.Address_Cleaned
			)Table1
where ClosestAddressToSnapshot = '1'
) Table2

on Table1.a = Table2.AddressBrcid

------------------------------------------------------------------------------------------------
--joining inpatient status in the past year
left Join

(
select  
		distinct (brcid) as InpatientBrcid
	 --	  Admission_Date,
	 --   Referral_Date,
	 --   Planned_Start_Date    
from 
		SQLCRIS.dbo.Inpatient_episode
where
		Admission_Date between '01-MAR-2014' and '30-APR-2015'
) TableInpatient

on Table1.a = TableInpatient.InpatientBrcid
-----------------------------------------------------------------------------------
--joining closest F code for dep to assign severity
left join
(
select  brcid as FcodeBrcid,
		Diag,
		ClosestFcodeToSnapshotForMostRecentSeverity
		
from 

(
select  
		BrcId,
		Diag,
		Diagnosis_Date,
		ROW_NUMBER() OVER 
		(PARTITION BY  BRCID 
			ORDER BY   ABS(DATEDIFF(DD,Diagnosis_Date,'01-MAR-2015')) asc
		) 
		AS ClosestFcodeToSnapshotForMostRecentSeverity
		
from SQLCRIS.dbo.Diagnosis_Cleaned
		
where
		Diagnosis_Date < '31-AUG-2015' and
		(Diag like '%F34.1%' OR
		 Diag like '%F32%' OR
		 Diag like '%F33%' OR
		 Diag like '%F41.2%'
		 )
		
)Table1

where 

ClosestFcodeToSnapshotForMostRecentSeverity = 1
)FDiagnosisClosestFcodeToSnapshotForMostRecentSeverity

on Table1.a = FDiagnosisClosestFcodeToSnapshotForMostRecentSeverity.FcodeBrcid
--------------------------------------------------------------------------------------------------
left join

SQLCRIS.DBO.EPR_Form

ON Table1.a = EPR_Form.BrcId 
-------------------------------------------------------------------------------------------------
--current hallucination data

left join
(
select  distinct(b)
from 
(
SELECT [GateDB_Cris].[dbo].[gate_hunter_hallucination_306].BrcId as b, 
	   [GateDB_Cris].[dbo].[gate_hunter_hallucination_306].CN_Doc_ID as documentID,
	   match,
	   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate,
	   mlObservation1
  FROM [GateDB_Cris].[dbo].[gate_hunter_hallucination_306]
left join
[GateDB_Cris].[dbo].[gate]
 on [GateDB_Cris].[dbo].[gate_hunter_hallucination_306].CN_Doc_ID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
 )Table1 
 where calendardate between '01-MAR-2015' and '31-AUG-2015' --and mlObservation1 = 'positive'
 )HallucinationsRecent
 on 
 Table1.a = HallucinationsRecent.b
 ----------------------------------------------------------------------
 --Past 12 months hallucinations
left join
(
select    distinct(c)
from 
(
SELECT [GateDB_Cris].[dbo].[gate_hunter_hallucination_306].BrcId as c, 
	   [GateDB_Cris].[dbo].[gate_hunter_hallucination_306].CN_Doc_ID as documentID,
	  match,
	   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate,
	   mlObservation1
  FROM [GateDB_Cris].[dbo].[gate_hunter_hallucination_306]
left join
[GateDB_Cris].[dbo].[gate]
 on [GateDB_Cris].[dbo].[gate_hunter_hallucination_306].CN_Doc_ID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
 )Table1 
 where calendardate between '01-MAR-2014' and '01-MAR-2015' --and mlObservation1 = 'positive'
 )HallucinationsPast
 on 
 Table1.a = HallucinationsPast.c
 
 
 -----------------------------------------------------------------------------------------------
  --Count of Recent Hallucination
left join
(
select c1,
	   COUNT(match) as hallucinationcountcurrent
from 
			(
			select *
			from 
			(
									select Table1.BrcId as c1,
										   match,
										   documentID,
										   Table1.src_col,
										   Table1.src_table,
										   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate
										    
									from 
															(
															select BrcId,
															keyObservation1, 
															match, 
															cn_doc_id as documentID, 
															src_table,
															src_col 
															from [GateDB_Cris].[dbo].[gate_hunter_hallucination_306]
															--WHERE mlObservation1 = 'positive'
															)Table1											
									inner join
											  [GateDB_Cris].[dbo].[gate] 
									on 
											  Table1.documentID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
			)Table2					 
			where calendardate between '01-MAR-2015' and '31-AUG-2015'
)Table3
group by c1 
)HallucinationsCurrentCount
 
 on 
 
 Table1.a = HallucinationsCurrentCount.c1
		
-------------------------------------------------------------------------------------------------
  --Count of Past Hallucination
left join
(
select c1,
	   COUNT(match) as hallucinationcountpast
from 
			(
			select *
			from 
			(
									select Table1.BrcId as c1,
										   match,
										   documentID,
										   Table1.src_col,
										   Table1.src_table,
										   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate   
									from 
															(
															select BrcId,
															keyObservation1, 
															match, 
															cn_doc_id as documentID, 
															src_table,
															src_col 
															from [GateDB_Cris].[dbo].[gate_hunter_hallucination_306]
															--WHERE mlObservation1 = 'positive'
															)Table1											
									inner join
											  [GateDB_Cris].[dbo].[gate] 
									on 
											  Table1.documentID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
			)Table2					 
			where calendardate between '01-MAR-2014' and '01-MAR-2015'
)Table3
group by c1
)HallucinationsPastCount
 on 
 Table1.a = HallucinationsPastCount.c1
		
-------------------------------------------------------------------------------------------------
--current Poor Motivation data

left join
(
select  distinct(d)
from 
(
SELECT [GateDB_Cris].[dbo].[gate_hunter_poor_mot_306].BrcId as d, 
	   [GateDB_Cris].[dbo].[gate_hunter_poor_mot_306].CN_Doc_ID as documentID,
	   match,
	   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate,
	   mlObservation1
  FROM [GateDB_Cris].[dbo].[gate_hunter_poor_mot_306]
left join
[GateDB_Cris].[dbo].[gate]
 on [GateDB_Cris].[dbo].[gate_hunter_poor_mot_306].CN_Doc_ID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
 )Table1 
 where calendardate between '01-MAR-2015' and '31-AUG-2015' and mlObservation1 = 'positive'
 )PoorMotivationRecent
 on 
 Table1.a = PoorMotivationRecent.d
 ----------------------------------------------------------------------
 --Past 12 months poor motivation
left join
(
select    distinct(e)
from 
(
SELECT [GateDB_Cris].[dbo].[gate_hunter_poor_mot_306].BrcId as e, 
	   [GateDB_Cris].[dbo].[gate_hunter_poor_mot_306].CN_Doc_ID as documentID,
	  match,
	   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate,
	   mlObservation1
  FROM [GateDB_Cris].[dbo].[gate_hunter_poor_mot_306]
left join
[GateDB_Cris].[dbo].[gate]
 on [GateDB_Cris].[dbo].[gate_hunter_poor_mot_306].CN_Doc_ID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
 )Table1 
 where calendardate between '01-MAR-2014' and '01-MAR-2015' and mlObservation1 = 'positive'
 )PoorMotivationPast
 on 
 Table1.a = PoorMotivationPast.e
 -----------------------------------------------------------------------------------------------
  --Count of Recent Motivation
left join
(
select c1,
	   COUNT(match) as poormotivationcountcurrent   
from 
			(
			select *
			from 
			(
									select Table1.BrcId as c1,
										   match,
										   documentID,
										   Table1.src_col,
										   Table1.src_table,
										   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate
										    
									from 
															(
															select BrcId,
															keyObservation1, 
															match, 
															cn_doc_id as documentID, 
															src_table,
															src_col, 
															mlObservation1
															from [GateDB_Cris].[dbo].[gate_hunter_poor_mot_306]
															where mlObservation1 = 'positive'
															)Table1											
									inner join
											  [GateDB_Cris].[dbo].[gate] 
									on 
											  Table1.documentID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
			)Table2					 
			where calendardate between '01-MAR-2015' and '31-AUG-2015'
)Table3
group by c1
)PoorMotivationCurrentCount
 on 
 Table1.a = PoorMotivationCurrentCount.c1
-------------------------------------------------------------------------------------------------
  --Count of Past Poor Motivation
left join
(
select c1,
	   COUNT(match) as poormotivationcountpast  
from 
			(
			select *
			from 
			(
									select Table1.BrcId as c1,
										   match,
										   documentID,
										   Table1.src_col,
										   Table1.src_table,
										   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate
										    
									from 
															(
															select BrcId,
															keyObservation1, 
															match, 
															cn_doc_id as documentID, 
															src_table,
															src_col 
															from [GateDB_Cris].[dbo].[gate_hunter_poor_mot_306]
															where mlObservation1 = 'positive'
															)Table1											
									inner join
											  [GateDB_Cris].[dbo].[gate] 
									on 
											  Table1.documentID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
			)Table2					 
			where calendardate between '01-MAR-2014' and '01-MAR-2015'
)Table3
group by c1
)PoorMotivationPastCount
 on 
 Table1.a = PoorMotivationPastCount.c1
-------------------------------------------------------------------------------------------------
--current Poor Affect data
left join
(
select  distinct(f)
from 
(
SELECT [GateDB_Cris].[dbo].[gate_hunter_bflat_affect_306].BrcId as f, 
	   [GateDB_Cris].[dbo].[gate_hunter_bflat_affect_306].CN_Doc_ID as documentID,
	   match,
	   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate,
	   mlObservation1
  FROM [GateDB_Cris].[dbo].[gate_hunter_bflat_affect_306]
left join
[GateDB_Cris].[dbo].[gate]
 on [GateDB_Cris].[dbo].[gate_hunter_bflat_affect_306].CN_Doc_ID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
 )Table1 
 where calendardate between '01-MAR-2015' and '31-AUG-2015'  and mlObservation1 = 'positive'
 )FlatAffectRecent
 on 
 Table1.a = FlatAffectRecent.f
 ----------------------------------------------------------------------
 --Past 12 months flat affect
left join
(
select distinct(g)
from 
(
SELECT [GateDB_Cris].[dbo].[gate_hunter_bflat_affect_306].BrcId as g, 
	   [GateDB_Cris].[dbo].[gate_hunter_bflat_affect_306].CN_Doc_ID as documentID,
	  match,
	   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate,
	   mlObservation1
  FROM [GateDB_Cris].[dbo].[gate_hunter_bflat_affect_306]
left join
[GateDB_Cris].[dbo].[gate]
 on [GateDB_Cris].[dbo].[gate_hunter_bflat_affect_306].CN_Doc_ID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
 )Table1 
 where calendardate between '01-MAR-2014' and '01-MAR-2015'  and mlObservation1 = 'positive'
 )FlatAffectPast
 on 
 Table1.a = FlatAffectPast.g
 -----------------------------------------------------------------------------------------------
  --Count of Recent FlatAffect
left join
(
select c1,
	   COUNT(match) as flataffectcountcurrent   
from 
			(
			select *
			from 
			(
									select Table1.BrcId as c1,
										   match,
										   documentID,
										   Table1.src_col,
										   Table1.src_table,
										   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate
										    
									from 
															(
															select BrcId,
															keyObservation1, 
															match, 
															cn_doc_id as documentID, 
															src_table,
															src_col 
															from [GateDB_Cris].[dbo].[gate_hunter_bflat_affect_306]
															where mlObservation1 = 'positive'
															)Table1											
									inner join
											  [GateDB_Cris].[dbo].[gate] 
									on 
											  Table1.documentID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
			)Table2					 
			where calendardate between '01-MAR-2015' and '31-AUG-2015'
)Table3
group by c1
)FlatAffectCurrentCount
 on 
 Table1.a = FlatAffectCurrentCount.c1
-------------------------------------------------------------------------------------------------
  --Count of Past Flat Affect
left join
(
select c1,
	   COUNT(match) as flataffectcountpast
from 
			(
			select *
			from 
			(
									select Table1.BrcId as c1,
										   match,
										   documentID,
										   Table1.src_col,
										   Table1.src_table,
										   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate
										    
									from 
															(
															select BrcId,
															keyObservation1, 
															match, 
															cn_doc_id as documentID, 
															src_table,
															src_col 
															from [GateDB_Cris].[dbo].[gate_hunter_bflat_affect_306]
															where mlObservation1 = 'positive'
															)Table1											
									inner join
											  [GateDB_Cris].[dbo].[gate] 
									on 
											  Table1.documentID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
			)Table2					 
			where calendardate between '01-MAR-2014' and '01-MAR-2015'
)Table3
group by c1
)FlatAffectPastCount
 on 
 Table1.a = FlatAffectPastCount.c1
-------------------------------------------------------------------------------------------------
--current anhedonia 
left join
(
select  distinct(h)
from 
(
SELECT [GateDB_Cris].[dbo].[gate_hunter_anhedonia306].BrcId as h, 
	   [GateDB_Cris].[dbo].[gate_hunter_anhedonia306].CN_Doc_ID as documentID,
	   match,
	   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate,
	   mlObservation1
  FROM [GateDB_Cris].[dbo].[gate_hunter_anhedonia306]
left join
[GateDB_Cris].[dbo].[gate]
 on [GateDB_Cris].[dbo].[gate_hunter_anhedonia306].CN_Doc_ID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
 )Table1 
 where calendardate between '01-MAR-2015' and '31-AUG-2015'  and mlObservation1 = 'positive'
 )AnhedoniaRecent
 on 
 Table1.a = AnhedoniaRecent.h
 ----------------------------------------------------------------------
 --Past 12 months anhedonia
left join
(
select distinct(i)
from 
(
SELECT [GateDB_Cris].[dbo].[gate_hunter_anhedonia306].BrcId as i, 
	   [GateDB_Cris].[dbo].[gate_hunter_anhedonia306].CN_Doc_ID as documentID,
	  match,
	   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate,
	   mlObservation1
  FROM [GateDB_Cris].[dbo].[gate_hunter_anhedonia306]
left join
[GateDB_Cris].[dbo].[gate]
 on [GateDB_Cris].[dbo].[gate_hunter_anhedonia306].CN_Doc_ID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
 )Table1 
 where calendardate between '01-MAR-2014' and '01-MAR-2015'  and mlObservation1 = 'positive'
 )AnhedoniaPast
 on 
 Table1.a = AnhedoniaPast.i
 -----------------------------------------------------------------------------------------------
  --Count of Recent anhedonia
left join
(
select c1,
	   COUNT(match) as anhedoniacountcurrent   
from 
			(
			select *
			from 
			(
									select Table1.BrcId as c1,
										   match,
										   documentID,
										   Table1.src_col,
										   Table1.src_table,
										   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate
										    
									from 
															(
															select BrcId,
															keyObservation1, 
															match, 
															cn_doc_id as documentID, 
															src_table,
															src_col 
															from [GateDB_Cris].[dbo].[gate_hunter_anhedonia306]
															where mlObservation1 = 'positive' 
															)Table1											
									inner join
											  [GateDB_Cris].[dbo].[gate] 
									on 
											  Table1.documentID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
			)Table2					 
			where calendardate between '01-MAR-2015' and '31-AUG-2015'
)Table3
group by c1
)AnhedoniaCurrentCount
 on 
 Table1.a = AnhedoniaCurrentCount.c1
		
-------------------------------------------------------------------------------------------------
  --Count of Past Anhedonia
left join
(
select c1,
	   COUNT(match) as anhedoniacountpast
from 

			(
			select *
			from 
			(
									select Table1.BrcId as c1,
										   match,
										   documentID,
										   Table1.src_col,
										   Table1.src_table,
										   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate
										    
									from 
															(
															select BrcId,
															keyObservation1, 
															match, 
															cn_doc_id as documentID, 
															src_table,
															src_col 
															from [GateDB_Cris].[dbo].[gate_hunter_anhedonia306]
															where mlObservation1 = 'positive'
															)Table1											
									inner join
											  [GateDB_Cris].[dbo].[gate] 
									on 
											  Table1.documentID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
			)Table2					 
			where calendardate between '01-MAR-2014' and '01-MAR-2015'
)Table3
group by c1
)AnhedoniaPastCount
 on 
 Table1.a = AnhedoniaPastCount.c1
-------------------------------------------------------------------------------------------------
--current hopelessness data
left join
(
select  distinct(j)
from 
(
SELECT [GateDB_Cris].[dbo].[gate_hunter_hopeless306].BrcId as j, 
	   [GateDB_Cris].[dbo].[gate_hunter_hopeless306].CN_Doc_ID as documentID,
	   match,
	   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate,
	   mlObservation1
  FROM [GateDB_Cris].[dbo].[gate_hunter_hopeless306]
left join
[GateDB_Cris].[dbo].[gate]
 on [GateDB_Cris].[dbo].[gate_hunter_hopeless306].CN_Doc_ID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
 )Table1 
 where calendardate between '01-MAR-2015' and '31-AUG-2015' and mlObservation1 = 'positive'
 )HopelessRecent
 on 
 Table1.a = HopelessRecent.j
 ----------------------------------------------------------------------
 --Past 12 months hopeless
left join
(
select distinct(k)
from 
(
SELECT [GateDB_Cris].[dbo].[gate_hunter_hopeless306].BrcId as k, 
	   [GateDB_Cris].[dbo].[gate_hunter_hopeless306].CN_Doc_ID as documentID,
	  match,
	   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate,
	   mlObservation1
  FROM [GateDB_Cris].[dbo].[gate_hunter_hopeless306]
left join
[GateDB_Cris].[dbo].[gate]
 on [GateDB_Cris].[dbo].[gate_hunter_hopeless306].CN_Doc_ID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
 )Table1 
 where calendardate between '01-MAR-2014' and '01-MAR-2015'  and mlObservation1 = 'positive'
 )HopelessPast
 on 
 Table1.a = HopelessPast.k
 -----------------------------------------------------------------------------------------------
  --Count of Recent Hopeless
left join
(
select c1,
	   COUNT(match) as hopelesscountcurrent   
from 
			(
			select *
			from 
			(
									select Table1.BrcId as c1,
										   match,
										   documentID,
										   Table1.src_col,
										   Table1.src_table,
										   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate
										    
									from 
															(
															select BrcId,
															keyObservation1, 
															match, 
															cn_doc_id as documentID, 
															src_table,
															src_col 
															from [GateDB_Cris].[dbo].[gate_hunter_hopeless306]
															where mlObservation1 = 'positive' 
															)Table1											
									inner join
											  [GateDB_Cris].[dbo].[gate] 
									on 
											  Table1.documentID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
			)Table2					 
			where calendardate between '01-MAR-2015' and '31-AUG-2015'
)Table3
group by c1
)HopelessCurrentCount
 on 
 Table1.a = HopelessCurrentCount.c1	
-------------------------------------------------------------------------------------------------
  --Count of Past Hopeless
left join
(
select c1,
	   COUNT(match) as hopelesscountpast
from 
			(
			select *
			from 
			(
									select Table1.BrcId as c1,
										   match,
										   documentID,
										   Table1.src_col,
										   Table1.src_table,
										   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate
										    
									from 
															(
															select BrcId,
															keyObservation1, 
															match, 
															cn_doc_id as documentID, 
															src_table,
															src_col 
															from [GateDB_Cris].[dbo].[gate_hunter_hopeless306]
															where mlObservation1 = 'positive'
															)Table1											
									inner join
											  [GateDB_Cris].[dbo].[gate] 
									on 
											  Table1.documentID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
			)Table2					 
			where calendardate between '01-MAR-2014' and '01-MAR-2015'
)Table3
group by c1
)HopelessPastCount
 on 
 Table1.a = HopelessPastCount.c1
-------------------------------------------------------------------------------------------------
--current worthless data
left join
(
select  distinct(l)
from 
(
SELECT [GateDB_Cris].[dbo].[gate_hunter_worthless306].BrcId as l, 
	   [GateDB_Cris].[dbo].[gate_hunter_worthless306].CN_Doc_ID as documentID,
	   match,
	   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate,
	   mlObservation1
  FROM [GateDB_Cris].[dbo].[gate_hunter_worthless306]
left join
[GateDB_Cris].[dbo].[gate]
 on [GateDB_Cris].[dbo].[gate_hunter_worthless306].CN_Doc_ID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
 )Table1 
 where calendardate between '01-MAR-2015' and '31-AUG-2015' and mlObservation1 = 'positive'
 )WorthlessRecent
 on 
 Table1.a = WorthlessRecent.l
 ----------------------------------------------------------------------
 --Past 12 months worthless
left join
(
select distinct(m)
from 
(
SELECT [GateDB_Cris].[dbo].[gate_hunter_worthless306].BrcId as m, 
	   [GateDB_Cris].[dbo].[gate_hunter_worthless306].CN_Doc_ID as documentID,
	  match,
	   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate,
	   mlObservation1
  FROM [GateDB_Cris].[dbo].[gate_hunter_worthless306]
left join
[GateDB_Cris].[dbo].[gate]
 on [GateDB_Cris].[dbo].[gate_hunter_worthless306].CN_Doc_ID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
 )Table1 
 where calendardate between '01-MAR-2014' and '01-MAR-2015'  and mlObservation1 = 'positive'
 )WorthlessPast
 on 
 Table1.a = WorthlessPast.m
 -----------------------------------------------------------------------------------------------
  --Count of Recent Worthless
left join
(
select c1,
	   COUNT(match) as worthlesscountcurrent   
from 
			(
			select *
			from 
			(
									select Table1.BrcId as c1,
										   match,
										   documentID,
										   Table1.src_col,
										   Table1.src_table,
										   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate
										    
									from 
															(
															select BrcId,
															keyObservation1, 
															match, 
															cn_doc_id as documentID, 
															src_table,
															src_col 
															from [GateDB_Cris].[dbo].[gate_hunter_worthless306]
															where mlObservation1 = 'positive'
															)Table1											
									inner join
											  [GateDB_Cris].[dbo].[gate] 
									on 
											  Table1.documentID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
			)Table2					 
			where calendardate between '01-MAR-2015' and '31-AUG-2015'
)Table3
group by c1
)WorthlessCurrentCount
 on 
 Table1.a = WorthlessCurrentCount.c1
-------------------------------------------------------------------------------------------------
  --Count of Past Worthless
left join
(
select c1,
	   COUNT(match) as worthlesscountpast
from 
			(
			select *
			from 
			(
									select Table1.BrcId as c1,
										   match,
										   documentID,
										   Table1.src_col,
										   Table1.src_table,
										   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate
										    
									from 
															(
															select BrcId,
															keyObservation1, 
															match, 
															cn_doc_id as documentID, 
															src_table,
															src_col 
															from [GateDB_Cris].[dbo].[gate_hunter_worthless306]
															where mlObservation1 = 'positive'
															)Table1											
									inner join
											  [GateDB_Cris].[dbo].[gate] 
									on 
											  Table1.documentID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
			)Table2					 
			where calendardate between '01-MAR-2014' and '01-MAR-2015'
)Table3
group by c1
)WorthlessPastCount
 on 
 Table1.a = WorthlessPastCount.c1
-------------------------------------------------------------------------------------------------
--current SuicideAttempt data
left join
(
select  distinct(n)
from 
(
SELECT [GateDB_Cris].[dbo].[gate_hunter_suicide_306].BrcId as n, 
	   [GateDB_Cris].[dbo].[gate_hunter_suicide_306].CN_Doc_ID as documentID,
	   match,
	   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate,
	   mlObservation1
  FROM [GateDB_Cris].[dbo].[gate_hunter_suicide_306]
left join
[GateDB_Cris].[dbo].[gate]
 on [GateDB_Cris].[dbo].[gate_hunter_suicide_306].CN_Doc_ID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
 )Table1 
 where calendardate between '01-MAR-2015' and '31-AUG-2015'  and mlObservation1 = 'positive'
 )SuicideARecent
 on 
 Table1.a = SuicideARecent.n
 ----------------------------------------------------------------------
 --Past 12 months suicide attempt
left join
(
select distinct(o)
from 
(
SELECT [GateDB_Cris].[dbo].[gate_hunter_suicide_306].BrcId as o, 
	   [GateDB_Cris].[dbo].[gate_hunter_suicide_306].CN_Doc_ID as documentID,
	  match,
	   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate,
	   mlObservation1
  FROM [GateDB_Cris].[dbo].[gate_hunter_suicide_306]
left join
[GateDB_Cris].[dbo].[gate]
 on [GateDB_Cris].[dbo].[gate_hunter_suicide_306].CN_Doc_ID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
 )Table1 
 where calendardate between '01-MAR-2014' and '01-MAR-2015' and mlObservation1 = 'positive'
 )SuicideAPast
 on 
 Table1.a = SuicideAPast.o
 -----------------------------------------------------------------------------------------------
  --Count of Recent Suicide Attempt
left join
(
select c1,
	   COUNT(match) as suicideattemptcountcurrent   
from 
			(
			select *
			from 
			(
									select Table1.BrcId as c1,
										   match,
										   documentID,
										   Table1.src_col,
										   Table1.src_table,
										   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate
										    
									from 
															(
															select BrcId,
															keyObservation1, 
															match, 
															cn_doc_id as documentID, 
															src_table,
															src_col 
															from [GateDB_Cris].[dbo].[gate_hunter_suicide_306]
															where mlObservation1 = 'positive'
															)Table1											
									inner join
											  [GateDB_Cris].[dbo].[gate] 
									on 
											  Table1.documentID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
			)Table2					 
			where calendardate between '01-MAR-2015' and '31-AUG-2015'
)Table3
group by c1
)SuicideACurrentCount
 on 
 Table1.a = SuicideACurrentCount.c1
-------------------------------------------------------------------------------------------------
  --Count of Past Suicide Attempt
left join
(
select c1,
	   COUNT(match) as suicideattemptcountpast
from 
			(
			select *
			from 
			(
									select Table1.BrcId as c1,
										   match,
										   documentID,
										   Table1.src_col,
										   Table1.src_table,
										   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate
										    
									from 
															(
															select BrcId,
															keyObservation1, 
															match, 
															cn_doc_id as documentID, 
															src_table,
															src_col 
															from [GateDB_Cris].[dbo].[gate_hunter_suicide_306]
															where mlObservation1 = 'positive'
															)Table1											
									inner join
											  [GateDB_Cris].[dbo].[gate] 
									on 
											  Table1.documentID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
			)Table2					 
			where calendardate between '01-MAR-2014' and '01-MAR-2015'
)Table3
group by c1
)SuicideAPastCount
 on 
 Table1.a = SuicideAPastCount.c1
-------------------------------------------------------------------------------------------------
--current anergia data
left join
(
select  distinct(p)
from 
(
SELECT [GateDB_Cris].[dbo].[gate_hunter_anergia306].BrcId as p, 
	   [GateDB_Cris].[dbo].[gate_hunter_anergia306].CN_Doc_ID as documentID,
	   match,
	   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate,
	   mlObservation1
  FROM [GateDB_Cris].[dbo].[gate_hunter_anergia306]
left join
[GateDB_Cris].[dbo].[gate]
 on [GateDB_Cris].[dbo].[gate_hunter_anergia306].CN_Doc_ID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
 )Table1 
 where calendardate between '01-MAR-2015' and '31-AUG-2015' and mlObservation1 = 'positive'
 )AnergiaRecent
 on 
 Table1.a = AnergiaRecent.p
 ----------------------------------------------------------------------
 --Past 12 months anergia
left join
(
select distinct(q)
from 
(
SELECT [GateDB_Cris].[dbo].[gate_hunter_anergia306].BrcId as q, 
	   [GateDB_Cris].[dbo].[gate_hunter_anergia306].CN_Doc_ID as documentID,
	  match,
	   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate,
	   mlObservation1
  FROM [GateDB_Cris].[dbo].[gate_hunter_anergia306]
left join
[GateDB_Cris].[dbo].[gate]
 on [GateDB_Cris].[dbo].[gate_hunter_anergia306].CN_Doc_ID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
 )Table1 
 where calendardate between '01-MAR-2014' and '01-MAR-2015'  and mlObservation1 = 'positive'
 )AnergiaPast
 on 
 Table1.a = AnergiaPast.q
 
 -----------------------------------------------------------------------------------------------
  --Count of Recent anergia
left join
(
select c1,
	   COUNT(match) as anergiacountcurrent   
from 
			(
			select *
			from 
			(
									select Table1.BrcId as c1,
										   match,
										   documentID,
										   Table1.src_col,
										   Table1.src_table,
										   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate    
									from 
															(
															select BrcId,
															keyObservation1, 
															match, 
															cn_doc_id as documentID, 
															src_table,
															src_col 
															from [GateDB_Cris].[dbo].[gate_hunter_anergia306]
															where mlObservation1 = 'positive'
															)Table1											
									inner join
											  [GateDB_Cris].[dbo].[gate] 
									on 
											  Table1.documentID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
			)Table2					 
			where calendardate between '01-MAR-2015' and '31-AUG-2015'
)Table3
group by c1
)AnergiaCurrentCount
 on 
 Table1.a = AnergiaCurrentCount.c1
		
-------------------------------------------------------------------------------------------------
  --Count of Past anergia
left join
(
select c1,
	   COUNT(match) as anergiacountpast
from 
			(
			select *
			from 
			(
									select Table1.BrcId as c1,
										   match,
										   documentID,
										   Table1.src_col,
										   Table1.src_table,
										   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate  
									from 
															(
															select BrcId,
															keyObservation1, 
															match, 
															cn_doc_id as documentID, 
															src_table,
															src_col 
															from [GateDB_Cris].[dbo].[gate_hunter_anergia306]
															where mlObservation1 = 'positive'
															)Table1											
									inner join
											  [GateDB_Cris].[dbo].[gate] 
									on 
											  Table1.documentID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
			)Table2					 
			where calendardate between '01-MAR-2014' and '01-MAR-2015'
)Table3
group by c1
)AnergiaPastCount

 on 
 
 Table1.a = AnergiaPastCount.c1
----------------------------------------------------------------------------------
-- Current Apathy 

--Apathy can be defined as an absence or suppression of emotion, feeling, 
--concern or passion. Further, apathy is an indifference to things generally 
--found to be exciting or moving.

--Description
--A strong connection exists between apathy and mental disorders. 
--Apathy is one of the hallmark symptoms of schizophrenia . 
--Many people with schizophrenia express little interest in the events surrounding them. 
--Apathy can also occur in depression and depressive disorders . 
--For example, people who are depressed and have major depressive disorder or 
--dysthymic disorder often feel numb to events occurring around them, and do not 
--derive pleasure from experiences that they once found enjoyable.
--current anergia data


left join
(
select  distinct(r)
from 
(
SELECT [GateDB_Cris].[dbo].[gate_hunter_apathy306].BrcId as r, 
	   [GateDB_Cris].[dbo].[gate_hunter_apathy306].CN_Doc_ID as documentID,
	   match,
	   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate,
	   mlObservation1
  FROM [GateDB_Cris].[dbo].[gate_hunter_apathy306]
left join
[GateDB_Cris].[dbo].[gate]
 on [GateDB_Cris].[dbo].[gate_hunter_apathy306].CN_Doc_ID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
 )Table1 
 where calendardate between '01-MAR-2015' and '31-AUG-2015' and mlObservation1 = 'positive'
 )ApathyRecent
 on 
 Table1.a = ApathyRecent.r
 ----------------------------------------------------------------------
 --Past 12 months apathy
left join
(
select distinct(s)
from 
(
SELECT [GateDB_Cris].[dbo].[gate_hunter_apathy306].BrcId as s, 
	   [GateDB_Cris].[dbo].[gate_hunter_apathy306].CN_Doc_ID as documentID,
	  match,
	   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate,
	   mlObservation1
  FROM [GateDB_Cris].[dbo].[gate_hunter_apathy306]
left join
[GateDB_Cris].[dbo].[gate]
 on [GateDB_Cris].[dbo].[gate_hunter_apathy306].CN_Doc_ID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
 )Table1 
 where calendardate between '01-MAR-2014' and '01-MAR-2015' and mlObservation1 = 'positive'
 )ApathyPast
 on 
 Table1.a = ApathyPast.s
 
 -----------------------------------------------------------------------------------------------
  --Count of Recent apathy
left join
(
select c1,
	   COUNT(match) as apathycountcurrent   
from 
			(
			select *
			from 
			(
									select Table1.BrcId as c1,
										   match,
										   documentID,
										   Table1.src_col,
										   Table1.src_table,
										   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate    
									from 
															(
															select BrcId,
															keyObservation1, 
															match, 
															cn_doc_id as documentID, 
															src_table,
															src_col 
															from [GateDB_Cris].[dbo].[gate_hunter_apathy306]
															where mlObservation1 = 'positive'
															)Table1											
									inner join
											  [GateDB_Cris].[dbo].[gate] 
									on 
											  Table1.documentID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
			)Table2					 
			where calendardate between '01-MAR-2015' and '31-AUG-2015'
)Table3
group by c1
)ApathyCurrentCount
 on 
 Table1.a = ApathyCurrentCount.c1
		
-------------------------------------------------------------------------------------------------
  --Count of Past apathy
left join
(
select c1,
	   COUNT(match) as apathycountpast
from 
			(
			select *
			from 
			(
									select Table1.BrcId as c1,
										   match,
										   documentID,
										   Table1.src_col,
										   Table1.src_table,
										   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate  
									from 
															(
															select BrcId,
															keyObservation1, 
															match, 
															cn_doc_id as documentID, 
															src_table,
															src_col 
															from [GateDB_Cris].[dbo].[gate_hunter_apathy306]
															where mlObservation1 = 'positive'
															)Table1											
									inner join
											  [GateDB_Cris].[dbo].[gate] 
									on 
											  Table1.documentID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
			)Table2					 
			where calendardate between '01-MAR-2014' and '01-MAR-2015'
)Table3
group by c1
)ApathyPastCount

 on 
 
 Table1.a = ApathyPastCount.c1

---------------------------------------------------------------------------------
-- Current Insomnia
left join
(
select  distinct(t)
from 
(
SELECT [GateDB_Cris].[dbo].[gate_hunter_insomnia306].BrcId as t, 
	   [GateDB_Cris].[dbo].[gate_hunter_insomnia306].CN_Doc_ID as documentID,
	   match,
	   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate,
	   mlObservation1
  FROM [GateDB_Cris].[dbo].[gate_hunter_insomnia306]
left join
[GateDB_Cris].[dbo].[gate]
 on [GateDB_Cris].[dbo].[gate_hunter_insomnia306].CN_Doc_ID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
 )Table1 
 where calendardate between '01-MAR-2015' and '31-AUG-2015' and mlObservation1 = 'positive'
 )InsomniaRecent
 on 
 Table1.a = InsomniaRecent.t
 ----------------------------------------------------------------------
 --Past 12 months insomnia
left join
(
select distinct(u)
from 
(
SELECT [GateDB_Cris].[dbo].[gate_hunter_insomnia306].BrcId as u, 
	   [GateDB_Cris].[dbo].[gate_hunter_insomnia306].CN_Doc_ID as documentID,
	  match,
	   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate,
	   mlObservation1
  FROM [GateDB_Cris].[dbo].[gate_hunter_insomnia306]
left join
[GateDB_Cris].[dbo].[gate]
 on [GateDB_Cris].[dbo].[gate_hunter_insomnia306].CN_Doc_ID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
 )Table1 
 where calendardate between '01-MAR-2014' and '01-MAR-2015'  and mlObservation1 = 'positive'
 )InsomniaPast
 on 
 Table1.a = InsomniaPast.u
 
 -----------------------------------------------------------------------------------------------
  --Count of Recent apathy
left join
(
select c1,
	   COUNT(match) as insomniacountcurrent   
from 
			(
			select *
			from 
			(
									select Table1.BrcId as c1,
										   match,
										   documentID,
										   Table1.src_col,
										   Table1.src_table,
										   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate    
									from 
															(
															select BrcId,
															keyObservation1, 
															match, 
															cn_doc_id as documentID, 
															src_table,
															src_col 
															from [GateDB_Cris].[dbo].[gate_hunter_insomnia306]
															where mlObservation1 = 'positive'
															)Table1											
									inner join
											  [GateDB_Cris].[dbo].[gate] 
									on 
											  Table1.documentID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
			)Table2					 
			where calendardate between '01-MAR-2015' and '31-AUG-2015'
)Table3
group by c1
)InsomniaCurrentCount
 on 
 Table1.a = InsomniaCurrentCount.c1
		
-------------------------------------------------------------------------------------------------
  --Count of Past insomnia
left join
(
select c1,
	   COUNT(match) as insomniacountpast
from 
			(
			select *
			from 
			(
									select Table1.BrcId as c1,
										   match,
										   documentID,
										   Table1.src_col,
										   Table1.src_table,
										   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate  
									from 
															(
															select BrcId,
															keyObservation1, 
															match, 
															cn_doc_id as documentID, 
															src_table,
															src_col 
															from [GateDB_Cris].[dbo].[gate_hunter_insomnia306]
															where mlObservation1 = 'positive'
															)Table1											
									inner join
											  [GateDB_Cris].[dbo].[gate] 
									on 
											  Table1.documentID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
			)Table2					 
			where calendardate between '01-MAR-2014' and '01-MAR-2015'
)Table3
group by c1
)InsomniaPastCount

 on 
 
 Table1.a = InsomniaPastCount.c1
---------------------------------------------------------------------------------
-- Aggression Current

left join
(
select  distinct(v)
from 
(
SELECT [GateDB_Cris].[dbo].[gate_hunter_aggression_306].BrcId as v, 
	   [GateDB_Cris].[dbo].[gate_hunter_aggression_306].CN_Doc_ID as documentID,
	   match,
	   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate,
	   mlObservation1
  FROM [GateDB_Cris].[dbo].[gate_hunter_aggression_306]
left join
[GateDB_Cris].[dbo].[gate]
 on [GateDB_Cris].[dbo].[gate_hunter_aggression_306].CN_Doc_ID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
 )Table1 
 where calendardate between '01-MAR-2015' and '31-AUG-2015' and mlObservation1 = 'positive'
 )AgressionRecent
 on 
 Table1.a = AgressionRecent.v
 ----------------------------------------------------------------------
 --Past 12 months aggression
left join
(
select distinct(w)
from 
(
SELECT [GateDB_Cris].[dbo].[gate_hunter_aggression_306].BrcId as w, 
	   [GateDB_Cris].[dbo].[gate_hunter_aggression_306].CN_Doc_ID as documentID,
	  match,
	   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate,
	   mlObservation1
  FROM [GateDB_Cris].[dbo].[gate_hunter_aggression_306]
left join
[GateDB_Cris].[dbo].[gate]
 on [GateDB_Cris].[dbo].[gate_hunter_aggression_306].CN_Doc_ID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
 )Table1 
 where calendardate between '01-MAR-2014' and '01-MAR-2015' and mlObservation1 = 'positive'
 )AgressionPast
 on 
 Table1.a = AgressionPast.w 
 -----------------------------------------------------------------------------------------------
  --Count of Recent aggression
left join
(
select c1,
	   COUNT(match) as aggressioncountcurrent   
from 
			(
			select *
			from 
			(
									select Table1.BrcId as c1,
										   match,
										   documentID,
										   Table1.src_col,
										   Table1.src_table,
										   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate    
									from 
															(
															select BrcId,
															keyObservation1, 
															match, 
															cn_doc_id as documentID, 
															src_table,
															src_col 
															from [GateDB_Cris].[dbo].[gate_hunter_aggression_306]
															where mlObservation1 = 'positive'
															)Table1											
									inner join
											  [GateDB_Cris].[dbo].[gate] 
									on 
											  Table1.documentID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
			)Table2					 
			where calendardate between '01-MAR-2015' and '31-AUG-2015'
)Table3
group by c1
)AggressionCurrentCount
 on 
 Table1.a = AggressionCurrentCount.c1
		
-------------------------------------------------------------------------------------------------
  --Count of Past aggression
left join
(
select c1,
	   COUNT(match) as aggressioncountpast
from 
			(
			select *
			from 
			(
									select Table1.BrcId as c1,
										   match,
										   documentID,
										   Table1.src_col,
										   Table1.src_table,
										   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate  
									from 
															(
															select BrcId,
															keyObservation1, 
															match, 
															cn_doc_id as documentID, 
															src_table,
															src_col 
															from [GateDB_Cris].[dbo].[gate_hunter_aggression_306]
															where mlObservation1 = 'positive'
															)Table1											
									inner join
											  [GateDB_Cris].[dbo].[gate] 
									on 
											  Table1.documentID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
			)Table2					 
			where calendardate between '01-MAR-2014' and '01-MAR-2015'
)Table3
group by c1
)AggressionPastCount

 on 
 
 Table1.a = AggressionPastCount.c1
 
 --------------------------------------------------------------------------------------
--- Agitation Current

left join
(
select  distinct(x)
from 
(
SELECT [GateDB_Cris].[dbo].[gate_hunter_agitation_306].BrcId as x, 
	   [GateDB_Cris].[dbo].[gate_hunter_agitation_306].CN_Doc_ID as documentID,
	   match,
	   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate,
	   mlObservation1
  FROM [GateDB_Cris].[dbo].[gate_hunter_agitation_306]
left join
[GateDB_Cris].[dbo].[gate]
 on [GateDB_Cris].[dbo].[gate_hunter_agitation_306].CN_Doc_ID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
 )Table1 
 where calendardate between '01-MAR-2015' and '31-AUG-2015' and mlObservation1 = 'positive'
 )AgitationRecent
 on 
 Table1.a = AgitationRecent.x
 ----------------------------------------------------------------------
 --Past 12 months agitation
left join
(
select distinct(y)
from 
(
SELECT [GateDB_Cris].[dbo].[gate_hunter_agitation_306].BrcId as y, 
	   [GateDB_Cris].[dbo].[gate_hunter_agitation_306].CN_Doc_ID as documentID,
	  match,
	   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate,
	   mlObservation1
  FROM [GateDB_Cris].[dbo].[gate_hunter_agitation_306]
left join
[GateDB_Cris].[dbo].[gate]
 on [GateDB_Cris].[dbo].[gate_hunter_agitation_306].CN_Doc_ID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
 )Table1 
 where calendardate between '01-MAR-2014' and '01-MAR-2015' and mlObservation1 = 'positive'
 )AgitationPast
 on 
 Table1.a = AgitationPast.y
 -----------------------------------------------------------------------------------------------
  --Count of Recent agitation
left join
(
select c1,
	   COUNT(match) as agitationcountcurrent   
from 
			(
			select *
			from 
			(
									select Table1.BrcId as c1,
										   match,
										   documentID,
										   Table1.src_col,
										   Table1.src_table,
										   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate    
									from 
															(
															select BrcId,
															keyObservation1, 
															match, 
															cn_doc_id as documentID, 
															src_table,
															src_col 
															from [GateDB_Cris].[dbo].[gate_hunter_agitation_306]
															where mlObservation1 = 'positive' 
															)Table1											
									inner join
											  [GateDB_Cris].[dbo].[gate] 
									on 
											  Table1.documentID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
			)Table2					 
			where calendardate between '01-MAR-2015' and '31-AUG-2015'
)Table3
group by c1
)AgitationCurrentCount
 on 
 Table1.a = AgitationCurrentCount.c1
		
-------------------------------------------------------------------------------------------------
  --Count of Past agitation
left join
(
select c1,
	   COUNT(match) as agitationcountpast
from 
			(
			select *
			from 
			(
									select Table1.BrcId as c1,
										   match,
										   documentID,
										   Table1.src_col,
										   Table1.src_table,
										   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate  
									from 
															(
															select BrcId,
															keyObservation1, 
															match, 
															cn_doc_id as documentID, 
															src_table,
															src_col 
															from [GateDB_Cris].[dbo].[gate_hunter_agitation_306]
															where mlObservation1 = 'positive'
															)Table1											
									inner join
											  [GateDB_Cris].[dbo].[gate] 
									on 
											  Table1.documentID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
			)Table2					 
			where calendardate between '01-MAR-2014' and '01-MAR-2015'
)Table3
group by c1
)AgitationPastCount

 on 
 
 Table1.a = AgitationPastCount.c1
 ---------------------------------------------------------------------------------------
-- Low energy current

left join
(
select  distinct(z)
from 
(
SELECT [GateDB_Cris].[dbo].[gate_hunter_energy306].BrcId as z, 
	   [GateDB_Cris].[dbo].[gate_hunter_energy306].CN_Doc_ID as documentID,
	   match,
	   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate,
	   mlObservation1
  FROM [GateDB_Cris].[dbo].[gate_hunter_energy306]
left join
[GateDB_Cris].[dbo].[gate]
 on [GateDB_Cris].[dbo].[gate_hunter_energy306].CN_Doc_ID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
 )Table1 
 where calendardate between '01-MAR-2015' and '31-AUG-2015' and mlObservation1 = 'positive'
 )EnergyRecent
 on 
 Table1.a = EnergyRecent.z
 ----------------------------------------------------------------------
 --Past 12 months energy
left join
(
select distinct(a1)
from 
(
SELECT [GateDB_Cris].[dbo].[gate_hunter_energy306].BrcId as a1, 
	   [GateDB_Cris].[dbo].[gate_hunter_energy306].CN_Doc_ID as documentID,
	  match,
	   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate,
	   mlObservation1
  FROM [GateDB_Cris].[dbo].[gate_hunter_energy306]
left join
[GateDB_Cris].[dbo].[gate]
 on [GateDB_Cris].[dbo].[gate_hunter_energy306].CN_Doc_ID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
 )Table1 
 where calendardate between '01-MAR-2014' and '01-MAR-2015' and mlObservation1 = 'positive'
 )EnergyPast
 on 
 Table1.a = EnergyPast.a1
 -----------------------------------------------------------------------------------------------
  --Count of Recent energy
left join
(
select c1,
	   COUNT(match) as energycountcurrent   
from 
			(
			select *
			from 
			(
									select Table1.BrcId as c1,
										   match,
										   documentID,
										   Table1.src_col,
										   Table1.src_table,
										   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate    
									from 
															(
															select BrcId,
															keyObservation1, 
															match, 
															cn_doc_id as documentID, 
															src_table,
															src_col 
															from [GateDB_Cris].[dbo].[gate_hunter_energy306]
															where mlObservation1 = 'positive'
															)Table1											
									inner join
											  [GateDB_Cris].[dbo].[gate] 
									on 
											  Table1.documentID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
			)Table2					 
			where calendardate between '01-MAR-2015' and '31-AUG-2015'
)Table3
group by c1
)EnergyCurrentCount
 on 
 Table1.a = EnergyCurrentCount.c1
		
-------------------------------------------------------------------------------------------------
  --Count of Past energy
left join
(
select c1,
	   COUNT(match) as energycountpast
from 
			(
			select *
			from 
			(
									select Table1.BrcId as c1,
										   match,
										   documentID,
										   Table1.src_col,
										   Table1.src_table,
										   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate  
									from 
															(
															select BrcId,
															keyObservation1, 
															match, 
															cn_doc_id as documentID, 
															src_table,
															src_col 
															from [GateDB_Cris].[dbo].[gate_hunter_energy306]
															where mlObservation1 = 'positive'
															)Table1											
									inner join
											  [GateDB_Cris].[dbo].[gate] 
									on 
											  Table1.documentID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
			)Table2					 
			where calendardate between '01-MAR-2014' and '01-MAR-2015'
)Table3
group by c1
)EnergyPastCount

 on 
 
 Table1.a = EnergyPastCount.c1
 --------------------------------------------------------------------------------------
-- Current delusion

left join
(
select  distinct(b1)
from 
(
SELECT [GateDB_Cris].[dbo].[gate_hunter_delusion_306].BrcId as b1, 
	   [GateDB_Cris].[dbo].[gate_hunter_delusion_306].CN_Doc_ID as documentID,
	   match,
	   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate,
	   mlObservation1
  FROM [GateDB_Cris].[dbo].[gate_hunter_delusion_306]
left join
[GateDB_Cris].[dbo].[gate]
 on [GateDB_Cris].[dbo].[gate_hunter_delusion_306].CN_Doc_ID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
 )Table1 
 where calendardate between '01-MAR-2015' and '31-AUG-2015' and mlObservation1 = 'positive'
 )DelusionRecent
 on 
 Table1.a = DelusionRecent.b1
 ----------------------------------------------------------------------
 --Past 12 months delusion
left join
(
select distinct(d1)
from 
(
SELECT [GateDB_Cris].[dbo].[gate_hunter_delusion_306].BrcId as d1, 
	   [GateDB_Cris].[dbo].[gate_hunter_delusion_306].CN_Doc_ID as documentID,
	  match,
	   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate,
	   mlObservation1
  FROM [GateDB_Cris].[dbo].[gate_hunter_delusion_306]
left join
[GateDB_Cris].[dbo].[gate]
 on [GateDB_Cris].[dbo].[gate_hunter_delusion_306].CN_Doc_ID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
 )Table1 
 where calendardate between '01-MAR-2014' and '01-MAR-2015' and mlObservation1 = 'positive'
 )DelusionPast
 on 
 Table1.a = DelusionPast.d1
 -----------------------------------------------------------------------------------------------
  --Count of Delusion 
left join
(
select c1,
	   COUNT(match) as delusioncountcurrent   
from 
			(
			select *
			from 
			(
									select Table1.BrcId as c1,
										   match,
										   documentID,
										   Table1.src_col,
										   Table1.src_table,
										   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate    
									from 
															(
															select BrcId,
															keyObservation1, 
															match, 
															cn_doc_id as documentID, 
															src_table,
															src_col 
															from [GateDB_Cris].[dbo].[gate_hunter_delusion_306]
															where mlObservation1 = 'positive'
															)Table1											
									inner join
											  [GateDB_Cris].[dbo].[gate] 
									on 
											  Table1.documentID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
			)Table2					 
			where calendardate between '01-MAR-2015' and '31-AUG-2015'
)Table3
group by c1
)DelusionCurrentCount
 on 
 Table1.a = DelusionCurrentCount.c1
		
-------------------------------------------------------------------------------------------------
  --Count of Past delusion
left join
(
select c1,
	   COUNT(match) as delusioncountpast
from 
			(
			select *
			from 
			(
									select Table1.BrcId as c1,
										   match,
										   documentID,
										   Table1.src_col,
										   Table1.src_table,
										   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate  
									from 
															(
															select BrcId,
															keyObservation1, 
															match, 
															cn_doc_id as documentID, 
															src_table,
															src_col 
															from [GateDB_Cris].[dbo].[gate_hunter_delusion_306]
															where mlObservation1 = 'positive'
															)Table1											
									inner join
											  [GateDB_Cris].[dbo].[gate] 
									on 
											  Table1.documentID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
			)Table2					 
			where calendardate between '01-MAR-2014' and '01-MAR-2015'
)Table3
group by c1
)DelusionPastCount

 on 
 
 Table1.a = DelusionPastCount.c1
 
 -------------------------------------------------------------------------------------
-- Appetite Current
left join
(
select  distinct(e1)
from 
(
SELECT [GateDB_Cris].[dbo].[gate_hunter_appetite_306].BrcId as e1, 
	   [GateDB_Cris].[dbo].[gate_hunter_appetite_306].CN_Doc_ID as documentID,
	   match,
	   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate,
	   mlObservation1
  FROM [GateDB_Cris].[dbo].[gate_hunter_appetite_306]
left join
[GateDB_Cris].[dbo].[gate]
 on [GateDB_Cris].[dbo].[gate_hunter_appetite_306].CN_Doc_ID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
 )Table1 
 where calendardate between '01-MAR-2015' and '31-AUG-2015' and mlObservation1 = 'negative'
 )AppetiteRecent
 on 
 Table1.a = AppetiteRecent.e1
 ----------------------------------------------------------------------
 --Past 12 months appetite
left join
(
select distinct(f1)
from 
(
SELECT [GateDB_Cris].[dbo].[gate_hunter_appetite_306].BrcId as f1, 
	   [GateDB_Cris].[dbo].[gate_hunter_appetite_306].CN_Doc_ID as documentID,
	  match,
	   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate,
	   mlObservation1
  FROM [GateDB_Cris].[dbo].[gate_hunter_appetite_306]
left join
[GateDB_Cris].[dbo].[gate]
 on [GateDB_Cris].[dbo].[gate_hunter_appetite_306].CN_Doc_ID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
 )Table1 
 where calendardate between '01-MAR-2014' and '01-MAR-2015' and mlObservation1 = 'negative'
 )AppetitePast
 on 
 Table1.a = AppetitePast.f1
 -----------------------------------------------------------------------------------------------
  --Count of Appetite energy
left join
(
select c1,
	   COUNT(match) as appetitecountcurrent   
from 
			(
			select *
			from 
			(
									select Table1.BrcId as c1,
										   match,
										   documentID,
										   Table1.src_col,
										   Table1.src_table,
										   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate    
									from 
															(
															select BrcId,
															keyObservation1, 
															match, 
															cn_doc_id as documentID, 
															src_table,
															src_col 
															from [GateDB_Cris].[dbo].[gate_hunter_appetite_306]
															where mlObservation1 = 'negative'
															)Table1											
									inner join
											  [GateDB_Cris].[dbo].[gate] 
									on 
											  Table1.documentID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
			)Table2					 
			where calendardate between '01-MAR-2015' and '31-AUG-2015'
)Table3
group by c1
)AppetiteCurrentCount
 on 
 Table1.a = AppetiteCurrentCount.c1
		
-------------------------------------------------------------------------------------------------
  --Count of Past appetite
left join
(
select c1,
	   COUNT(match) as appetitecountpast
from 
			(
			select *
			from 
			(
									select Table1.BrcId as c1,
										   match,
										   documentID,
										   Table1.src_col,
										   Table1.src_table,
										   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate  
									from 
															(
															select BrcId,
															keyObservation1, 
															match, 
															cn_doc_id as documentID, 
															src_table,
															src_col 
															from [GateDB_Cris].[dbo].[gate_hunter_appetite_306]
															where mlObservation1 = 'negative'
															)Table1											
									inner join
											  [GateDB_Cris].[dbo].[gate] 
									on 
											  Table1.documentID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
			)Table2					 
			where calendardate between '01-MAR-2014' and '01-MAR-2015'
)Table3
group by c1
)AppetitePastCount

 on 
 
 Table1.a = AppetitePastCount.c1
--------------------------------------------------------------------------------------
-- social withdrawal symptoms current
left join
(
select  distinct(g1)
from 
(
SELECT [GateDB_Cris].[dbo].[gate_hunter_socialwithdraw_306].BrcId as g1, 
	   [GateDB_Cris].[dbo].[gate_hunter_socialwithdraw_306].CN_Doc_ID as documentID,
	   match,
	   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate,
	   mlObservation1
  FROM [GateDB_Cris].[dbo].[gate_hunter_socialwithdraw_306]
left join
[GateDB_Cris].[dbo].[gate]
 on [GateDB_Cris].[dbo].[gate_hunter_socialwithdraw_306].CN_Doc_ID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
 )Table1 
 where calendardate between '01-MAR-2015' and '31-AUG-2015' and mlObservation1 = 'positive'
 )SocWitRecent
 on 
 Table1.a = SocWitRecent.g1
 ----------------------------------------------------------------------
 --Past 12 months social withdrawal
left join
(
select distinct(h1)
from 
(
SELECT [GateDB_Cris].[dbo].[gate_hunter_socialwithdraw_306].BrcId as h1, 
	   [GateDB_Cris].[dbo].[gate_hunter_socialwithdraw_306].CN_Doc_ID as documentID,
	  match,
	   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate,
	   mlObservation1
  FROM [GateDB_Cris].[dbo].[gate_hunter_socialwithdraw_306]
left join
[GateDB_Cris].[dbo].[gate]
 on [GateDB_Cris].[dbo].[gate_hunter_socialwithdraw_306].CN_Doc_ID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
 )Table1 
 where calendardate between '01-MAR-2014' and '01-MAR-2015' and mlObservation1 = 'positive'
 )SocWitPast
 on 
 Table1.a = SocWitPast.h1
 -----------------------------------------------------------------------------------------------
  --Count of Social Withdrawal
left join
(
select c1,
	   COUNT(match) as socwithcountcurrent   
from 
			(
			select *
			from 
			(
									select Table1.BrcId as c1,
										   match,
										   documentID,
										   Table1.src_col,
										   Table1.src_table,
										   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate    
									from 
															(
															select BrcId,
															keyObservation1, 
															match, 
															cn_doc_id as documentID, 
															src_table,
															src_col 
															from [GateDB_Cris].[dbo].[gate_hunter_socialwithdraw_306]
															where mlObservation1 = 'positive'
															)Table1											
									inner join
											  [GateDB_Cris].[dbo].[gate] 
									on 
											  Table1.documentID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
			)Table2					 
			where calendardate between '01-MAR-2015' and '31-AUG-2015'
)Table3
group by c1
)SocWitCurrentCount
 on 
 Table1.a = SocWitCurrentCount.c1
		
-------------------------------------------------------------------------------------------------
  --Count of Past social withdrawal
left join
(
select c1,
	   COUNT(match) as socwitcountpast
from 
			(
			select *
			from 
			(
									select Table1.BrcId as c1,
										   match,
										   documentID,
										   Table1.src_col,
										   Table1.src_table,
										   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate  
									from 
															(
															select BrcId,
															keyObservation1, 
															match, 
															cn_doc_id as documentID, 
															src_table,
															src_col 
															from [GateDB_Cris].[dbo].[gate_hunter_socialwithdraw_306]
															where mlObservation1 = 'positive'
															)Table1											
									inner join
											  [GateDB_Cris].[dbo].[gate] 
									on 
											  Table1.documentID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
			)Table2					 
			where calendardate between '01-MAR-2014' and '01-MAR-2015'
)Table3
group by c1
)SocialWithdrawalPastCount

 on 
 
 Table1.a = SocialWithdrawalPastCount.c1
 -----------------------------------------------------------------------------------------------------
-- concentration current

left join
(
select  distinct(i1)
from 
(
SELECT [GateDB_Cris].[dbo].[gate_hunter_concentration306].BrcId as i1, 
	   [GateDB_Cris].[dbo].[gate_hunter_concentration306].CN_Doc_ID as documentID,
	   match,
	   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate,
	   mlObservation1
  FROM [GateDB_Cris].[dbo].[gate_hunter_concentration306]
left join
[GateDB_Cris].[dbo].[gate]
 on [GateDB_Cris].[dbo].[gate_hunter_concentration306].CN_Doc_ID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
 )Table1 
 where calendardate between '01-MAR-2015' and '31-AUG-2015' and mlObservation1 = 'positive'
 )concentrationRecent
 on 
 Table1.a = concentrationRecent.i1
 ----------------------------------------------------------------------
 --Past 12 months low concentration
left join
(
select distinct(j1)
from 
(
SELECT [GateDB_Cris].[dbo].[gate_hunter_concentration306].BrcId as j1, 
	   [GateDB_Cris].[dbo].[gate_hunter_concentration306].CN_Doc_ID as documentID,
	  match,
	   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate,
	   mlObservation1
  FROM [GateDB_Cris].[dbo].[gate_hunter_concentration306]
left join
[GateDB_Cris].[dbo].[gate]
 on [GateDB_Cris].[dbo].[gate_hunter_concentration306].CN_Doc_ID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
 )Table1 
 where calendardate between '01-MAR-2014' and '01-MAR-2015' and mlObservation1 = 'positive'
 )concentrationPast
 on 
 Table1.a = concentrationPast.j1
 -----------------------------------------------------------------------------------------------
  --Count of low concentration
left join
(
select c1,
	   COUNT(match) as concentrationhcountcurrent   
from 
			(
			select *
			from 
			(
									select Table1.BrcId as c1,
										   match,
										   documentID,
										   Table1.src_col,
										   Table1.src_table,
										   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate    
									from 
															(
															select BrcId,
															keyObservation1, 
															match, 
															cn_doc_id as documentID, 
															src_table,
															src_col 
															from [GateDB_Cris].[dbo].[gate_hunter_concentration306]
															where mlObservation1 = 'positive'
															)Table1											
									inner join
											  [GateDB_Cris].[dbo].[gate] 
									on 
											  Table1.documentID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
			)Table2					 
			where calendardate between '01-MAR-2015' and '31-AUG-2015'
)Table3
group by c1
)concentrationCurrentCount
 on 
 Table1.a = concentrationCurrentCount.c1
		
-------------------------------------------------------------------------------------------------
  --Count of Past low concentration
left join
(
select c1,
	   COUNT(match) as concentrationcountpast
from 
			(
			select *
			from 
			(
									select Table1.BrcId as c1,
										   match,
										   documentID,
										   Table1.src_col,
										   Table1.src_table,
										   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate  
									from 
															(
															select BrcId,
															keyObservation1, 
															match, 
															cn_doc_id as documentID, 
															src_table,
															src_col 
															from [GateDB_Cris].[dbo].[gate_hunter_concentration306]
															where mlObservation1 = 'positive'
															)Table1											
									inner join
											  [GateDB_Cris].[dbo].[gate] 
									on 
											  Table1.documentID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
			)Table2					 
			where calendardate between '01-MAR-2014' and '01-MAR-2015'
)Table3
group by c1
)concentrationPastCount

 on 
 
 Table1.a = concentrationPastCount.c1
 -----------------------------------------------------------------------------------------------------
-- irritable current


left join
(
select  distinct(k1)
from 
(
SELECT [GateDB_Cris].[dbo].[gate_hunter_irritable306].BrcId as k1, 
	   [GateDB_Cris].[dbo].[gate_hunter_irritable306].CN_Doc_ID as documentID,
	   match,
	   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate,
	   mlObservation1
  FROM [GateDB_Cris].[dbo].[gate_hunter_irritable306]
left join
[GateDB_Cris].[dbo].[gate]
 on [GateDB_Cris].[dbo].[gate_hunter_irritable306].CN_Doc_ID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
 )Table1 
 where calendardate between '01-MAR-2015' and '31-AUG-2015'
 )IrritableRecent
 on 
 Table1.a = IrritableRecent.k1
 ----------------------------------------------------------------------
 --Past 12 months irritable
left join
(
select distinct(l1)
from 
(
SELECT [GateDB_Cris].[dbo].[gate_hunter_irritable306].BrcId as l1, 
	   [GateDB_Cris].[dbo].[gate_hunter_irritable306].CN_Doc_ID as documentID,
	  match,
	   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate,
	   mlObservation1
  FROM [GateDB_Cris].[dbo].[gate_hunter_irritable306]
left join
[GateDB_Cris].[dbo].[gate]
 on [GateDB_Cris].[dbo].[gate_hunter_irritable306].CN_Doc_ID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
 )Table1 
 where calendardate between '01-MAR-2014' and '01-MAR-2015'
 )IrritablePast
 on 
 Table1.a = IrritablePast.l1
 -----------------------------------------------------------------------------------------------
  --Count of irritability
left join
(
select c1,
	   COUNT(match) as irritablehcountcurrent   
from 
			(
			select *
			from 
			(
									select Table1.BrcId as c1,
										   match,
										   documentID,
										   Table1.src_col,
										   Table1.src_table,
										   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate    
									from 
															(
															select BrcId,
															keyObservation1, 
															match, 
															cn_doc_id as documentID, 
															src_table,
															src_col 
															from [GateDB_Cris].[dbo].[gate_hunter_irritable306]
															where mlObservation1 = 'positive'
															)Table1											
									inner join
											  [GateDB_Cris].[dbo].[gate] 
									on 
											  Table1.documentID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
			)Table2					 
			where calendardate between '01-MAR-2015' and '31-AUG-2015'
)Table3
group by c1
)IrritableCurrentCount
 on 
 Table1.a = IrritableCurrentCount.c1
 
-------------------------------------------------------------------------------------------------
  --Count of Past irritability
left join
(
select c1,
	   COUNT(match) as irritabilitycountpast
from 
			(
			select *
			from 
			(
									select Table1.BrcId as c1,
										   match,
										   documentID,
										   Table1.src_col,
										   Table1.src_table,
										   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate  
									from 
															(
															select BrcId,
															keyObservation1, 
															match, 
															cn_doc_id as documentID, 
															src_table,
															src_col 
															from [GateDB_Cris].[dbo].[gate_hunter_irritable306]
															where mlObservation1 = 'positive'
															)Table1											
									inner join
											  [GateDB_Cris].[dbo].[gate] 
									on 
											  Table1.documentID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
			)Table2					 
			where calendardate between '01-MAR-2014' and '01-MAR-2015'
)Table3
group by c1
)IrritablePastCount

 on 
 
 Table1.a = IrritablePastCount.c1
------------------------------------------------------------------------------------------------------
 -- helpless current

left join
(
select  distinct(q1)
from 
(
SELECT [GateDB_Cris].[dbo].[gate_hunter_helpless306].BrcId as q1, 
	   [GateDB_Cris].[dbo].[gate_hunter_helpless306].CN_Doc_ID as documentID,
	   match,
	   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate,
	   mlObservation1
  FROM [GateDB_Cris].[dbo].[gate_hunter_helpless306]
left join
[GateDB_Cris].[dbo].[gate]
 on [GateDB_Cris].[dbo].[gate_hunter_helpless306].CN_Doc_ID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
 )Table1 
 where calendardate between '01-MAR-2015' and '31-AUG-2015' and mlObservation1 = 'positive'
 )helplessRecent
 on 
 Table1.a = helplessRecent.q1
 ----------------------------------------------------------------------
 --Past 12 months helpless
left join
(
select distinct(r1)
from 
(
SELECT [GateDB_Cris].[dbo].[gate_hunter_helpless306].BrcId as r1, 
	   [GateDB_Cris].[dbo].[gate_hunter_helpless306].CN_Doc_ID as documentID,
	  match,
	   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate,
	   mlObservation1
  FROM [GateDB_Cris].[dbo].[gate_hunter_helpless306]
left join
[GateDB_Cris].[dbo].[gate]
 on [GateDB_Cris].[dbo].[gate_hunter_helpless306].CN_Doc_ID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
 )Table1 
 where calendardate between '01-MAR-2014' and '01-MAR-2015' and mlObservation1 = 'positive'
 )helplessPast
 on 
 Table1.a = helplessPast.r1
 -----------------------------------------------------------------------------------------------
  --Count of helpless
left join
(
select c1,
	   COUNT(match) as helplesshcountcurrent   
from 
			(
			select *
			from 
			(
									select Table1.BrcId as c1,
										   match,
										   documentID,
										   Table1.src_col,
										   Table1.src_table,
										   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate    
									from 
															(
															select BrcId,
															keyObservation1, 
															match, 
															cn_doc_id as documentID, 
															src_table,
															src_col 
															from [GateDB_Cris].[dbo].[gate_hunter_helpless306]
															where mlObservation1 = 'positive'
															)Table1											
									inner join
											  [GateDB_Cris].[dbo].[gate] 
									on 
											  Table1.documentID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
			)Table2					 
			where calendardate between '01-MAR-2015' and '31-AUG-2015'
)Table3
group by c1
)helplessCurrentCount
 on 
 Table1.a = helplessCurrentCount.c1
		
-------------------------------------------------------------------------------------------------
  --Count of Past helpless
left join
(
select c1,
	   COUNT(match) as helplesscountpast
from 
			(
			select *
			from 
			(
									select Table1.BrcId as c1,
										   match,
										   documentID,
										   Table1.src_col,
										   Table1.src_table,
										   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate  
									from 
															(
															select BrcId,
															keyObservation1, 
															match, 
															cn_doc_id as documentID, 
															src_table,
															src_col 
															from [GateDB_Cris].[dbo].[gate_hunter_helpless306]
															where mlObservation1 = 'positive'
															)Table1											
									inner join
											  [GateDB_Cris].[dbo].[gate] 
									on 
											  Table1.documentID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
			)Table2					 
			where calendardate between '01-MAR-2014' and '01-MAR-2015'
)Table3
group by c1
)helplessPastCount

 on 
 
 Table1.a = helplessPastCount.c1
 -----------------------------------------------------------------------------------------------------

-- LowMood current

left join
(
select  distinct(q1)
from 
(
SELECT [GateDB_Cris].[dbo].[gate_hunter_low_mood_306].BrcId as q1, 
	   [GateDB_Cris].[dbo].[gate_hunter_low_mood_306].CN_Doc_ID as documentID,
	   match,
	   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate,
	   mlObservation1
  FROM [GateDB_Cris].[dbo].[gate_hunter_low_mood_306]
left join
[GateDB_Cris].[dbo].[gate]
 on [GateDB_Cris].[dbo].[gate_hunter_low_mood_306].CN_Doc_ID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
 )Table1 
 where calendardate between '01-MAR-2015' and '31-AUG-2015' and mlObservation1 = 'positive'
 )LowMoodRecent
 on 
 Table1.a = LowMoodRecent.q1
 ----------------------------------------------------------------------
 --Past 12 months LowMood
left join
(
select distinct(r1)
from 
(
SELECT [GateDB_Cris].[dbo].[gate_hunter_low_mood_306].BrcId as r1, 
	   [GateDB_Cris].[dbo].[gate_hunter_low_mood_306].CN_Doc_ID as documentID,
	  match,
	   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate,
	   mlObservation1
  FROM [GateDB_Cris].[dbo].[gate_hunter_low_mood_306]
left join
[GateDB_Cris].[dbo].[gate]
 on [GateDB_Cris].[dbo].[gate_hunter_low_mood_306].CN_Doc_ID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
 )Table1 
 where calendardate between '01-MAR-2014' and '30-APR-2015' and mlObservation1 = 'positive'
 )LowMoodPast
 on 
 Table1.a = LowMoodPast.r1
 -----------------------------------------------------------------------------------------------
  --Count of LowMood
left join
(
select c1,
	   COUNT(match) as LowMoodhcountcurrent   
from 
			(
			select *
			from 
			(
									select Table1.BrcId as c1,
										   match,
										   documentID,
										   Table1.src_col,
										   Table1.src_table,
										   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate    
									from 
															(
															select BrcId,
															keyObservation1, 
															match, 
															cn_doc_id as documentID, 
															src_table,
															src_col 
															from [GateDB_Cris].[dbo].[gate_hunter_low_mood_306]
															where mlObservation1 = 'positive'
															)Table1											
									inner join
											  [GateDB_Cris].[dbo].[gate] 
									on 
											  Table1.documentID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
			)Table2					 
			where calendardate between '01-MAR-2015' and '31-AUG-2015'
)Table3
group by c1
)LowMoodCurrentCount
 on 
 Table1.a = LowMoodCurrentCount.c1
		
-------------------------------------------------------------------------------------------------
  --Count of Past LowMood
left join
(
select c1,
	   COUNT(match) as LowMoodcountpast
from 
			(
			select *
			from 
			(
									select Table1.BrcId as c1,
										   match,
										   documentID,
										   Table1.src_col,
										   Table1.src_table,
										   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate  
									from 
															(
															select BrcId,
															keyObservation1, 
															match, 
															cn_doc_id as documentID, 
															src_table,
															src_col 
															from [GateDB_Cris].[dbo].[gate_hunter_low_mood_306]
															where mlObservation1 = 'positive'
															)Table1											
									inner join
											  [GateDB_Cris].[dbo].[gate] 
									on 
											  Table1.documentID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
			)Table2					 
			where calendardate between '01-MAR-2014' and '30-APR-2015'
)Table3
group by c1
)LowMoodPastCount

 on 
 
 Table1.a = LowMoodPastCount.c1
 -----------------------------------------------------------------------------------------------------
--joining number of spell data, for the patients who have a face to face contact between 1st mar 2015 and 31st 
-- dec 2015 to get hteir closest spell date to start of observation period. 

left join

(
select *

from 

(
select Spell_Number,
brcid,
Accepted_Date,
Discharge_Date,
RANK () OVER (PARTITION BY TableTesting.brcid 
				ORDER BY (ABS(DATEDIFF(DD,'01-MAR-2015',TableTesting.Accepted_Date))) ASC, TableTesting.CN_Doc_ID) as Ranking

from

(
select 
SQLCRIS.DBO.Event.brcid, 
SQLCRIS.DBO.Event.CN_Doc_ID,
SQLCRIS.DBO.Event.Start_Date, 
Referral.Spell_Number, 
Referral.Accepted_Date,
Referral.Discharge_Date
from SQLCRIS.DBO.Event

left join

SQLCRIS.DBO.Referral

on Event.brcid = Referral.BrcId

where   (EVENT.Start_Date BETWEEN '01-MAR-2015' and '31-AUG-2015')
		AND
		(eVENT.Event_Type_Of_Contact_ID LIKE '%face%')

)TableTesting
) TableTesting2
where Ranking = 1
) SpellTable

on 

Table1.a = SpellTable.BrcId  
-----------------------------------------------------------------------------------------------------


--joining number of spell data, for the patients who have a face to face contact between 1st mar 2015 and 31st 
-- dec 2015 to get hteir closest spell date to start of observation period. 

left join

(
select *

from 

(
select Spell_Number as SpellNumber2,
brcid ,
Accepted_Date as Accepted_Date2,
Discharge_Date as Discharge_Date2,
RANK () OVER (PARTITION BY TableTesting.brcid 
				ORDER BY (ABS(DATEDIFF(DD,'01-MAR-2015',TableTesting.Accepted_Date))) ASC, TableTesting.CN_Doc_ID) as Ranking

from

(
select 
SQLCRIS.DBO.Event.brcid, 
SQLCRIS.DBO.Event.CN_Doc_ID,
SQLCRIS.DBO.Event.Start_Date, 
Referral.Spell_Number, 
Referral.Accepted_Date,
Referral.Discharge_Date
from SQLCRIS.DBO.Event

left join

SQLCRIS.DBO.Referral

on Event.brcid = Referral.BrcId

where   (EVENT.Start_Date BETWEEN '01-MAR-2015' and '31-AUG-2015')
		AND
		(eVENT.Event_Type_Of_Contact_ID LIKE '%face%')

)TableTesting
) TableTesting2_AnotherReferral
where Ranking = 2
) SpellTable2

on 

Table1.a = SpellTable2.BrcId  

-------------------------------------------------------------------------------

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
BrcId as HoNOSBrcid,
CN_Doc_ID
 

from 

(
select *

from 

(

select 
(ABS(DATEDIFF(DD,'01-MAR-2015',Rating_Date)))DaysSinceRecentHonos
, RANK () OVER (PARTITION BY BRCID ORDER BY (ABS(DATEDIFF(DD,'01-MAR-2015',Rating_Date)) ) ASC, cn_doc_id ) as RankedHonos
,*
from SQLCRIS.DBO.HoNOS

)HonosClosesttoStartofSnapshot

where RankedHONOS ='1'

) TableHonos

)Honos

on Table1.a = Honos.HoNOSBrcid
-------------------------------------------------------------------------------------------------------------------
-- no data update in 2015, so just selecting compliant behaviour in the past year 2014. 
-- confirmed with Craig, on how to use compliance app. Every positive indicates "non compliance"
left join

(
	select  brcid as noncompliancebrcid
	  , count (match) as noncompliant 
	  from
				(
				select * from 

									(
									select 
											BrcId
											, CONVERT(datetime,[SQLCrisImport].[dbo].[tbl_gate_hunter_compliance].document_date,103) as AdherenceMentionDocDate
											, match
											, mlObservation1 
									 from 

									[SQLCrisImport].[dbo].[tbl_gate_hunter_compliance]
									) Table1
				where 
				Table1.AdherenceMentionDocDate between '01-MAR-2014' and '30-APR-2015'
				) Table2
where mlObservation1 like 'positive'
group by BrcId
) 
 as NonComplianceIndicator

on Table1.a = NonComplianceIndicator.noncompliancebrcid

-------------------------------------------------------------------------------------------------------
-- Current Psychotherapy session, binary indicator of 
-- whether patient is attending psychotherapy during observation period
-- Craig suggested using Session Date in the SQLCRISIMPORT.dbo.tbl_cbt_combined_current

left join
(
		select * 
		from 
			(
				SELECT brcid as PTBrcid
					 , Session_Date
					 , SessionNumber as SessionNumber
					 , Rank () over (Partition by brcid order by PsychoTherapyIndicator.cn_doc_id DESC ) as ranking
				FROM
							(
									select brcid
										 --, CONVERT(datetime,SQLCRISIMPORT.dbo.vw_cbt_combined.Session_Date,103) as PTMentionDate
										 , Session_Date 
										 , Session_n as SessionNumber
										 , CN_DOC_ID
									from   SQLCRISIMPORT.dbo.tbl_cbt_combined_current
									where Session_Date between '01-MAR-2015' and '31-AUG-2015'
							)as PsychoTherapyIndicator
			) PsychoTherapyIndicator2
		where PsychoTherapyIndicator2.ranking = '1'
)	as CurrentPTIndicator

on Table1.a = CurrentPTIndicator.PTBrcid 
-------------------------------------------------------------------------------------------------------
-- Past 12 months Psychotherapy session, binary indicator of whether patient is attending psychotherapy during observation period
left join
(
		select * 
		from 
			(
				SELECT brcid as PTBrcidPast
					 , Session_Date
					 , SessionNumber as SessionNumberforPastPT
					 , Rank () over (Partition by brcid order by PsychoTherapyIndicator.cn_doc_id DESC ) as ranking
				FROM
							(
									select brcid
										 --, CONVERT(datetime,SQLCRISIMPORT.dbo.vw_cbt_combined.Session_Date,103) as PTMentionDate
										 , Session_Date 
										 , Session_n as SessionNumber
										 , CN_DOC_ID
									from   SQLCRISIMPORT.dbo.tbl_cbt_combined_current
									where Session_Date between '01-MAR-2014' and '30-APR-2015'
							)as PsychoTherapyIndicator
			) PsychoTherapyIndicator2
		where PsychoTherapyIndicator2.ranking = '1'
)	as PastPTIndicator

on Table1.a = PastPTIndicator.PTBrcidPast 

---------------------------------------------------------------------------------------------------------------------------
-- Past AntiPsychotic Flag - binary indicator of patient on antipsychotics before the observation period.
left join

(
select * 
from 
(
select distinct brcid as APsychBrcidPast
     , [SQLCRIS_User].[dbo].[andreamedicationtable].drug  as AntiPsychoticFlagPast
     , [SQLCRIS_User].[dbo].[andreamedicationtable].start_date as AntiPsychoticDatePast
     , Rank () over (Partition by brcid order by [SQLCRIS_User].[dbo].[andreamedicationtable].id DESC ) as ranking
FROM [SQLCRIS_User].[dbo].[andreamedicationtable]
where 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%chlorpromazin%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%largactil%')) or  
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%levomepromazin%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%methotrimeprazin%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%nozinan%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%promazin%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%pericyazin%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%periciazin%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%neulactil%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%pipotiazin%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%fluphenazin%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%perphenazin%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%fentazin%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%prochlorperazin%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%trifluoperazin%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%stelazin%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%benperidol%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%haloperidol%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%dozic%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%haldol%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%serenace%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%pimozid%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%orap%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%flupentixol%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%fluphenazin%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%modecat%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%depixol%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%zuclopenthixol%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%clopixol%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%sulpirid%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%dolmatil%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%sulpor%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%amisulpride%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%solian%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%clozapin%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%clozaril%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%denzapine%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%zaponex%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%olanzapin%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%zyprexa%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%quetiapin%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%seroquel%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%risperid%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%sertindol%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%serdolect%')) or  
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%zotepin%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%zoleptil%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%aripiprazol%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%abilify%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%paliperidone%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%invega%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%pipotiazin%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%pipothiazin%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%piportil%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%zuclopenthixol%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%clopixol%'))
) as AntiPsychoticIndication
where AntiPsychoticIndication.ranking = '1'
) as AntiPsychoticSnapshotPast


on Table1.a = AntiPsychoticSnapshotPast.APsychBrcidPast 
---------------------------------------------------------------------------------------------------------------------------
-- Current AntiPsychotic Flag - binary indicator of patient on antipsychotics during the observation period.
left join

(
select * 
from 
(
select distinct brcid as APsychBrcid
     , [SQLCRIS_User].[dbo].[andreamedicationtable].drug  as AntiPsychoticFlag
     , [SQLCRIS_User].[dbo].[andreamedicationtable].start_date as AntiPsychoticDate
     , Rank () over (Partition by brcid order by [SQLCRIS_User].[dbo].[andreamedicationtable].id DESC ) as ranking
FROM [SQLCRIS_User].[dbo].[andreamedicationtable]
where 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%chlorpromazin%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%largactil%')) or  
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%levomepromazin%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%methotrimeprazin%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%nozinan%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%promazin%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%pericyazin%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%periciazin%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%neulactil%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%pipotiazin%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%fluphenazin%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%perphenazin%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%fentazin%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%prochlorperazin%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%trifluoperazin%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%stelazin%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%benperidol%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%haloperidol%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%dozic%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%haldol%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%serenace%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%pimozid%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%orap%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%flupentixol%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%fluphenazin%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%modecat%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%depixol%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%zuclopenthixol%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%clopixol%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%sulpirid%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%dolmatil%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%sulpor%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%amisulpride%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%solian%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%clozapin%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%clozaril%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%denzapine%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%zaponex%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%olanzapin%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%zyprexa%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%quetiapin%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%seroquel%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%risperid%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%sertindol%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%serdolect%')) or  
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%zotepin%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%zoleptil%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%aripiprazol%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%abilify%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%paliperidone%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%invega%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%pipotiazin%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%pipothiazin%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%piportil%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%zuclopenthixol%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%clopixol%'))
) as AntiPsychoticIndication
where AntiPsychoticIndication.ranking = '1'
) as AntiPsychoticSnapshot


on Table1.a = AntiPsychoticSnapshot.APsychBrcid 

--- 700 PEOPLE ON ANTIPSYCHOTICS IN THE PAST. 1/3/14-1/3/15
--- 2 people on antidpyshcotics in the current time frame 1/3/15 - 31/8/15

---------------------------------------------------------------------------------------------------------------------------

-- Current benzodiapine Flag - binary indicator of patient on benzodiazapines during the observation period.
left join

(
select * 
from 
(
select distinct brcid as BenzoBrcid
     , [SQLCRIS_User].[dbo].[andreamedicationtable].drug  as BenzoFlag
     , [SQLCRIS_User].[dbo].[andreamedicationtable].start_date as BenzoDate
     , Rank () over (Partition by brcid order by [SQLCRIS_User].[dbo].[andreamedicationtable].id DESC ) as ranking
FROM [SQLCRIS_User].[dbo].[andreamedicationtable]
where 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%quazepam%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%doral%')) or  
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%niravam%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%alprazolam%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%prosom%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%estazolam%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%dalmane%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%flurazepam%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%diazepam%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%xanax%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%librium%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%chlordiazepoxide%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%tranxene%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%clorazepate%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%klonopin%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%clonazepam%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%serax%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%oxazepam%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%valium%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%diastat%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%ativan%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%lorazepam%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%halcion%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%triazolam%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%restoril%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%temazepam%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%versed%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%midazolam%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%onfi%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%clobazam%'))
) as BenzoIndication
where BenzoIndication.ranking = '1'
) 
as BenzoSnapshot


on Table1.a = BenzoSnapshot.BenzoBrcid 

---------------------------------------------------------------------------------------------------------------------------
-- Past benzodiapine Flag 
left join

(
select * 
from 
(
select distinct brcid as BenzoPastBrcid
     , [SQLCRIS_User].[dbo].[andreamedicationtable].drug  as BenzoPastFlag
     , [SQLCRIS_User].[dbo].[andreamedicationtable].start_date as BenzoPastDate
     , Rank () over (Partition by brcid order by [SQLCRIS_User].[dbo].[andreamedicationtable].id DESC ) as ranking
FROM [SQLCRIS_User].[dbo].[andreamedicationtable]
where 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%quazepam%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%doral%')) or  
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%niravam%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%alprazolam%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%prosom%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%estazolam%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%dalmane%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%flurazepam%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%diazepam%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%xanax%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%librium%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%chlordiazepoxide%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%tranxene%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%clorazepate%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%klonopin%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%clonazepam%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%serax%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%oxazepam%')) or
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%valium%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%diastat%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%ativan%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%lorazepam%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%halcion%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%triazolam%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%restoril%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%temazepam%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%versed%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%midazolam%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%onfi%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date between '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%clobazam%'))
) as BenzoIndication
where BenzoIndication.ranking = '1'
) 
as BenzoPastSnapshot


on Table1.a = BenzoPastSnapshot.BenzoPastBrcid 
---------------------------------------------------------------------------------------------------------------
--  - binary indicator of patient on lithium during the observation period.

left join

(
select * 
from 
(
select distinct brcid as LithiumBrcId
     , [SQLCRIS_User].[dbo].[andreamedicationtable].drug  as CurrentLithium
     , [SQLCRIS_User].[dbo].[andreamedicationtable].start_date as CurrentLithiumdate
     , Rank () over (Partition by brcid order by [SQLCRIS_User].[dbo].[andreamedicationtable].id DESC) as ranking
FROM [SQLCRIS_User].[dbo].[andreamedicationtable]
where 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date BETWEEN '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%lithium%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date BETWEEN '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%camcolit%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date BETWEEN '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%liskonum%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date BETWEEN '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%li-liquid%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date BETWEEN '01-MAR-2015' and '31-AUG-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%priadel%')) 

) as CurrentLithiumIndication
where CurrentLithiumIndication.ranking = '1'
) 
as CurrentLithium


on Table1.a = CurrentLithium.LithiumBrcId 

---------------------------------------------------------------------------------------------------------------
--  - binary indicator of patient on lithium before the observation period.
left join

(
select * 
from 
(
select distinct brcid as LithiumBrcIdPast
     , [SQLCRIS_User].[dbo].[andreamedicationtable].drug  as PastLithium
     , [SQLCRIS_User].[dbo].[andreamedicationtable].start_date as PastLithiumdate
     , Rank () over (Partition by brcid order by [SQLCRIS_User].[dbo].[andreamedicationtable].id DESC) as ranking
FROM [SQLCRIS_User].[dbo].[andreamedicationtable]
where 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date BETWEEN '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%lithium%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date BETWEEN '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%camcolit%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date BETWEEN '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%liskonum%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date BETWEEN '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%li-liquid%')) or 
(([SQLCRIS_User].[dbo].[andreamedicationtable].start_date BETWEEN '01-MAR-2014' and '30-APR-2015') and ([SQLCRIS_User].[dbo].[andreamedicationtable].drug like '%priadel%')) 

) as PastLithiumIndication
where PastLithiumIndication.ranking = '1'
) 
as PastLithium


on Table1.a = PastLithium.LithiumBrcIdPast 




------------------------------------------------------------------------------------------------------
-- Past AD use

left join

(
select * 
from 
(
select distinct brcid as PastADBrcid
     , [SQLCRIS_User].[dbo].[andreamedicationtable].drug  as PastAD
     , [SQLCRIS_User].[dbo].[andreamedicationtable].start_date as PastADdate
     , Rank () over (Partition by brcid order by [SQLCRIS_User].[dbo].[andreamedicationtable].id DESC) as ranking
FROM [SQLCRIS_User].[dbo].[andreamedicationtable]
where 

([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  AND drug like '%tca%') or 
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%tricyclic%') or 
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%amitriptyline%') or 
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%vanatrip%') or 
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%elavil%') or 
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%endep%') or  --frOM drugs.COm 
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and DRuG LIKE '%triptaf%')  or --COnTAInS AMItRIpTyLINe AnD PErPHEnAZInE 
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%clomipramin%') or
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%anafranil%') or
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%dosulepin%') or 
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%dothiepin%') or --PreViOuSLy KnoWN As DoTHIEPIN 
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%prothiden%') or
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and	drug like '%prothiaden%') or
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%doxepin%') or
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%sinepin%') or
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%sineq%')  or --FroM drug.SCOm 
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and	drug like '%xepin%') or --FRom DRUGS.CoM
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%imipramine%') or  
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%tofranil%') or -- FroM DrUGS.coM
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%lofepramine%') or 
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and	drug like '%lomont%') or -- FroM DrUGS.coM
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%nortriptyli%') or
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%pamelo%') or
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%allegr%') or
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%aventyl%') or
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%trimipram%') or
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%surmonti%') or
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%mianserin%') or
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%trazodone%') or
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%molipaxin%') or
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and	drug like '%phenelzine%') or
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%phenylethylhydrazine%') or
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%alazin%') or
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%nardil%')  or
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%isocarboxazid%')  or
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%tranylcypromin%') or
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%moclobemide%') or
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%manerix%') or
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and Drug like 'citalopram%') or
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%cipramil%') or
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%celexa%') or
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%escitalopram%') or
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%cipralex%') or
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%lexapro%') or
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%fluoxetine%') or
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%prozac%') or
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%sarafem%') or
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%bellzac%') or --from drugs.com; used in Ireland
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%oxactin%') or --from drugs.com; drug company: Discovery
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%fluvoxamine%') or 
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%faverin%') or 
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like'%paroxetin%' ) or
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%paxil%') or  --from drugs.com; not specified for UK use but used in US
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%seroxat%' ) or
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%sertra%' ) or 
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%bellsert%') or  --from drugs.com; used in Ireland
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%lustral%' ) or
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%seretra%' ) or --from drugs.com; used in Ireland   
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%zoloft%') or   -- from drugs.come; not specified for UK but used in US
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%mirtazapin%') or
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%zispin%' ) or 
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%mirza%') or 
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%reboxet%' ) or 
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%reboxat%') or 
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%edronax%') or 
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%venlafaxine%' ) or 
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%effexor%') or 
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%efexor%') or 
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%agomelatin%' ) or 
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%valdoxan%' ) or 
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%duloxetin%' ) or 
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%cymbalta%' ) or 
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%yentreve%' ) or 
--([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%flupentixol%' ) or
--([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%fluanxol%' ) or
--([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%depixol%' ) or
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%tryptophan%' ) or
([SQLCRIS_User].[dbo].[andreamedicationtable].start_date < '01-MAR-2015'  and drug like '%optimax%' ) 

) as PastADIndication
where PastADIndication.ranking = '1'
) 
as PastAD


on Table1.a = PastAD.PastADBrcid
-----------------------------------------------------------------------------------------------------


)TableEntireCohort

left join 

(
select DISTINCT(LSOA11_1) as UNIQUELSOA, imd_score
from
(
select LSOA11 AS LSOA11_1, 
	   [SQLCrisImport].[dbo].[address_ons_2010_imd].[Index of Multiple Deprivation Score] as imd_score,
	   
RANK () OVER (PARTITION BY BRCID ORDER BY (ABS(DATEDIFF(DD,'01-MAR-2015',Start_Date))) ASC, cn_doc_id ) as AddressClosesttoSnapshot
from [SQLCrisImport].[dbo].[address_ons_2010_imd]
)TableAddress
where AddressClosesttoSnapshot = '1'
)TableAddressClosestToSnapshot

on TableEntireCohort.AddressFormLSOA = TableAddressClosestToSnapshot.UNIQUELSOA



--exemplar Left Join of IMD SCORES AND LSOA-------------------------------------------------------------------------------------
--LEFT JOIN 
--(
--SELECT Distinct LSOA11
--	  ,imd_score
--FROM [SQLCrisImport].[dbo].[address_ons_2011_imd]
--)UCKEDUPLSOA

--ON Table6.LSOAClosestToDiagnosis = UCKEDUPLSOA.LSOA11


)FInAL







--select * 

--from

--(
--select * from SQLCris_User.dbo.Afernandes_Active_Referrals_MAR15_AUG15

--inner join 

--SQLCRIS_User.dbo.AFernandes_DepDiag_bef_MAR15_AUG15
--on SQLCRIS_User.dbo.AFernandes_DepDiag_bef_MAR15_AUG15.a = SQLCris_User.dbo.Afernandes_Active_Referrals_MAR15_AUG15.brcid
--) 
--Table1 


--left join

--(
--SELECT [GateDB_Cris].[dbo].[gate_hunter_hallucination_306].BrcId as b, 
--	   [GateDB_Cris].[dbo].[gate_hunter_hallucination_306].CN_Doc_ID as documentID,
--	   match,
--	   CONVERT(datetime,[GateDB_Cris].[dbo].[gate].[Date],103) as calendardate,
--	   mlObservation1
--  FROM [GateDB_Cris].[dbo].[gate_hunter_hallucination_306]
--left join
--[GateDB_Cris].[dbo].[gate]
-- on [GateDB_Cris].[dbo].[gate_hunter_hallucination_306].CN_Doc_ID = [GateDB_Cris].[dbo].[gate].CN_Doc_ID
--) TestTable 

--on Table1.BRCID = TestTable.b

--where calendardate between '01-MAR-2014' and '01-MAR-2015' and mlObservation1 = 'positive'