# Data Model Design

## Table of Contents

- [Source Systems](#source-systems)
- [Staging Tables](#staging-tables)
- [ODS Tables](#ods-tables)
- [Dimension Tables](#dimension-tables)
- [Fact Tables](#fact-tables)

---

# Data Model Design

## Project Overview

The Banking Customer Risk & Profitability Analytics Platform is designed using a layered data warehouse architecture.

The solution integrates customer, account, loan, transaction, and branch data from operational source systems. Data is processed through SAS ETL pipelines and stored within PostgreSQL data warehouse layers before being consumed by Power BI dashboards.

The architecture consists of:

- Staging Layer
- Operational Data Store (ODS)
- Data Warehouse (DWH)
- Data Mart Layer

## Source Systems

| Source Table       | Description                          |
| ------------------ | ------------------------------------ |
| Customer Master    | Core customer demographic records    |
| Account Master     | Bank account details and metadata    |
| Loan Master        | Loan product and agreement records   |
| Transaction Master | Raw financial transaction records    |
| Branch Master      | Branch location and operational data |

---

## Data Flow Architecture

Source Systems
↓
SAS ETL
↓
Staging Layer
↓
ODS Layer
↓
Data Warehouse
↓
Data Mart
↓
Power BI Dashboard

## Staging Tables

Intermediate landing zone for raw source data before transformation.

| Table Name      | Source Origin      |
| --------------- | ------------------ |
| stg_customer    | Customer Master    |
| stg_account     | Account Master     |
| stg_loan        | Loan Master        |
| stg_transaction | Transaction Master |
| stg_branch      | Branch Master      |

---

## ODS Tables

Operational Data Store — cleansed and conformed source data with full history.

| Table Name      | Source Staging  |
| --------------- | --------------- |
| ods_customer    | stg_customer    |
| ods_account     | stg_account     |
| ods_loan        | stg_loan        |
| ods_transaction | stg_transaction |
| ods_branch      | stg_branch      |

---

## Dimension Tables

Slowly Changing Dimensions (SCD) supporting the analytical star schema.

| Table Name   | Description                              |
| ------------ | ---------------------------------------- |
| dim_customer | Customer attributes and segmentation     |
| dim_account  | Account type, status, and classification |
| dim_branch   | Branch hierarchy and region mapping      |
| dim_date     | Calendar date attributes for time-series |

---

## Fact Tables

Grain-level transactional and derived metric tables for analytics.

| Table Name         | Description                                      |
| ------------------ | ------------------------------------------------ |
| fact_transaction   | Individual debit/credit transaction events       |
| fact_loan          | Loan disbursement, repayment, and balance facts  |
| fact_profitability | Revenue, cost, and margin metrics per account    |
| fact_risk          | Risk scores, exposure, and compliance indicators |

## Key Relationships

| Parent Table | Child Table        | Relationship |
| ------------ | ------------------ | ------------ |
| dim_customer | fact_transaction   | 1:M          |
| dim_customer | fact_loan          | 1:M          |
| dim_customer | fact_profitability | 1:M          |
| dim_customer | fact_risk          | 1:M          |
| dim_branch   | fact_transaction   | 1:M          |
| dim_branch   | fact_loan          | 1:M          |
| dim_date     | All Fact Tables    | 1:M          |
| dim_account  | fact_transaction   | 1:M          |

## Future Enhancements

The following enhancements may be incorporated in future releases:

- Real-time transaction ingestion
- Fraud detection analytics
- Machine Learning based risk scoring
- Customer churn prediction
- Automated SAS ETL scheduling
- Cloud migration to AWS/Azure/GCP
