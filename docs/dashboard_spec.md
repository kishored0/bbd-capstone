# 1.Data source

| Column Name | Classification |
| :--- | :--- |
| `order_id` | Dimension |
| `order_month` | Dimension |
| `clean_first_name` | Dimension |
| `clean_last_name` | Dimension |
| `region` | Dimension |
| `rep_name` | Dimension |
| `item` | Dimension |
| `category` | Dimension |
| `unit_price` | Measure |
| `quantity` | Measure |
| `amount` | Measure |
| `revenue_calc` | Measure |
| `status` | Dimension |


# 2.KPI Cards

**Total Revenue**(sum of amount) : 346200
-Confirmation Note: The **Total Revenue** KPI equals to Part A's q05 total of 346200 exactly.
 
**Total Units Sold**(sum of quantity) : 106


# 3.Chart sheets

Task 3: Chart Sheets
Specify the four required worksheets in Tableau:

1. **Revenue by Region**
-Chart Type: Bar Chart  
-Shelves: Row = region, Column = Sum(amount), Color = region 
-Justification: A horizontal bar chart allows clear, immediate visual comparison of revenue performance across the regions territories.

-**Data Table**: 

The total amount recorded across all regions is **3,46,200 INR**.

| Region | Amount (INR) |
| :--- | :--- |
| **North** | 1,19,300 |
| **South** | 82,500 |
| **West** | 74,900 |
| **East** | 69,500 |
| **Grand Total** | **3,46,200** |


2. **Revenue by Category**
-Chart Type: Bar Chart  
-Shelves: Row = category, Column = Sum(amount), Color = category
-Justification: Clearly highlights which product category generates the highest sales volume.

-**Data Table** : 

| Category | Sum of Amount (INR) |
| :--- | :--- |
| Electronics | 1,42,300 |
| Home | 1,26,400 |
| Apparel | 77,500 |


3. **Revenue Trend by Month and Category**
-Chart Type: Line Chart  
-Shelves: Column = order_month, Row = Sum(amount), Color = category (one line per category)  
-Justification: A multi-line trend chart is the industry standard it's used for tracking time-series(year,month,quarter) progression and identifying category-specific momentum shifts.

-**Data Table**: 

| Month | Category | Sum (INR) |
| :--- | :--- | :--- |
| **September** | Apparel | 43,000 |
| September | Electronics | 30,600 |
| September | Home | 24,700 |
| **October** | Apparel | 30,600 |
| October | Electronics | 49,900 |
| October | Home | 12,600 |
| **November** | Apparel | 4,100 |
| November | Electronics | 61,800 |
| November | Home | 89,100 |
| **Grand Total** | | **3,46,200** |


4. **Region x Category Detail**
-Chart Type: Text Table (Matrix) 
-Shelves: Row = region , Column = category , Text/Measures = sum(amount)
-Justification: Text tables provides with exact values of the data.

-**Data Table**:

| Region | Apparel | Electronics | Home | Grand Total |
| :--- | :--- | :--- | :--- | :--- |
| East | 10,600 | 21,400 | 37,500 | 69,500 |
| North | 19,400 | 73,400 | 26,500 | 1,19,300 |
| South | 10,000 | 28,700 | 43,800 | 82,500 |
| West | 37,500 | 18,800 | 18,600 | 74,900 |
| **Grand Total** | **77,500** | **1,42,300** | **1,26,400** | **3,46,200** |


# 4. Dashboard Layout

**Layout and Containers**
-The dashboard layout is structured strictly from top to bottom within a float window.
-Top Band - KPI Cards: A horizontal container holding the Total Revenue and Total Units Sold cards side by side.
-Global Filter Band: The interactive category filter placed immediately beneath the KPI cards.
-Trend Analysis: The Revenue Trend by Month and Category line chart occupying the upper-middle section.
-Comparison Section: A horizontal container holding Revenue by Region and Revenue by Category side by side.
-Detail Section: The Region × Category Detail text table positioned at the bottom.

**Category Filter**
Field Used: category
-Added to the Filter shelf, exposed as a single-select or multi-select dropdown card on the dashboard interface.
-Applied to all four worksheets using the primary data source (orders_clean.csv) to ensure uniform all data filtering.

**Use as Filter Interaction**
-"Use as Filter" is enabled on the Revenue by Region worksheet.
-Behavior Statement: "When a user clicks a bar in Revenue by Region with Use as Filter enabled, the other three worksheets cross-filter to the selected region, showing the corresponding category revenue, monthly trend, and region-category details."


# 5. Insight and recommendation narrative

-**Visualization summary**
-The dashboard translates the cleaned transaction data from orders_clean.csv into an visualize Dashboard. It aggregates performance into two headline KPIs (₹3,46,200 Total Revenue and 106 total units sold) while offering deeper investigative views through regional rankings, categories, trend tracking (time period Trend), and Exact Data matrix .

-**Summary analysis**
-Regional Leadership: The **North** region leads as the highest performing region generating **₹1,19,300**, while the **East** region recorded lowest sales value at **₹69,500** (a revenue gap of **₹49,800**).

-Category Dominance: **Electronics** is the top-performing category, generating **₹1,42,300**, followed closely by **Home** at **₹1,26,400**. **Apparel** represents the lowest category revenue at **₹77,500**.

-Temporary Surge: Across the trailing three months, the **Home** category experienced a dramatic surge in November, jumping from **₹12,600** in October to a peak of **₹83,200** in November.

-**Recommendations**
-East Region Promotional Campaign: Focus marketing and sales efforts in the **East** region (currently lowest at **₹69,500**) by introducing targeted many offers to bring it closer to North's benchmark of **₹1,19,300**.

-Electronics Inventory Management: Maintain strong inventory levels for **Electronics** (the top revenue performer at **₹1,42,300**) to ensure high-demand items remain in stock.

-Home Category Trend : Capitalize on the momentum in the **Home** category (which surged to **₹83,200** in November) by maintaining active promotions into the following quarter, tracking success via monthly line trends.


# 6. Reconciliation Table

| Metric Source | Value | Match / Mismatch |
| :--- | :--- | :--- |
| **Total Revenue KPI** | 3,46,200 | Match |
| **Sum of Revenue by Region** | 3,46,200 | Match |
| **Sum of Revenue by Category** | 3,46,200 | Match |
| **Part B Pivot Grand Total** | 3,46,200 | Match |



 



