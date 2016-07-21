USE [SQLCRIS_User]
GO

/****** Object:  View [dbo].[AFernandes_Depressive_diagnosis_Snapshot_MAR15_AUG15]    Script Date: 07/21/2016 18:00:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO











ALTER VIEW [dbo].[AFernandes_Depressive_diagnosis_Snapshot_MAR15_AUG15] AS


---This describes individuals (distinct brcids) with a depressive diagnosis, 
---during or before snapshot period of 1st of Jan 2014 to 31st of Dec 2014
--- 31749 IDS in total
with distinct_six_month_depressiondiagnosis_AF as 

(
select 

		ROW_NUMBER() OVER 
		(PARTITION BY SQLCrisImport.dbo.Diagnosis_combined.BRCID 
			ORDER BY   DIAGNOSIS_DATE desc
					 , diagnosis_id DESC
					 , SQLCrisImport.dbo.Diagnosis_combined.diagnosis_id
		) 
		AS LatestDate, --for latest depression diagnosis; closest to 1ST JAN 2014
		   diagnosis_date,
		   primary_diagnosis,
		   diagnosis_id,
		   brcid as a 

FROM 

SQLCrisImport.dbo.Diagnosis_combined 

WHERE
-- these diagnoses were chosen as they were mentioned in the updated NICE guidelines
--"The terminology and diagnostic criteria used for this heterogeneous group of related disorders have changed
--over the years, and the previous guideline related only to those identified by The
--ICD–10 Classification of Mental and Behavioural Disorders (ICD–10) (WHO, 1992)
--as having a depressive episode (F32 in the ICD–10), recurrent depressive episode
--(F33) or mixed anxiety and depressive disorder (F41.2). In this guideline update the
--scope was widened to cover the substantial proportion of people who present with
--less severe forms of depression. Therefore, this updated guideline covers ‘subthreshold
--depressive symptoms’, which fall below the criteria for major depression (and
--which do not have a coding in ICD–10), and subthreshold depressive symptoms
--persisting for at least 2 years (dysthymia; F34.1)."

(
(
--F32: Depressive episode (include with and without psychotic symptoms)
primary_diagnosis like '%F32%'
and 
diagnosis_date <='01-MAR-2015'
)
OR
(
primary_diagnosis like '%depressi%'
and 
diagnosis_date <='01-MAR-2015'
)
OR
(
--recurrent depressive disorder
primary_diagnosis like '%F33%'
and 
diagnosis_date <='01-MAR-2015'
)
OR
(
--Dysthymia; from F34 (Persistent mood disorders family; excluded F34.0 Cyclothymia and F34.8 Other persistent mood, F34.9 Persistent mood disorder)
primary_diagnosis like '%F34.1%'
and 
diagnosis_date <='01-MAR-2015'
) 
OR
(
primary_diagnosis like '%dysthymi%'
and 
diagnosis_date <='01-MAR-2015'
) 
OR
(
-- mixed anxiety and depression; from F41 Other anxiety disorder family; exclued Panic disorder F41.0, GAD F41.1, F41.3 Other mixed anxiety disorders
primary_diagnosis like '%F41.2%'
and 
diagnosis_date <='01-MAR-2015'
)
OR
--http://www.gpcare.org/guidelines/mixedanxdepd.htm
(
primary_diagnosis like '%mixed anxiety and depressi%'
and 
diagnosis_date <='01-MAR-2015'
)
)
)

select *

from distinct_six_month_depressiondiagnosis_AF

WHERE 
(
Latestdate = '1'
)
and 

(
a NOT in
		(
			select BrcId from SQLCrisImport.dbo.Diagnosis_combined
			where 
				(	
				SQLCrisImport.dbo.Diagnosis_combined.primary_diagnosis like '%F0%'and 
				SQLCrisImport.dbo.Diagnosis_combined.diagnosis_date <='31-AUG-2015'
				)
				OR
				(
				SQLCrisImport.dbo.Diagnosis_combined.primary_diagnosis like '%dementia%'and 
				SQLCrisImport.dbo.Diagnosis_combined.diagnosis_date <='31-AUG-2015'
				)
				OR 
				(
				SQLCrisImport.dbo.Diagnosis_combined.primary_diagnosis like '%alzheim%'and 
				SQLCrisImport.dbo.Diagnosis_combined.diagnosis_date <='31-AUG-2015'
				)
				OR
				(
				SQLCrisImport.dbo.Diagnosis_combined.primary_diagnosis like '%delirium%'and 
				SQLCrisImport.dbo.Diagnosis_combined.diagnosis_date <='31-AUG-2015'
				)
				OR  
				(
				SQLCrisImport.dbo.Diagnosis_combined.primary_diagnosis like '%organi%'and 
				SQLCrisImport.dbo.Diagnosis_combined.diagnosis_date <='31-AUG-2015'
				)
				OR 
				(
				SQLCrisImport.dbo.Diagnosis_combined.primary_diagnosis like '%schizo%'and 
				SQLCrisImport.dbo.Diagnosis_combined.diagnosis_date <='31-AUG-2015'
				)
				OR 
				(
				SQLCrisImport.dbo.Diagnosis_combined.primary_diagnosis like 'F2%' and 
				SQLCrisImport.dbo.Diagnosis_combined.diagnosis_date <='31-AUG-2015'
				)
				OR 
				(
				SQLCrisImport.dbo.Diagnosis_combined.primary_diagnosis like 'F31%' and 
				SQLCrisImport.dbo.Diagnosis_combined.diagnosis_date <='31-AUG-2015'
				)
				OR 
				(
				SQLCrisImport.dbo.Diagnosis_combined.primary_diagnosis like '%bipolar%' and 
				SQLCrisImport.dbo.Diagnosis_combined.diagnosis_date <='31-AUG-2015'
				)
		)

)






GO


