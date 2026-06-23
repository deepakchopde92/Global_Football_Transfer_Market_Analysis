-- total leagues
SELECT count(DISTINCT(league))as total_leagues
from league_metrics

-- top league by num_teams
select league,
    max(num_teams)as num_team
from league_metrics
group by league
order by num_team DESC

-- top leagues by avg_attendance
select league,
    avg(avg_attendance) as attendance
from league_metrics
group by league
order by attendance DESC

-- top leagues by avg_ticket_price
select league,
    max(avg_ticket_eur) ticket
from league_metrics
GROUP by league
order by ticket DESC

-- top league by foriegn player pct
select league,
    max(foreign_players_pct) pct
from league_metrics
group by league
order by pct DESC

-- top league by total revenue
SELECT league,
    year,max(total_revenue_eur_m)as t3
from league_metrics
group by league
order by t3 DESC

-- top league by total_revenue
SELECT league,
    sum(total_revenue_eur_m)as total
from league_metrics
group by league
order by total DESC

-- player with highest market value
select player_name,
    market_value_eur_m, 
    position,year,rank()over( order by market_value_eur_m DESC)as rnk
from player_market_values

-- player with highest market_value in 2026
select player_name,
    market_value_eur_m, 
    position,year,rank()over( order by market_value_eur_m DESC)as rnk
from player_market_values
where year = 2026

-- yearwise highest market value player 
SELECT year,
    player_name,
    position,
    market_value_eur_m
from(
    select year,
        player_name,
        position,market_value_eur_m,
        rank()over(PARTITION by year order by market_value_eur_m DESC)as rnk
    from player_market_values
)
where rnk = 1

-- positionwise highest market value player in 2026
SELECT player_name,
    position,
    year,
    market_value_eur_m
from(
    SELECT player_name,
        position,
        year,
        market_value_eur_m,
        rank()over(PARTITION by position order by market_value_eur_m DESC)as rnk
    from player_market_values
)
where rnk = 1
order by market_value_eur_m DESC


