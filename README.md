# 🚀 SQL Sales Analytics Project

## 📌 Project Overview

This project demonstrates an end-to-end **Sales Analytics solution using SQL**, designed to transform raw transactional data into actionable business insights. Leveraging a dimensional **Star Schema** data model, the project applies advanced analytical SQL techniques to support **Business Intelligence**, **Executive Reporting**, **KPI Development**, and **Data-Driven Decision Making**.

The analysis focuses on customer behavior, product performance, revenue trends, and sales optimization, enabling stakeholders to identify growth opportunities and make informed strategic decisions.

---

## 📊 Data Model & Architecture

### Star Schema Design

```text
                    ┌─────────────────┐
                    │  Dim Customer   │
                    └────────┬────────┘
                             │
                             │
┌─────────────────┐          │          ┌─────────────────┐
│   Dim Product   │──────────┼──────────│   Fact Sales    │
└─────────────────┘          │          └─────────────────┘
                             │
                             │
                    Sales Transactions
```

### Fact Table

**Fact_Sales**

* Order ID
* Customer Key
* Product Key
* Sales Amount
* Quantity
* Order Date

### Dimension Tables

**Dim_Customer**

* Customer Key
* Customer ID
* Name
* Country
* Gender
* Birth Date

**Dim_Product**

* Product Key
* Product Name
* Category
* Subcategory
* Cost

---

## 🛠️ Tech Stack & Key SQL Concepts

### Technologies

* SQL Server / ANSI SQL
* Relational Database Management
* Dimensional Data Modeling
* Star Schema Architecture

### Advanced SQL Concepts

| Category             | Techniques                          |
| -------------------- | ----------------------------------- |
| Data Retrieval       | SELECT, Filtering, Sorting          |
| Data Integration     | INNER JOIN, LEFT JOIN               |
| Aggregation          | SUM(), COUNT(), AVG(), MIN(), MAX() |
| Window Functions     | RANK(), DENSE_RANK(), ROW_NUMBER()  |
| Running Calculations | Running Totals, Cumulative Revenue  |
| Partitioning         | PARTITION BY                        |
| Conditional Logic    | CASE WHEN                           |
| Date Analytics       | DATE Functions, Time Intelligence   |
| Query Optimization   | CTEs (Common Table Expressions)     |
| Segmentation         | Customer & Product Segmentation     |
| KPI Development      | Recency, AOV, Revenue Metrics       |

---

## 📈 Business Problems Solved & Core Analytics

### Customer Insights

Developed a comprehensive customer analytics report to support **Customer Segmentation**, retention analysis, and purchasing behavior evaluation.

#### Customer KPIs

* Total Orders
* Total Sales
* Total Quantity Purchased
* Total Products Purchased
* Customer Lifespan (Months)
* Recency (Months Since Last Purchase)
* Average Order Value (AOV)
* Average Monthly Spend

#### Customer Segmentation

* VIP Customers
* Regular Customers
* New Customers
* Age Group Classification

---

### Product Performance

Built a product analytics framework to evaluate revenue generation, customer reach, and product lifecycle performance.

#### Product KPIs

* Total Orders
* Total Sales
* Total Quantity Sold
* Unique Customers
* Product Lifespan (Months)
* Recency (Months Since Last Sale)
* Average Order Revenue (AOR)
* Average Monthly Revenue

#### Product Segmentation

* High Performers
* Mid-Range Performers
* Low Performers
* Cost-Based Product Segments

---

## 📊 Analytical Reports Developed

### 1. Change Over Time Analysis

Analyzed sales performance trends across months and years to identify growth patterns and seasonality.

### 2. Cumulative Analysis

Calculated monthly revenue and running totals using window functions for cumulative revenue tracking.

### 3. Performance Analysis

Compared yearly product sales against:

* Historical Average Sales
* Previous Year Sales Performance

### 4. Part-to-Whole Analysis

Measured category-level contribution to overall revenue to identify key revenue drivers.

### 5. Data Segmentation Analysis

Segmented products into cost ranges to understand pricing distribution and inventory composition.

---

## 💡 Key Business Insights Generated

* Identified high-value customer segments through behavioral and spending analysis.
* Measured revenue growth trends and seasonality patterns for improved forecasting and planning.
* Determined top-performing product categories contributing the highest share of overall sales.
* Enabled decision support through KPI-driven reporting and performance benchmarking.
* Highlighted underperforming products and opportunities for portfolio optimization.
* Developed executive-level reporting metrics to support strategic business decisions.

> **Business Impact:** This project demonstrates how SQL can be used beyond querying data to deliver Business Intelligence, Trend Analysis, Cohort Segmentation, KPI Development, and actionable insights for stakeholders.

---

## 🏁 How to Run

### Step 1: Create Database

```sql
CREATE DATABASE SalesAnalytics;
```

### Step 2: Create Tables

Run the scripts located in:

```text
/sql/schema/
```

### Step 3: Load Data

Import customer, product, and sales datasets.

Step 4: Execute Analysis Scripts

Run queries from:

```text
/sql/analysis/
```

### Step 5: Review Reports

Analyze generated outputs and KPIs to derive business insights.

---

### ⭐ Skills Demonstrated

**SQL • Data Analytics • Business Intelligence • Data Modeling • Star Schema • KPI Development • Executive Reporting • Customer Analytics • Product Analytics • Trend Analysis • Cohort Segmentation • Window Functions • CTEs • Data Segmentation • Decision Support • Data-Driven Decision Making**
