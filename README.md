# Logistics Delivery Insights

Project: Logistics Delivery Insights  
Tools: Power BI, Python (Pandas), SQL, DAX  
Dataset: 40,000+ mixed logistics orders (e-commerce, food, courier)

A complete end-to-end analytics project: raw CSV → data cleaning & feature engineering → SQL validation → Power BI dashboards for operational and cost insights.

---

## Summary
This project analyzes delivery performance, cost leakage, rider efficiency, hub operations, distance patterns, and time-of-day demand trends. Deliverables include a cleaned dataset, SQL schema & queries, and three interactive Power BI dashboards.

---

## Repository Structure
```
├── dataset/
│   ├── cleaned_deliveries.csv
│   └── shadowfax_mixed_logistics_data.csv
├── notebooks/
│   └── analysis.ipynb
├── sql/
│   ├── schema.sql
│   └── queries.sql
├── dashboards/
│   ├── sadhofx.pbix (All dashboards inside one file, Contains all 3 dashboards in one Power BI report)
├── README.md
```

## Highlights / Key Metrics
Dashboard 1 — Delivery Performance
- Total Orders: ~40,000
- SLA Met: 50.12%
- Average Delay: −0.10 mins
- Delayed Orders: ~20,000
- Visuals: delay bucket distribution, zone-wise average delay, SLA compliance breakdown, SLA vs order type trends

Dashboard 2 — Cost & Leakage Analysis
- Total Cost Leakage: ₹7.52L
- Avg Base Cost per Delivery: ₹51.23
- Avg Rider Payout: ₹70.03
- Leakage Orders: ~40,000
- Visuals: cost leakage by zone, avg base cost vs rider payment, rider payment vs distance, leakage table by order type & zone, cost-per-km by zone

Dashboard 3 — Operational Efficiency
- Focus: peak-hour patterns, rider efficiency, hub performance, distance-driven cost variations
- Visuals: rider efficiency scatter (distance vs payment), cost-per-km by zone, deliveries per hub, deliveries by hour (with order type split)

---

## Tech Stack & Implementation
- Python (Pandas)
    - Cleaned raw dataset
    - Engineered columns: delay_minutes, sla_met flag, cost_leakage, delay_bucket, delivery_hour
    - Exported cleaned CSV for BI
- SQL
    - Database schema and validation queries
    - Joins, CTEs, aggregations to validate dashboards
- Power BI
    - Star schema, measures, calculated columns
    - DAX measures for SLA%, avg base cost, cost-per-km, deliveries per hub, rider efficiency score
    - Interactive slicers and cross-highlighting

---

## Key Insights
Operations
- SLA performance at ~50% — priority area for routing and staffing improvements
- Zone C: best on-time performance; Zone B: worst average delay

Cost Optimization
- Rider payouts exceed base cost in most zones → consistent leakage (~₹180K–₹190K per zone)
- Food orders have higher payouts than courier

Rider Efficiency
- Longer distances correlate with higher payouts; courier riders tend to have lower cost-per-km

Hub Efficiency
- A few hubs carry most of the load — opportunities to rebalance and reroute

Time-Based Patterns
- E-commerce peaks mid-day; food peaks at lunch & dinner; courier demand is steady across the day

---

---

## How to use
1. Inspect `dataset/shadowfax_mixed_logistics_data.csv` for raw data.
2. Run the cleaning notebook or script to reproduce `cleaned_deliveries.csv`.
3. Load `cleaned_deliveries.csv` into your DB (use `sql/schema.sql`) and validate metrics using `sql/queries.sql`.
4. Open the Power BI files in `dashboards/` and connect to the cleaned dataset or DB to explore dashboards interactively.

---

## Notes
- All values are approximate and derived from the project dataset.
- Replace sample PBIX files or CSV paths as needed for local environment.

License: Add your preferred license file if sharing publicly.
