# SQL_queries_for_Antidepressant_Profiling
SQL queries
--This table defines individuals with f2f activity within obs period, 
--AND depress* diag before start of obs period & 
(
select * from dbo.Afernandes_Active_Referrals_MAR14_AUG14

inner join 

dbo.AFernandes_DepDiag_bef_MAR2014

on dbo.AFernandes_DepDiag_bef_MAR2014.a = dbo.Afernandes_Active_Referrals_MAR14_AUG14.brcid
) 
Table1   



-----------------------------------------------------------------------------------------------
--this joins ADs to our table. 

left join 

SQLCRIS_User.dbo.Afernandes_Antidepressant_MAR14_AUG14

on Table1.a = SQLCRIS_User.dbo.Afernandes_Antidepressant_MAR14_AUG14.PatientonAD
