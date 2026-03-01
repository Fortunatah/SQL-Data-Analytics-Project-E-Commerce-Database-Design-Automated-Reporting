📌 Project Overview
This project showcases a complete SQL-based data lifecycle for a retail business. I designed a relational database from the ground up, performed advanced data sanitization on "dirty" raw datasets, and engineered an analytics suite to provide actionable business intelligence.

🛠️ Tech Stack
Database: MySQL

Tools: MySQL Workbench, GitHub

Core Concepts: Relational Modeling (ERD), Data Cleaning, Aggregations, Views, Stored Procedures, and Case Logic.

📂 Repository Structure
The project is organized into four sequential scripts to mimic a professional data pipeline:

01_setup_schema.sql: Builds the database structure and establishes Primary/Foreign Key relationships.

02_data_cleaning.sql: Sanitizes the raw data (Standardizing names, handling NULLs, and removing test records).

03_exploratory_analysis.sql: Business intelligence queries including Revenue, VIP identification, and Dead Stock audits.

04_advanced_features.sql: Production-ready tools including a Master Sales View and an automated Stored Procedure.

🚀 Key Features & Logic
1. Data Sanitization (The "Dirty Data" Fix)
Raw data is rarely perfect. I implemented logic to:

Standardize Casing: Used CONCAT, UPPER, and LOWER to fix inconsistent name formatting (e.g., "john DOE" → "John Doe").

Handle Missing Values: Converted empty CSV strings into true NULL values for better mathematical accuracy.

Referential Integrity: Safely removed test users by deleting "child" records in the Orders table before the "parent" record in Customers.

2. Business Intelligence & Aggregation
VIP Identification: Leveraged the HAVING clause to filter customers by their lifetime total spend rather than individual transactions.

Inventory Audit: Used LEFT JOIN and IS NULL logic to pinpoint products that have never been sold (Dead Stock).

Trend Analysis: Extracted month-over-month sales counts using YEAR() and MONTH() functions.

3. Database Engineering
Master Sales View: Created a "Single Source of Truth" by joining three tables into a virtual view, abstracting complexity for non-technical users.

Stored Procedure: Engineered getCustomerSpend to allow instant, parameterized lookups of specific customer revenue.

Dynamic Stock Status: Implemented a tiered CASE statement to categorize inventory into Surplus, In-Stock, Low-Stock, or No-Stock.

📊 Sample Insights Generated
Identified the Top 3 spenders based on cumulative purchase history.

Cataloged all "Dead Stock" items to suggest clearance opportunities for the furniture category.

Automated a tiered stock-alert system to streamline warehouse re-ordering.

⚙️ How to Run
Execute 01_setup_schema.sql.

Import the provided CSV files via the MySQL Workbench Import Wizard.

Execute 02_data_cleaning.sql to scrub the records.

Explore the analysis in scripts 03 and 04.
