# Section(a): The formula

- **clean_first_name**: =PROPER(TRIM(C2))
- **clean_last_name**: =PROPER(TRIM(E2))
- **category**: =VLOOKUP(I2,products!$A$1:$B$10,2,0)
- **unit_price**: =XLOOKUP(I2,products!$A$2:$A$10,products!$C$2:$C$10,"UNKNOWN_ITEM",)
- **revenue_calc**: =N2*J2


# Section(b): The 5 Aggregate Results

- **COUNT**: 63
- **SUM**: 346200
- **AVERAGE**: 5495.238
- **MIN**: 1100
- **MAX**: 15600


# Section(c): Pivot Tables

- **Pivot Table 1: category vs region(sum of amount)**

| Region (Row Labels) | Apparel (₹) | Electronics (₹) | Home (₹) | Grand Total (₹) |
| :--- | ---: | ---: | ---: | ---: |
| **East** | 10,600 | 21,400 | 37,500 | **69,500** |
| **North** | 19,400 | 73,400 | 26,500 | **119,300** |
| **South** | 10,000 | 28,700 | 43,800 | **82,500** |
| **West** | 37,500 | 18,800 | 18,600 | **74,900** |
| **Grand Total** | **77,500** | **142,300** | **126,400** | **346,200** |

- **Pivot Table 2: monthly revenue & order volume** 

| Month (Row Labels) | Sum of Amount (₹) | Count of Orders |
| :--- | ---: | ---: |
| **2026-09** | 98,300 | 19 |
| **2026-10** | 93,100 | 20 |
| **2026-11** | 154,800 | 24 |
| **Grand Total** | **346,200** | **63** |


# Section(d): Reconciliation Table

| Metric Source | Value | Match / Mismatch |
| :--- | :--- | :--- |
| **Total Revenue KPI** | 3,46,200 | Match |
| **Sum of Revenue by Region** | 3,46,200 | Match |
| **Sum of Revenue by Category** | 3,46,200 | Match |
| **Part B Pivot Grand Total** | 3,46,200 | Match |


# Section(e): Data Validation

- **Missing Amounts:** Handled missing values by identifying the three missing amounts using the order IDs referenced from Part A's q02, the order_id's are `1001`,`1010`,`1064` .
- **Data Types:** Confirmed all numbers (such as `unit_price`, `quantity`, `amount`, and `revenue_calc`) are consistently stored and formatted as numeric data types.
- **Duplicates & Outliers:** Checked for duplicate `order_id` entries among all completed orders to ensure transaction uniqueness, no unexpected duplicate transaction entries were found.
- **Largest Amount & Ties:** The largest single `amount` is `15600`. Multiple orders share this same maximum value (tied across orders including ID `1061`, `1065`, `1069`, and `1077`).
- **Colleague Handover Note:** Ensure that any future edits to the lookup columns maintain the absolute cell references (`$A$2:$C$10`) so that formulas copy down without shifting or drifting.

# Section(f): Setup
- **Tabs Created:** Two primary operational tabs were created and configured: `orders` and `products`, alongside the final presentation tab `completed_orders`.
- **Imported Rows:** Exactly `90` rows of data were imported into the `orders` tab from Part A's output.
- **Products Range:** The `products` reference table occupies the exact cell range `A1:C10` on the `products` tab.
- **Filters & Sorts:** Applied a row filter of `status = completed` (yielding 63 matching rows) followed by a descending sort on the `amount` column prior to populating the `completed_orders` tab.
- **XLOOKUP Test:** Performed a pre-test verification using a non-existent lookup key (`Mystery Item`) in a spare cell, confirming that the `XLOOKUP` formula correctly returns the fallback value `UNKNOWN_ITEM`.










