

-- 1. View data
SELECT *
FROM player_market_values
LIMIT 10;

-- 2. Highest market value player of all time
SELECT
    player_name,
    position,
    year,
    market_value_eur_m
FROM player_market_values
ORDER BY market_value_eur_m DESC
LIMIT 10;

-- 3. Highest market value player in 2026
SELECT
    player_name,
    position,
    market_value_eur_m
FROM player_market_values
WHERE year = 2026
ORDER BY market_value_eur_m DESC
LIMIT 10;

-- 4. Year-wise highest market value player
SELECT
    year,
    player_name,
    position,
    market_value_eur_m
FROM (
    SELECT *,
           RANK() OVER (
               PARTITION BY year
               ORDER BY market_value_eur_m DESC
           ) AS rnk
    FROM player_market_values
) t
WHERE rnk = 1;

-- 5. Position-wise highest market value player
SELECT
    player_name,
    position,
    market_value_eur_m
FROM (
    SELECT *,
           RANK() OVER (
               PARTITION BY position
               ORDER BY market_value_eur_m DESC
           ) AS rnk
    FROM player_market_values
) t
WHERE rnk = 1
ORDER BY market_value_eur_m DESC;

-- 6. Top 10 most valuable players
SELECT
    player_name,
    position,
    year,
    market_value_eur_m
FROM player_market_values
ORDER BY market_value_eur_m DESC
LIMIT 10;

-- 7. Average market value by position
SELECT
    position,
    ROUND(AVG(market_value_eur_m),2) AS avg_market_value
FROM player_market_values
GROUP BY position
ORDER BY avg_market_value DESC;

-- 8. Position frequency among top-valued players
SELECT
    position,
    COUNT(*) AS total_players
FROM player_market_values
GROUP BY position
ORDER BY total_players DESC;

-- 9. Market value trend by year
SELECT
    year,
    MAX(market_value_eur_m) AS highest_market_value,
    AVG(market_value_eur_m) AS avg_market_value
FROM player_market_values
GROUP BY year
ORDER BY year;

-- 10. Top valued players in 2026
SELECT
    player_name,
    position,
    market_value_eur_m
FROM player_market_values
WHERE year = 2026
ORDER BY market_value_eur_m DESC;

