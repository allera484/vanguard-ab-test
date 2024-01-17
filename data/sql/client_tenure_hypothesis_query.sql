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
##############################################################################################################################
# Hypothesis on Client Tenure-Related Completion Rate:
-- Null Hypothesis: There is no discernible relationship between client tenure and the new design's completion rate.
-- Alternative Hypothesis: The new design's completion rate is greatly impacted by the length of the client's stay.

# Query to extract relevant columns from df_final_demo
SELECT 
    *
FROM
    df_final_demo;
    
# Query to extract relevant columns from df_final_demo
SELECT 
    *
FROM
    df_final_web_data;
    
# Query to extract relevant columns from df_final_experiment_clients
SELECT 
    *
FROM
    df_final_experiment_clients;
    
# Combine data from the three tables based on the client_id column.
SELECT 
    df_final_demo.client_id,
    df_final_demo.clnt_tenure_yr,
    df_final_demo.clnt_tenure_mnth,
    df_final_demo.clnt_age,
    df_final_demo.gender,
    df_final_demo.num_accts,
    df_final_demo.balance,
    df_final_demo.calls_6_mnth,
    df_final_demo.logons_6_mnth,
    df_final_web_data.process_step,
    df_final_experiment_clients.variation
FROM
    df_final_demo
        JOIN
    df_final_web_data ON df_final_demo.client_id = df_final_web_data.client_id
        JOIN
    df_final_experiment_clients ON df_final_demo.client_id = df_final_experiment_clients.client_id;
    
# Combine data from the three tables based on the client_id column and filter by the process_step column.
SELECT 
    df_final_demo.client_id,
    df_final_demo.clnt_tenure_yr,
    df_final_demo.clnt_tenure_mnth,
    df_final_demo.clnt_age,
    df_final_demo.gender,
    df_final_demo.num_accts,
    df_final_demo.balance,
    df_final_demo.calls_6_mnth,
    df_final_demo.logons_6_mnth,
    df_final_web_data.process_step,
    df_final_experiment_clients.variation
FROM
    df_final_demo
        JOIN
    df_final_web_data ON df_final_demo.client_id = df_final_web_data.client_id
        JOIN
    df_final_experiment_clients ON df_final_demo.client_id = df_final_experiment_clients.client_id
WHERE
    df_final_web_data.process_step IN ('step_3' , 'step_2', 'step_1', 'start', 'confirm');