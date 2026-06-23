
-- 1. View data
SELECT *
FROM club_financials
LIMIT 10;

-- 2. Total revenue, profit, wages
SELECT 
    SUM(revenue_eur_m) AS total_revenue,
    SUM(profit_eur_m) AS total_profit,
    SUM(wage_bill_eur_m) AS total_wages
FROM club_financials;

-- 3. Top revenue clubs
SELECT club_name, country, year, revenue_eur_m
FROM club_financials
ORDER BY revenue_eur_m DESC
LIMIT 10;

-- 4. Top profit clubs
SELECT club_name, country, year, profit_eur_m
FROM club_financials
ORDER BY profit_eur_m DESC
LIMIT 10;

-- 5. Top wage spending clubs
SELECT club_name, country, year, wage_bill_eur_m
FROM club_financials
ORDER BY wage_bill_eur_m DESC
LIMIT 10;

-- 6. Top loss-making clubs
SELECT club_name, country, year, profit_eur_m
FROM club_financials
ORDER BY profit_eur_m ASC
LIMIT 10;

-- 7. Country-wise revenue
SELECT 
    country,
    SUM(revenue_eur_m) AS total_revenue
FROM club_financials
GROUP BY country
ORDER BY total_revenue DESC;

-- 8. Country-wise profit
SELECT 
    country,
    SUM(profit_eur_m) AS total_profit
FROM club_financials
GROUP BY country
ORDER BY total_profit DESC;

-- 9. Revenue vs wages
SELECT 
    club_name,
    country,
    year,
    revenue_eur_m,
    wage_bill_eur_m,
    profit_eur_m
FROM club_financials
ORDER BY revenue_eur_m DESC;

-- 10. Year-wise revenue trend
SELECT 
    year,
    SUM(revenue_eur_m) AS total_revenue,
    SUM(profit_eur_m) AS total_profit,
    SUM(wage_bill_eur_m) AS total_wages
FROM club_financials
GROUP BY year
ORDER BY year;

