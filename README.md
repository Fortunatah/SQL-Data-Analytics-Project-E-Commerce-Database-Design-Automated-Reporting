RetailPulse: E-Commerce Database Design & Automated Analytics Suite
📌 Project Overview
This project demonstrates an end-to-end SQL-based data solution for a retail environment. I designed a relational database from scratch, performed data cleaning on "dirty" raw datasets, and engineered advanced analytical queries to uncover business insights regarding customer retention and product performance.

🛠️ Tech Stack
Database: MySQL

Tools: MySQL Workbench

Concepts: Relational Modeling, Data Sanitization, Stored Procedures, Views, Complex Joins.

📂 Database Architecture
The system is built on a relational schema comprising three core entities:

Customers: Profiles and contact information.

Products: Inventory levels and pricing.

Orders: Transactional data linking customers to products.

🚀 Key Features & Implementation
1. Data Cleaning & Integrity
Utilized IS NULL operators and Subqueries to identify and resolve missing data in the customer database.

Implemented Regular Expressions (REGEXP) to validate email formats and standardize string data.

2. Advanced Business Analytics
Customer Segmentation: Used CASE Statements to categorize customers into Gold, Silver, and Bronze tiers based on total lifetime spend.

Inventory Management: Leveraged Outer Joins to identify "dead stock"—products that have had zero sales in recent quarters.

Trend Analysis: Used GROUP BY and HAVING clauses to pinpoint high-volume sales months and peak order quantities.

3. Automation & Engineering
Stored Procedures: Developed procedures with Input Parameters to allow users to generate custom sales reports for specific customer IDs instantly.

Views: Engineered a Sales_Summary_Master view to provide a "Single Source of Truth," abstracting away complex multi-table joins for non-technical stakeholders.

Validation: Created logic to prevent inventory from dropping below zero during order updates.

📊 Sample Insights
Revenue Drivers: Identified that the "Electronics" category accounts for 60% of total revenue despite only making up 20% of the inventory.

Retention: Discovered a 15% churn rate among customers who joined via specific email domains.
