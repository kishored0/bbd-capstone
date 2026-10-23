# Task 1: Five-Part Prompt for Part A (Q13)


**Role:** You are an expert data analyst
**Task:** write a sql query for the rep performance against target, sales rep, month, monthly target, completed status.
**Context:** My sql(state your dialect).reps(rep_id, rep_name, region, monthly_target); customers(customer_id, first_name, last_name, city, region, age, rep_id); orders(order_id, customer_id, item, quantity, amount, status, order_month). customers.rep_id = reps.rep_id; orders.customer_id = customers.customer_id.
**Constraints:** Completed orders only. ‘Below Target’ if revenue < monthly_target; ‘On Target’ if ≥ target and < 1.1 × target; ‘Above Target’ otherwise. group by rep_name, order_month, monthly_target, order by rep_name, order_month. No WITH clauses, no stored procedures,
**Format:** SQL format only,no text before or after with inline comment.


# Task 2: Inspection of Scenario D1

+----------------------------------------------------------+----------------------+--------------------------------------------------------------------+
| Defect / Error                                           | Classification       | Correction / Fix                                                   |
+----------------------------------------------------------+----------------------+--------------------------------------------------------------------+
| **Table sales does not exist**                           | fake method/function | from customers c left join orders o on c.customer_id=o.customer_id |
| **Column region_name,total_sales do not exist**          | fake method/function | Replace total_sales with SUM(amount) from the orders table.        |
| **Aggregation SUM() placed in WHERE clause**             | logic error          | where o.status = 'completed'...having SUM(o.amount) > 80000.       |
| **claim that "North revenue grew 38% month over month"** | phantom statistic    | Reject claim. Actual North revenue changed from ₹49,900 in 2026-09 |
|                                                          |                      | to ₹38,500 in 2026-10, representing a -22.8% decline.              |
+----------------------------------------------------------+----------------------+--------------------------------------------------------------------+


# Task 3: Verification of Scenario D1

**Corrected SQL Output (sql/d1_corrected.sql)**

Running sql/d1_corrected.sql on the seed database yields exactly 2 rows:
- **North:** 119,300
- **South:** 82,500  

(East at 69,500 and West at 74,900 are filtered out as they do not cross the 80,000 threshold).

**Month-over-Month Growth Verification for North Region**

- **North Revenue in 2026-09:** ₹53,500
- **North Revenue in 2026-10:** ₹41,300
- **Actual Growth Calculation:** ((41300 - 53500) / 53500) ** 100 = -22.84%
- **Verification Statement:** The assistant's claim of +38% growth is completely contradicted by the data. Actual North region revenue decreased by **-22.8%** from 2026-09 to 2026-10.


# Task 4: Human-in-the-Loop Protocol for Scenario D1

- **Specification:** Instructed the assistant to retrieve top-performing regions (>80,000 revenue) for completed orders and provide month-over-month growth statistics.
- **Execution:** Ran the AI query on the seed. It fails: no table sales, and SUM() is not allowed in WHERE.
- **Inspection:** Identified invalid table names (sales), incorrect column names (total_sales), a SQL syntax error (WHERE SUM(...)), and an unverified growth statistic 38%.
- **Verification:** corrected sql query returns (North: 119,300, South: 82,500) and calculated actual North Sep to Oct MoM growth as -22.8%.
- **Decision:** **REJECT** original AI answer due to hallucinated schema and 38% is contradicted. **ACCEPT** corrected query sql/d1_corrected.sql it's run and reconcile with q11 output.


# Task 5: Prompt and Root Cause Analysis for Scenario D2

**Five-Part Prompt for Scenario D2**

- **Role:** You are an expert Excel Spreadsheet Specialist.
- **Task:** Explain why my VLOOKUP formula returns "not found" (#N/A) and provide the corrected formula.
- **Context:** The products tab occupies range A1:C10 (headers in row 1, item names in Column A, unit prices in Column C). Cell G2 on the orders tab in the item column holds the text " Smart Watch" (with an unintended space before the first letter). The current formula is =VLOOKUP(G2, $A$2:$C$10, 3, FALSE).
- **Constraints:** Keep exact match (FALSE); no hand-editing the data; the formula fix must copy down cleanly.
- **Format:** A one-sentence root cause explanation, followed by the corrected formula.

**Root Cause & Repaired Formula**

- **Root Cause:** The lookup fails because cell G2 contains an unintended leading space before the text, which prevents an exact character-for-character match with the clean product name in column A.
- **Repaired Formula:**
 excel 
 =VLOOKUP(TRIM(G2), $A$2:$C$10, 3, FALSE)


# Task 6: Skeptical-Analyst Check on Part C

**Prompt:**
-"Act as a skeptical Data Analyst and critical reviewer. Challenge my first recommendation from Part C (deploying targeted promotions in the East region to bridge its performance gap).   Identify unstated business assumptions, request evidence of root cause beyond mere correlation, and list data points needed to confirm or weaken the recommendation."

**Unstated Assumptions & Verification Checks:**

**Assumption 1:** Low regional revenue in East (₹69,500 vs North's ₹1,19,300) is driven by weak customer demand rather than stockouts or inventory shortages.
-Root Cause vs. Correlation: Lower sales in the East region correlate with regional boundaries, but correlation does not prove that customers lack interest.
-Verifying Figure/Check:
-Compare East's total performance (₹69,500) against regional inventory stockout logs.
**Confirms:** If stock fulfillment was at 100%, low demand is confirmed as the root cause.
**Weakens:** If inventory was out of stock during key windows, stockouts caused the revenue gap, rendering price promotions ineffective.

**Assumption 2:** East region customers are price-sensitive and will respond positively to promotional discounts.
-Root Cause vs. Correlation: Lower overall revenue does not automatically mean customers find current pricing too high.
-Verifying Figure/Check:
-Compare East's category mix (Electronics at ₹21,400 vs North's ₹73,400) to check unit order mix.
**Confirms:** If East's lower revenue is due to lower-tier product selection, targeted mid-tier bundle promotions will incentivize higher spending.
**Weakens:** If order count per customer remains low across all price points, the issue stems from low rep coverage, not unit pricing.

**Assumption 3:** Running promotional discounts in the East region will produce net-positive profit margins.
-Root Cause vs. Correlation: Boosting top-line sales volume through promotional discounting does not guarantee overall business profitability.
-Verifying Figure/Check:
-Evaluate product gross margin percentages across East's top category (Home: ₹37,500).
**Confirms:** If gross margins exceed 30%, offering a 10% promotional discount will safely lift top-line sales while maintaining positive contribution margins.
**Weakens:** If profit margins are already under 15%, running price promotions will cause net financial losses despite increasing total order volume.



