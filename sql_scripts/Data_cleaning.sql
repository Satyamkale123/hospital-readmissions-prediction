-- Clean the data by removing rows where important columns are missing
CREATE OR REPLACE TABLE `your_project_id.your_dataset_id.cleaned_data` AS
SELECT *
FROM `your_project_id.your_dataset_id.transformed_data`
WHERE glucose_test != 'Unknown' AND A1Ctest != 'Unknown';
