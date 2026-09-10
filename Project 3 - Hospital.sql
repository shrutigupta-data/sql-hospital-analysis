# SQL PROJECT 3 - Hospital
Use Project;
Select * from hospital;

#1. Total Number of Patients
-- Write an SQL query to find the total number of patients across all hospitals.
select sum(patients_count) as 'Total_Patients' from hospital;

#2. Average Number of Doctors per Hospital
-- Retrieve the average count of doctors available in each hospital.
Select Hospital_name, round(avg(doctors_count),2) as 'Avg_Doctor_count' from hospital
group by Hospital_name;

#3. Top 3 Departments with the Highest Number of Patients
-- Find the top 3 hospital departments that have the highest number of patients.
select department, sum(patients_count) as num_of_patients from hospital
group by department
order by num_of_patients desc limit 3;

#4. Hospital with the Maximum Medical Expenses
-- Identify the hospital that recorded the highest medical expenses.
select hospital_name, round(sum(medical_expenses),2) as 'medical_expense' from hospital
group by hospital_name
having sum(medical_expenses)
order by medical_expense desc limit 1;

#5. Daily Average Medical Expenses
-- Calculate the average medical expenses per day for each hospital.
SELECT 
    Hospital_Name, 
    Round(AVG(Medical_Expenses / ((Discharge_Date - Admission_Date) + 1)),2) AS Avg_Expenses_Per_Day
FROM Hospital
GROUP BY Hospital_Name;

#6. Longest Hospital Stay
-- Find the patient with the longest stay by calculating the difference between Discharge Date and Admission Date.
SELECT * ,DATEDIFF(
           STR_TO_DATE(discharge_date, '%d-%m-%Y'),
           STR_TO_DATE(admission_date, '%d-%m-%Y')
       ) AS stay_days
FROM hospital
order by stay_days desc limit 1;

#7. Total Patients Treated Per City
-- Count the total number of patients treated in each city.
select location, sum(patients_count) as 'Number_of_Patients' from hospital
group by location;

#8. Average Length of Stay Per Department
-- Calculate the average number of days patients spend in each department.
SELECT Department,round(avg(DATEDIFF(
           STR_TO_DATE(discharge_date, '%d-%m-%Y'),
           STR_TO_DATE(admission_date, '%d-%m-%Y')
       )),2) AS avg_stay_days
FROM hospital
group by Department;

#9. Identify the Department with the Lowest Number of Patients
-- Find the department with the least number of patients.
select department, sum(patients_count) as 'Number_of_Patients' from hospital
group by department
order by Number_of_Patients asc limit 1;

#10. Monthly Medical Expenses Report
-- Group the data by month and calculate the total medical expenses for each month.
SELECT
    DATE_FORMAT(
        STR_TO_DATE(admission_date, '%d-%m-%Y'),
        '%Y-%m'
    ) AS month,
    ROUND(SUM(medical_expenses), 2) AS total_medical_expense
FROM hospital
GROUP BY month
ORDER BY month;