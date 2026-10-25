# Big Billion Days Regional Performance Review

## Technical Environment & Tools
- **SQL Compiler & Dialect:** MySQL and one compiler
- **Spreadsheet Tool:** Microsoft Excel
- **Dashboard Platform:** Tableau Public


## Executive Summary
This project analyzes regional sales performance, category revenue, and order trends from the Big Billion Days dataset (`orders_clean.csv`) to deliver data-backed commercial insights. First, total revenue across all regions reached **₹3,46,200**, with the North region leading overall performance at **₹1,19,300** (34.46% share), driven heavily by high-value Electronics demand (₹73,400). Second, the East region represents the lowest-performing market at **₹69,500** (20.08% share), with revenue heavily concentrated in Home category products (₹37,500). Third, a rigorous human-in-the-loop review of AI-assisted outputs corrected critical schema-hallucinated metrics and verified an actual Month-over-Month decline of **-22.8%** in North region performance between September and October 2026.


## File Index

| File Path | Project Part | Description / Purpose |
| :--- | :--- | :--- |
| `README.md` | General | Project metadata, environment specs, executive summary, file index, and assumptions. |
| `sql/00_schema_and_seed.sql` | Part A | Database schema definition and seed data insert statements. |
| `sql/q01.sql` ... `sql/q13.sql` | Part A | Individual SQL queries solving analytical tasks Q01 through Q13. |
| `sql/d1_corrected.sql` | Part D | Corrected SQL query resolving AI syntax errors and verifying MoM performance (-22.8%). |
| `results/query_results.md` | Part A | Formatted execution results and output verification logs for queries Q01–Q13. |
| `data/orders_enriched.csv` | Part B | Processed order dataset enriched with item-level pricing and region metadata. |
| `data/orders_clean.csv` | Part B | Final, cleaned source-of-truth dataset used across Excel, SQL, and Tableau analyses. |
| `docs/spreadsheet_notes.md` | Part B | Technical documentation detailing data cleaning, VLOOKUP repairs, and pivot reconciliations. |
| `docs/dashboard_spec.md` | Part C | Complete specifications, 6 core sections, KPI reconciliation grid, and Tableau dashboard layout. |
| `docs/ai_log.md` | Part D | Human-in-the-Loop audit log covering prompt protocols, root-cause fixes, and skeptical checks. |


## Analytical Assumptions
- **Status Filter:** All core KPI figures, regional comparisons, and category totals strictly filter for completed orders (`status = 'completed'`).
- **Root-Cause Analysis Scope:** East region performance gaps are evaluated based on revenue contribution relative to North without assuming immediate unit price reductions prior to verifying inventory stockout logs.
- **SQL Compiler Portability:** Standard SQL aggregation functions (`SUM`, `GROUP BY`, `HAVING`) were chosen to ensure identical query execution across OneCompiler and MYSQL environments.
