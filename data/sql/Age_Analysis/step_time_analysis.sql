ALTER TABLE merged_data
MODIFY date_time datetime;

SHOW COLUMNS FROM merged_data;

SELECT t1.visit_id, 
TIMESTAMPDIFF(MINUTE, t1.date_time, t2.date_time) AS time_diff
FROM merged_data AS t1
JOIN merged_data AS t2 ON t1.visit_id = t2.visit_id and t1.visitor_id = t2.visitor_id
WHERE t1.process_step = 'step_1' AND t2.process_step = 'start'
HAVING time_diff <= 10;

SELECT visitor_id, time_diff
FROM (
    SELECT t1.visitor_id, 
    TIMESTAMPDIFF(MINUTE, t1.max_time, t2.max_time) as time_diff
    FROM (
        SELECT visitor_id, visit_id, MAX(date_time) as max_time
        FROM merged_data
        WHERE process_step = 'start'
        GROUP BY visitor_id, visit_id
    ) AS t1
    JOIN (
        SELECT visitor_id, visit_id, MAX(date_time) as max_time
        FROM merged_data
        WHERE process_step = 'step_1'
        GROUP BY visitor_id, visit_id
    ) AS t2 ON t1.visitor_id = t2.visitor_id AND t1.visit_id = t2.visit_id
) AS t
WHERE t.time_diff <= 10
ORDER BY time_diff DESC;

select * from merged_data
where visitor_id =  '275501885_48990882943'

SELECT t1.visitor_id,
TIMESTAMPDIFF(MINUTE, t1.min_time, t2.min_time) as time_diff_step_1_start,
TIMESTAMPDIFF(MINUTE, t2.min_time, t3.min_time) as time_diff_step_2_step_1,
TIMESTAMPDIFF(MINUTE, t3.min_time, t4.min_time) as time_diff_step_3_step_2,
TIMESTAMPDIFF(MINUTE, t4.min_time, t5.min_time) as time_diff_confirm_step_3
FROM (
    SELECT visitor_id, visit_id, MIN(date_time) as min_time
    FROM merged_data
    WHERE process_step = 'start'
    GROUP BY visitor_id, visit_id
) AS t1
JOIN (
    SELECT visitor_id, visit_id, MIN(date_time) as min_time
    FROM merged_data
    WHERE process_step = 'step_1'
    GROUP BY visitor_id, visit_id
) AS t2 ON t1.visitor_id = t2.visitor_id AND t1.visit_id = t2.visit_id
JOIN (
    SELECT visitor_id, visit_id, MIN(date_time) as min_time
    FROM merged_data
    WHERE process_step = 'step_2'
    GROUP BY visitor_id, visit_id
) AS t3 ON t2.visitor_id = t3.visitor_id AND t2.visit_id = t3.visit_id
JOIN (
    SELECT visitor_id, visit_id, MIN(date_time) as min_time
    FROM merged_data
    WHERE process_step = 'step_3'
    GROUP BY visitor_id, visit_id
) AS t4 ON t3.visitor_id = t4.visitor_id AND t3.visit_id = t4.visit_id
JOIN (
    SELECT visitor_id, visit_id, MIN(date_time) as min_time
    FROM merged_data
    WHERE process_step = 'confirm'
    GROUP BY visitor_id, visit_id
) AS t5 ON t4.visitor_id = t5.visitor_id AND t4.visit_id = t5.visit_id
HAVING time_diff_step_1_start <= 10
AND time_diff_step_2_step_1 <= 10
AND time_diff_step_3_step_2 <= 10
AND time_diff_confirm_step_3 <= 10;