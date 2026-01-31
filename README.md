SQL Fraud Detection Project

📌 Project Overview
This project focuses on identifying **fraudulent financial transactions** using advanced **SQL techniques**.  
It demonstrates real-world fraud detection logic commonly used in **banking and financial analytics**.

🎯 Objectives
- Detect suspicious transaction patterns
- Identify potential money laundering chains
- Analyze fraudulent activity over time
- Validate account balance consistency
- Detect zero-balance anomalies

🛠️ SQL Concepts Used
- Common Table Expressions (CTEs)
- Recursive CTEs
- Multiple CTE chaining
- Rolling calculations
- Conditional filtering
- Balance validation logic

📂 Project Features

1️⃣ Detecting Recursive Fraudulent Transactions
 - Uses **recursive CTEs** to trace multi-step money transfers
 - Identifies possible **money laundering chains**
 - Filters transactions flagged as fraudulent

2️⃣ Analyzing Fraudulent Activity Over Time
  - Calculates **rolling sums** of fraudulent transactions
  - Helps understand fraud patterns across steps

3️⃣ Complex Fraud Detection Using Multiple CTEs
  - Detects:
  - Large transfers
  - Consecutive transactions without balance change
  - Flagged suspicious activity

4️⃣ Balance Consistency Check
  - Compares **computed updated balance** with actual destination balance
  - Returns rows where both balances match

5️⃣ Zero Balance Transaction Detection
  - Identifies transactions where:
    - `oldbalanceDest = 0`
    - `newbalanceDest = 0`

📁 Files Included
- `fraud_detection.sql` – " sql.sql"
- `SQL_Data_Analyst_Project.pdf` – " SQL Data Analyst.pdf "

👩‍💻 Author
Nandini Wadile 
SQL Data Analyst Project

🚀 Use Case
This project is useful for:
- Data Analyst portfolios
- SQL interview preparation
- Financial fraud analysis
- Academic and practical learning
