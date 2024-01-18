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