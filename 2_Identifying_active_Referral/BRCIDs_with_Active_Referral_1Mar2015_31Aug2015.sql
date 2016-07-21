--Table Flagging Individuals with some active referral OR clinical activity between 
-- 1st Mar 2015 and 31st Aug 2015 
select *

INTO dbo.Afernandes_Active_Referrals_MAR15_AUG15

 from 

(
SELECT 
		Distinct (BRCID)
		
FROM 
		SQLCRIS.DBO.Event

WHERE 
		(EVENT.Start_Date BETWEEN '01-MAR-2015' and '31-AUG-2015')
		AND
		(eVENT.Event_Type_Of_Contact_ID LIKE '%face%')
)TableMonkey

--(35572 row(s) affected)