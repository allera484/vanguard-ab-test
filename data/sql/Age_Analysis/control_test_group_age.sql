-- Distribution of Age based control or test group
-- Control Group: Clients interacted with Vanguard’s traditional online process.
-- Test Group: Clients experienced the new, spruced-up digital interface.
select clnt_age, 
	COUNT(CASE WHEN df_final_experimental_clients.variation = 'TEST' THEN 1 END) as test_age_count,
	COUNT(CASE WHEN df_final_experimental_clients.variation = 'CONTROL' THEN 1 END) as control_age_count
from df_final_experimental_clients
LEFT JOIN df_final_demo ON df_final_demo.client_id = df_final_experimental_clients.client_id
WHERE (TRIM(clnt_age) <> '' AND TRIM(clnt_age) <> '-1')
GROUP BY df_final_demo.clnt_age
ORDER BY test_age_count DESC, control_age_count DESC;