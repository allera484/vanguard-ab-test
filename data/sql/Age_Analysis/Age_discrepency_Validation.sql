select visitor_id
, process_step
, date_time
from merged_data
CASE when process_step = start and process_step = step_1 then TIMESTAMPDIFF(MINUTE, '2017-06-01 11:57:54', NOW()) AS minutes - TIMESTAMPDIFF(MINUTE, '2017-06-01 11:57:54', NOW()) AS minutes


SELECT t1.visitor_id
FROM merged_data AS t1
JOIN merged_data AS t2 ON t1.visitor_id = t2.visitor_id
WHERE t1.process_step = 'start' AND t2.process_step = 'step_1'
HAVING TIMESTAMPDIFF(MINUTE, STR_TO_DATE(t1.date_time, '%Y/%m/%d %H:%i:%s'), 
STR_TO_DATE(t2.date_time, '%Y/%m/%d %H:%i:%s')) <= 10;

-- Completion Rate:
-- Definition: The proportion of users who successfully reach the final 'confirm' step of the online process.
-- Calculation: Number of users who complete the 'confirm' step / Total number of users.

select count(distinct(visitor_id)) from merged_data 
where process_step = 'start';
-- Total 126,365

SELECT COUNT(DISTINCT confirm.visitor_id)
FROM 
    (SELECT visitor_id FROM merged_data WHERE process_step = 'start') start
JOIN 
    (SELECT visitor_id FROM merged_data WHERE process_step = 'confirm') confirm
ON start.visitor_id = confirm.visitor_id;
-- 78800

select count(visitor_id) from df_final_demo
JOIN merged_data ON merged_data.client_id = df_final_demo.client_id
where clnt_age >= 70;
-- distinct = 4,302
-- count = 30,904

select count(df_final_demo.client_id) from df_final_demo
LEFT JOIN merged_data ON merged_data.client_id = df_final_demo.client_id
where clnt_age >= 70;
-- distinct = 4,302
-- count = 30,904


select MAX(clnt_age) from df_final_demo;


