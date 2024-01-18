# Hypothesis on Client Tenure:
-- Null Hypothesis: Those using the new method have an average customer tenure (length of time with Vanguard) that is equal 
-- to that of those using the old process.
-- Alternative Hypothesis: Those using the new method have a different average client tenure than those using the old process.

# Query to extract relevant columns from df_final_demo
SELECT 
    client_id, clnt_tenure_yr, clnt_tenure_mnth
FROM
    df_final_demo;
    
# Query to extract relevant columns from df_final_experiment_clients
SELECT 
    *
FROM
    df_final_experiment_clients;
    
# Combine data from both tables based on the client_id column.
SELECT 
    df_final_demo.client_id,
    df_final_demo.clnt_tenure_yr,
    df_final_demo.clnt_tenure_mnth,
    df_final_experiment_clients.variation
FROM
    df_final_demo
        JOIN
    df_final_experiment_clients ON df_final_demo.client_id = df_final_experiment_clients.client_id;
    
# Take the test group data only
SELECT 
    df_final_demo.client_id,
    df_final_demo.clnt_tenure_yr,
    df_final_demo.clnt_tenure_mnth,
    df_final_experiment_clients.variation
FROM
    df_final_demo
        JOIN
    df_final_experiment_clients ON df_final_demo.client_id = df_final_experiment_clients.client_id
WHERE
    df_final_experiment_clients.variation = 'control';
    
# Take the test group data only
SELECT df_final_demo.client_id,
    df_final_demo.clnt_tenure_yr,
    df_final_demo.clnt_tenure_mnth,
    df_final_experiment_clients.variation
FROM
    df_final_demo
        JOIN
    df_final_experiment_clients ON df_final_demo.client_id = df_final_experiment_clients.client_id
WHERE
    df_final_experiment_clients.variation = 'test';
    