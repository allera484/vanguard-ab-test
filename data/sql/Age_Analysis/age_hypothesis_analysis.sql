
SELECT AVG(clnt_age) from merged_data
LEFT JOIN df_final_demo ON df_final_demo.client_id = merged_data.client_id
where TRIM(clnt_age) <> '' AND TRIM(clnt_age) <> '-1';
 -- 47.3551 AVE AGE 47--

SELECT AVG(clnt_age) from df_final_experimental_clients
LEFT JOIN df_final_demo ON df_final_demo.client_id = df_final_experimental_clients.client_id
where TRIM(clnt_age) <> '' AND TRIM(clnt_age) <> '-1'; 
-- 46.1807 AVE AGE 46--

select 
	df_final_experimental_clients.variation,
	CASE 
		WHEN df_final_experimental_clients.variation = 'TEST' THEN AVG(df_final_demo.clnt_age)
		WHEN df_final_experimental_clients.variation = 'CONTROL' THEN AVG(df_final_demo.clnt_age)
    END AS avg_age,
    count(*) as age_usage_count
from df_final_experimental_clients
LEFT JOIN df_final_demo ON df_final_demo.client_id = df_final_experimental_clients.client_id
WHERE (TRIM(clnt_age) <> '' AND TRIM(clnt_age) <> '-1')
GROUP BY df_final_experimental_clients.variation;

-- Would these changes encourage more clients to complete the process?
-- Based on the age_usage_count, there is an increase of approx 3K in the 'Test' sample with similar avg_age
