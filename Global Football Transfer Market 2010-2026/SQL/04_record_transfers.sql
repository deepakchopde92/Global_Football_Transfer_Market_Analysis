-- Total transfers
SELECT count(DISTINCT(transfer_id))as total_transfers
from record_transfers


-- Total paid transfers
SELECT count(DISTINCT(transfer_id))as paid_transfers
from record_transfers
where fee_eur_m > 0

-- Total free transfers
SELECT count(DISTINCT(transfer_id))as free_transfers
from record_transfers
where fee_eur_m = 0

--Total extensions
SELECT count(DISTINCT(transfer_id))as total_extensions
from record_transfers
where is_extension = 1


-- Top 10 highest transfer fees
SELECT *
from record_transfers
order by fee_eur_m DESC
limit 10

-- Year-wise highest transfer
SELECT *
from(
    SELECT *,
        rank()over(PARTITION by year order by fee_eur_m DESC)as rnk
    from record_transfers
)
where rnk = 1
order by year 


-- Position-wise highest transfer
SELECT *
from(
    SELECT *,
        rank()over(PARTITION by position order by fee_eur_m DESC)as rnk
    from record_transfers
)
where rnk = 1
order by fee_eur_m DESC

-- Which clubs bought most players?
SELECT to_club,
    count(DISTINCT(transfer_id))as bought_players
from record_transfers
group by to_club
order by bought_players DESC

-- Which clubs sold most players?
SELECT from_club,
       from_country AS club_country,
       COUNT(transfer_id) AS total_selling
FROM transfers_history
GROUP BY from_club, from_country
ORDER BY total_selling DESC;

-- Which clubs appear most frequently in transfers?
with Bought as (
    select to_club as club_name,count(transfer_id)as total_bought
    from record_transfers
    GROUP by to_club
),Sold as (
    select from_club as club_name,count(transfer_id)as total_sold
    from record_transfers
    GROUP by from_club
)
select b.club_name,(b.total_bought + s.total_sold)as frequency
from Bought as b
join Sold as s
on b.club_name = s.club_name
order by frequency DESC


-- Which position gets highest average fee?
select position,
    avg(fee_eur_m)as average_fee
from record_transfers
group by position
order by average_fee DESC

-- Which position gets transferred most?
select position,
    count(transfer_id)as transfers
from record_transfers
group by position
order by transfers DESC


-- Average age at transfer
SELECT avg(age_at_transfer)as avgg
from record_transfers

-- Highest fee age group
SELECT age_at_transfer
    ,avg(fee_eur_m)as fees,count(transfer_id)as transfers
from record_transfers
group by age_at_transfer
HAVING transfers > 3
order by fees DESC



-- youngest expensive transfer
SELECT *
from(
    select *,
        rank()over(PARTITION by age_at_transfer order by fee_eur_m DESC)as rnk
    from record_transfers
)
where rnk =1 
order by age_at_transfer


-- Transfers by year
SELECT year,
    count(transfer_id)as total_transfers
from transfers_history
group by year
order by total_transfers desc

-- Transfer fees by year
select year,
    avg(fee_eur_m)as fees_by_year
from transfers_history
GROUP by year
order by fees_by_year DESC

-- free trnasfers by year
select year,
    count(transfer_id)as free_transfers
from transfers_history
where is_free_transfer = 1
group by year
order by free_transfers DESC

