use bank;

-- 1. Get a rank of districts ordered by the number of customers. 
select
	district.A1 as district_id, count(*) as nb_customers
from
	client
join
	district
on
	client.district_id = district.A1
group by
	district.A1
order by
	nb_customers desc;

    
-- 2. Get a rank of regions ordered by the number of customers.
select 
	district.A3 as region_name, count(*) as nb_customers
from
	client
join 
	district
on 
	client.district_id = district.A1
group by 
	district.A3
order by 
	nb_customers desc;

-- 3. Get the total amount borrowed by the district together with the average loan in that district.
select * from district;
select * from loan;

select district.A2, sum(loan.amount) as borrowed_amount, avg(loan.amount) as avg_loan, count(*) as nb_loans
from district
join client on district.A1 = client.district_id
join loan on client.client_id = loan.account_id
group by district.A2
order by borrowed_amount desc;

-- 4. Get the number of accounts opened by district and year.
select STR_TO_DATE(date, "%y%m%d") from account;

select district.A2, count(*) as nb_accounts, year(STR_TO_DATE(account.date, "%y%m%d")) as year
from district
join account on district.A1 = account.district_id
group by district.A2, year
order by year desc, nb_accounts desc;