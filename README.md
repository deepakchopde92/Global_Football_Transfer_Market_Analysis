# Global Football Transfer Market Analysis (2010-2026)

## Project Overview

This project analyzes the global football transfer market from 2010 to 2026 using SQL and Power BI.

The analysis covers:

- Club Financial Performance
- League Economics
- Player Market Values
- Record Transfers
- Transfer History

The objective was to transform raw football business data into meaningful insights through data analysis, visualization, and dashboard development.

---

## Tools Used

- SQL
- SQLite
- Power BI
- DAX
- Data Visualization

---

## Dataset Information

The project consists of five related datasets representing different aspects of the football business ecosystem.

### 1. Club Financials

Contains club-level financial information including revenue, wages, and operating profit.

Columns:

- year
- club_name
- league
- country
- stadium_capacity
- revenue_eur_m
- wage_bill_eur_m
- wages_to_revenue_pct
- net_transfer_spend_eur_m
- operating_profit_eur_m

---

### 2. League Metrics

Contains league-level economic and attendance information.

Columns:

- year
- league
- country
- num_teams
- total_revenue_eur_m
- avg_attendance
- avg_ticket_eur
- foreign_players_pct

---

### 3. Player Market Values

Contains yearly player valuation information.

Columns:

- year
- player_name
- age
- position
- market_value_eur_m
- is_peak_year

---

### 4. Record Transfers

Contains information about major transfer deals.

Columns:

- transfer_id
- date
- year
- season
- player_name
- position
- age_at_transfer
- from_club
- to_club
- fee_eur_m
- is_free_transfer
- is_loan
- is_extension

---

### 5. Transfer History

Contains historical player movement information.

Columns:

- transfer_id
- year
- date
- season
- transfer_window
- player_name
- position
- age
- from_club
- from_league
- from_country
- to_club
- to_league
- to_country
- fee_eur_m
- is_free_transfer
- is_loan
- is_intra_league
- is_intra_country

---

## Project Workflow

1. Data Exploration
2. SQL Analysis
3. KPI Development
4. Trend Analysis
5. Comparative Analysis
6. Insight Generation
7. Power BI Dashboard Development

---

## Dashboard Features



### KPI Cards

- Total Revenue
- Total Transfers
- Total Clubs
- Total Leagues
- Average Transfer Age
- Highest Market Value

### Dashboard Pages

- Executive Dashboard
- Club Financials
- League Economics
- Player Market Value
- Transfers

## Dashboard Preview

### 1. Executive Dashboard
![Executive Dashboard](Dashboard_Screenshots/01_Executive_Dashboard.png)

### 2. Club Financials
![Club Financials](Dashboard_Screenshots/02_Club_Financials.png)

### 3. League Economics
![League Economics](Dashboard_Screenshots/03_League_Economics.png)

### 4. Player Market Value
![Player Market Value](Dashboard_Screenshots/04_Player_Market_Value.png)

### 5. Transfers
![Transfers](Dashboard_Screenshots/05_Transfers.png)

---

## Key Insights

- Football finances are concentrated among a small group of elite European clubs.
- High revenue does not always translate into high profit due to wage and operating costs.
- England, Spain, and Germany dominate football economics.
- The Premier League demonstrates the strongest overall commercial performance.
- Attacking players command the highest market values and transfer fees.
- Most major transfers involve players aged between 23 and 25.
- Transfer activity is concentrated among financially powerful clubs.
- International transfers significantly exceed domestic transfers.
- Summer transfer windows account for most player movement.
- COVID-19 temporarily disrupted attendance and transfer activity.

---

## Conclusion

Football's business ecosystem is heavily influenced by a small number of financially dominant clubs and leagues. The Premier League leads in overall commercial performance, while player valuation and transfer activity are driven by young attacking talent. The transfer market remains highly globalized and increasingly shaped by financial strength and recruitment strategy.
