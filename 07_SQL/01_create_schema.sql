-- =====================================================
-- Banking Analytics Platform
-- Schema Creation Script
-- =====================================================
-- STAGING : RAW DATA LANDING AREA
create schema if not exists staging;

-- ODS : CLEANED AND VALIDATED DATA
create schema if not exists ods;

-- DWH : FOR DATA MODELING / STAR SCHEMA / DIMENSION / FACTS / CARDINALITY / RELATIONSHIP
create schema if not exists dwh;

-- MART : BUSINESS READY REPORTING TABLES
create schema if not exists mart;

--====================================
-- Verify schema
--=====================================
select schema_name 
from information_schema.schemata 
order  by schema_name ;

