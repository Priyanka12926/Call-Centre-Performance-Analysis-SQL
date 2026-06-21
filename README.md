# 📞 Call Centre Performance Analysis — SQL Project

## 📌 Project Overview
Analysis of 100K call records from a MyOperator IVR system 

## 🔍 Key Insights Found
- 51.9% of all calls were missed — identified peak missed-call hours
- Karnataka generated highest call volume (1.1 lakh calls)
- Average call duration: 82 seconds
- Identified top performing agents by connection rate

## 🛠️ Tools Used
- MySQL Workbench
- Microsoft Excel (data source)

## 📂 File Structure
call-centre-analysis/
├── README.md
├── call_centre_analysis.sql   ← all 10 queries here

## 📊 SQL Concepts Covered
- Window Functions: ROW_NUMBER, RANK, DENSE_RANK, LAG, NTILE
- CTEs (WITH clause)
- CASE WHEN pivot-style aggregation
- DATE/TIME functions: HOUR(), DAYNAME(), DATE_FORMAT()
- Subqueries and HAVING filters

## 💡 Business Questions Answered
1. Which department has the highest missed call rate?
2. Who are the top/bottom performing agents?
3. What are peak call hours by day of week?
4. Which states generate maximum call volume?
5. Is monthly call volume growing or declining?
6. How many customers are repeat callers?
7. What is the First Call Resolution rate?
8. How are call durations distributed across quartiles?
9. How has call quality changed month over month?
10. Who are the top 10 agents by connection rate?
