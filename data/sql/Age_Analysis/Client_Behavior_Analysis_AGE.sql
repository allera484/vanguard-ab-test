-- Client Behavior Analysis
-- Who are the primary clients using this online process? Yonger or older? 
-- Based on the analysis the count is higher for clients over 50
select
MAX(clnt_age) as age,
count(*) as age_usage_count
from merged_data
LEFT JOIN df_final_demo ON df_final_demo.client_id = merged_data.client_id
WHERE (TRIM(clnt_age) <> '' AND TRIM(clnt_age) <> '-1')
GROUP BY df_final_demo.clnt_age
ORDER BY age_usage_count DESC

select
MAX(clnt_age) as age,
count(*) as age_usage_count
from merged_data
LEFT JOIN df_final_demo ON df_final_demo.client_id = merged_data.client_id
WHERE (TRIM(clnt_age) <> '' AND TRIM(clnt_age) <> '-1')
GROUP BY df_final_demo.clnt_age
ORDER BY age_usage_count DESC

select * from merged_data
Order by client_id DESC, process_step ASC

select
	MAX(clnt_age) as age,
    COUNT(CASE WHEN merged_data.process_step = 'start' THEN 1 ELSE NULL END) as start_count,
    COUNT(CASE WHEN merged_data.process_step = 'step_1' THEN 1 ELSE NULL END) as step_1_count,
    COUNT(CASE WHEN merged_data.process_step = 'step_2' THEN 1 ELSE NULL END) as step_2_count,
    COUNT(CASE WHEN merged_data.process_step = 'step_3' THEN 1 ELSE NULL END) as step_3_count,
    COUNT(CASE WHEN merged_data.process_step = 'confirm' THEN 1 ELSE NULL END) as finish_count
from merged_data
LEFT JOIN df_final_demo ON df_final_demo.client_id = merged_data.client_id
WHERE (TRIM(clnt_age) <> '' AND TRIM(clnt_age) <> '-1') 
GROUP BY df_final_demo.clnt_age
ORDER BY finish_count DESC, start_count DESC;