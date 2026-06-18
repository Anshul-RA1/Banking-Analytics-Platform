--DROP TABLE IF EXISTS staging.stg_transaction;
--DROP TABLE IF EXISTS staging.stg_loan;
--DROP TABLE IF EXISTS staging.stg_account;
--DROP TABLE IF EXISTS staging.stg_customer;
--DROP TABLE IF EXISTS staging.stg_branch;

--stg_customer table

CREATE TABLE staging.stg_customer (
    customer_id       VARCHAR(20),
    customer_name     VARCHAR(100),
    gender            VARCHAR(10),
    city              VARCHAR(100),
    country           VARCHAR(50),
    occupation        VARCHAR(100),
    annual_income     NUMERIC(15,2),
    risk_category     VARCHAR(20),
    customer_since    DATE,
    customer_segment  VARCHAR(30),
    load_date         TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- stg_account

create table staging.stg_account( 
		account_id   varchar(20),
		customer_id  varchar(20),
		account_type varchar(50),
		balance      numeric(15,2),
		status       varchar(20),
		load_date    timestamp default current_timestamp
);

-- stg_loan

CREATE TABLE staging.stg_loan (
    loan_id           VARCHAR(20),
    customer_id       VARCHAR(20),
    branch_id         VARCHAR(20),
    loan_type         VARCHAR(50),
    loan_amount       NUMERIC(15,2),
    interest_rate     NUMERIC(5,2),
    loan_status       VARCHAR(20),
    loan_date         DATE,
    load_date         TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- stg_transaction

CREATE TABLE staging.stg_transaction (
    transaction_id    VARCHAR(20),
    account_id        VARCHAR(20),
    customer_id       VARCHAR(20),
    branch_id         VARCHAR(20),
    transaction_date  DATE,
    transaction_type  VARCHAR(20),
    amount            NUMERIC(15,2),
    load_date         TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- stg_branch 

CREATE TABLE staging.stg_branch (
    branch_id         VARCHAR(20),
    branch_name       VARCHAR(100),
    city              VARCHAR(100),
    region            VARCHAR(100),
    manager_name      VARCHAR(100),
    load_date         TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- verify staging table creation 

select table_schema,
		table_name
from information_schema.tables 
where table_schema = 'staging'
order by table_name ;

