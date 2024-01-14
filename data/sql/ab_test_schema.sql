-- Create the ab_test schema
CREATE SCHEMA IF NOT EXISTS ab_test;

-- Create tables and add columns
USE ab_test;

-- Create df_final_demo table
CREATE TABLE IF NOT EXISTS df_final_demo (
    client_id INT PRIMARY KEY,
    clnt_tenure_yr INT,
    clnt_tenure_mnth INT,
    clnt_age INT,
    gender VARCHAR(20), 
    num_accts INT,
    balance FLOAT,
    calls_6_mnth INT,
    logons_6_mnth INT
);

-- Create df_final_experiment_clients table
CREATE TABLE IF NOT EXISTS df_final_experiment_clients (
    client_id INT PRIMARY KEY,
    variation VARCHAR(20),  -- Adjusted VARCHAR size
    FOREIGN KEY (client_id) REFERENCES df_final_demo(client_id)
);

-- Create df_final_web_data table
CREATE TABLE IF NOT EXISTS df_final_web_data (
    id INT PRIMARY KEY,
    client_id INT,
    visitor_id VARCHAR(100),
    visit_id VARCHAR(100),
    process_step VARCHAR(100),
    date_time DATETIME,
    FOREIGN KEY (client_id) REFERENCES df_final_demo(client_id)
);

-- Create df_final_web_data_missing table
CREATE TABLE IF NOT EXISTS df_final_web_data_missing (
    id INT PRIMARY KEY,
    client_id INT,
    visitor_id VARCHAR(100),
    visit_id VARCHAR(100),
    process_step VARCHAR(100),
    date_time DATETIME
);