# Banking Analytics Platform – Dataset Design Document

## Purpose

This document describes the design and generation strategy for the synthetic banking dataset used in the Banking Analytics Platform project.

The objective is to simulate a realistic multinational banking environment similar to a large European financial institution operating across Germany and international markets.

---

# Dataset Overview

The dataset is designed to support:

- Customer Analytics
- Account Analytics
- Loan Analytics
- Transaction Analytics
- Branch Performance Analytics
- Profitability Reporting
- Risk Management Reporting

The generated data serves as the source system feeding the PostgreSQL Data Warehouse, SAS ETL pipelines, and Power BI dashboards.

---

# Dataset Volume

| Entity      | Record Count |
| ----------- | -----------: |
| Branch      |          100 |
| Customer    |       10,000 |
| Account     |       20,000 |
| Loan        |        5,000 |
| Transaction |      100,000 |

**Total Records:** 135,100

---

# Branch Distribution

The branch network is designed to simulate a multinational European bank.

| Country        | Number of Branches |
| -------------- | -----------------: |
| Germany        |                 70 |
| United Kingdom |                  8 |
| United States  |                  5 |
| Switzerland    |                  4 |
| France         |                  4 |
| Singapore      |                  3 |
| UAE            |                  3 |
| Netherlands    |                  3 |

Total Branches: 100

---

# Customer Distribution

The customer base is intentionally diversified to represent an international banking institution.

| Region        | Percentage |
| ------------- | ---------: |
| Germany       |        70% |
| Europe        |        20% |
| International |        10% |

Countries include:

- Germany
- France
- Italy
- Spain
- Netherlands
- Austria
- Switzerland
- United Kingdom
- United States
- India
- Singapore
- UAE

---

# Customer Segments

Customers are categorized into business segments for analytical reporting.

| Segment         | Distribution |
| --------------- | -----------: |
| Retail          |          60% |
| Affluent        |          20% |
| HNI             |          10% |
| Corporate       |           7% |
| Private Banking |           3% |

---

# Account Types

The platform supports multiple banking products.

- Savings
- Current
- Salary
- Premium
- Business
- Private Banking

---

# Loan Types

The loan portfolio includes:

- Mortgage Loan
- Personal Loan
- Auto Loan
- Education Loan
- Business Loan

---

# Risk Categories

Customers are assigned risk classifications.

| Risk Category | Distribution |
| ------------- | -----------: |
| Low           |          55% |
| Medium        |          25% |
| High          |          15% |
| Very High     |           5% |

---

# Data Relationships

The generated dataset follows referential integrity principles.

Customer
→ Account

Customer
→ Loan

Branch
→ Loan

Account
→ Transaction

Customer
→ Transaction

Branch
→ Transaction

This structure enables Foreign Key Validation, Lookup Validation, and Data Quality Testing during SAS ETL processing.

---

# Technology Usage

The generated dataset will be used across the following layers:

Source CSV Files
→ PostgreSQL Staging Layer
→ SAS ETL Processing
→ ODS Layer
→ Data Warehouse Layer
→ Reporting Mart Layer
→ Power BI Dashboards

---

# Business Objective

The dataset is designed to simulate a production-grade banking analytics ecosystem supporting executive reporting, customer segmentation, profitability analysis, branch performance tracking, risk management, and loan portfolio monitoring.
