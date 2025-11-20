-- Get average time in hospital by age group
SELECT
    age,
    AVG(time_in_hospital) AS avg_time_in_hospital
FROM
    `your_project_id.your_dataset_id.transformed_data`
GROUP BY
    age
ORDER BY
    avg_time_in_hospital DESC;
