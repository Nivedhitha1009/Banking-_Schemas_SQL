use projects;
 select * from finance_1_updated;
select * from finance_2_1;

select count(*) from finance_1;
select count(*) from finance_2_1;
 
 -- Year wise loan amount Stat
 
 select year,loan_status,sum(loan_amnt) as 'loan amount' from finance_1_updated
 group by year,loan_status
 order by year desc; 
 --------------------------------------------------------------------------------------------------------------------
 
-- Grade and sub grade wise revol_bal

select f1.grade,f1.sub_grade,sum(f2.revol_bal) as revol_bal from finance_2_1 as f2
join finance_1_updated as f1 on 
f1.id=f2.id 
Group by f1.grade ,f1.sub_grade
order by f1.grade,f1.sub_grade ;
--------------------------------------------------------------------------------------------------------------------------

-- Total Payment for Verified Status Vs Total Payment for Non Verified Status

select f1.verification_status,round(sum(total_pymnt),0) from finance_2_1 as f2 
join finance_1_updated as f1 on
f1.id=f2.id
where verification_status in('verified','Not verified') group by verification_status 
having sum(total_pymnt);

--------------------------------------------------------------------------------------------------------------------
-- State wise and month wise loan status

select addr_state,month,loan_status,sum(loan_amnt) from finance_1_updated 
group by addr_state,month
order by addr_state,month;

---------------------------------------------------------------------------------------------------------------------
-- Home ownership Vs last payment date stats

select f1.home_ownership,sum(last_pymnt_d) as last_pymnt_d from finance_2_1 as f2
join finance_1_updated as f1
on f1.id=f2.id
group by home_ownership 
having sum(last_pymnt_d);