-- Create a new table with transformed features
CREATE OR REPLACE TABLE `your_project_id.your_dataset_id.transformed_data` AS
SELECT
    patient_id,
    -- Convert 'time_in_hospital' into categories (short, medium, long stay)
    CASE 
        WHEN time_in_hospital <= 5 THEN 'short'
        WHEN time_in_hospital BETWEEN 6 AND 10 THEN 'medium'
        ELSE 'long'
    END AS stay_category,
    -- Sum outpatient, inpatient, and emergency visits into one total
    n_outpatient + n_inpatient + n_emergency AS total_visits,
    glucose_test,
    A1Ctest,
    change,
    diabetes_med,
    -- Aggregate data based on age and medical specialty (e.g., average time in hospital per group)
    medical_specialty,
    AVG(time_in_hospital) AS avg_time_in_hospital,
    COUNT(*) AS num_patients
FROM
    `your_project_id.your_dataset_id.hospital_readmissions`
GROUP BY
    patient_id, time_in_hospital, glucose_test, A1Ctest, change, diabetes_med, medical_specialty, age
ORDER BY
    patient_id;
