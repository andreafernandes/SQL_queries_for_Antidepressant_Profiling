select *

from 

(
----------------------------------------------------------------------------------------------
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
--this joins ADs and Demographics to our table. 
left join 

SQLCRIS_User.dbo.Afernandes_Antidepressant_MAR14_AUG14

on Table1.a = SQLCRIS_User.dbo.Afernandes_Antidepressant_MAR14_AUG14.PatientonAD

left join

SQLCRIS.DBO.EPR_Form

ON Table1.a = EPR_Form.BrcId 

) 

where TCA_IMIPRAMINEFlag = '1' AND TCA_NORTRIPTYLINEFlag = '1'

GROUP BY TCA_IMIPRAMINEFlag
--------------------------------------------------------------------------------------

select * 
from [GateDB_Cris].dbo.gate_medication_current
where BrcId = 10003049
 and 
(Document_Date between '01-Mar-2015'  and '31-AUG-2015') or 
(End_Date between '01-Mar-2015'  and '31-AUG-2015'))
