-- 1. Basic KPIs
-- - total transfers
select count(transfer_id)as total_transfers
from transfers_history

-- - paid transfers
select count(transfer_id)as paid_tranfers
from transfers_history
where is_free_transfer = 0

-- free transfers
SELECT COUNT(transfer_id) AS free_transfers
FROM transfers_history
WHERE is_free_transfer = 1;

-- - loan transfers
select count(transfer_id)as loan_transfers
from transfers_history
where is_loan = 1

-- - summer vs winter transfers
select sum(case when transfer_window="summer"then 1 else 0 END)as summer_transfers,
sum(case when transfer_window="winter" then 1 else 0 END)as winter_transfers
from transfers_history

-- 2. Transfer Flow
-- - from_country → to_country
select from_country,
    to_country,
    count(transfer_id)as transfers
from transfers_history
group by from_country,to_country
order by transfers DESC
LIMIT 10

-- - from_league → to_league
select from_league,
    to_league,
    count(transfer_id)as transfers
from transfers_history
group by from_league,to_league
order by transfers DESC
LIMIT 10

-- - intra_country vs international
select sum(case when to_country=from_country then 1 ELSE 0 end)as intra_country
from transfers_history

-- - intra_league vs outside league
select sum(case when to_league=from_league then 1 ELSE 0 end)as intra_league
from transfers_history



-- 3. Club Activity
-- - clubs buying most players
select to_club,
    to_country as club_nme,
    count(transfer_id)as total_buying
from transfers_history
group by to_club
order by total_buying DESC

-- clubs selling most players
select from_club,
    to_country as club_nme,
    count(transfer_id)as total_selling
from transfers_history
group by from_club
order by total_selling DESC

-- clubs with highest total spending
select to_club,
    to_country as club_nme,
    sum(fee_eur_m)as total_spending
from transfers_history
group by to_club
order by total_spending DESC

-- clubs with highest total earning
SELECT from_club,
       from_country AS club_country,
       SUM(fee_eur_m) AS total_earning
FROM transfers_history
GROUP BY from_club, from_country
ORDER BY total_earning DESC;


-- 4. Position Analysis
-- - most transferred position
select position,
    count(transfer_id)as transfers
from transfers_history
group by position
order by transfers DESC

-- - highest average fee by position
SELECT position,
    avg(fee_eur_m)as avg_fee
from transfers_history
where is_free_transfer = 0
group by position
order by avg_fee DESC






-- 5. Age Analysis
-- - average transfer age
select avg(age)as avg_age
from transfers_history

-- - age group with most transfers
select age,
    count(*)as total_transfers
from transfers_history
group by age
order by total_transfers DESC

-- - age group with highest fees
select age,
    max(fee_eur_m)as highest_fees
from transfers_history
group by age
order by highest_fees DESC



-- 6. Trend Analysis
-- - transfers by year
SELECT year,
       COUNT(*) AS loan_transfers
FROM transfers_history
WHERE is_loan = 1
GROUP BY year 
ORDER BY loan_transfers DESC;

-- - total fee by year
SELECT year,
       SUM(fee_eur_m) AS total_fee
FROM transfers_history
GROUP BY year
ORDER BY total_fee DESC;


-- - free transfers by year
select year,
    count(*)as freee
from transfers_history
where is_free_transfer = 1
group by year 
order by freee DESC

-- loan transfers by year
select year,
    count(*)as freee
from transfers_history
where is_loan = 1
group by year 
order by freee DESC


