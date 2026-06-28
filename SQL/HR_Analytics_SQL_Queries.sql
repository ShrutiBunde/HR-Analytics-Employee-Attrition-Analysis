SELECT *
FROM hr_data
LIMIT 10;

-- Total Employees
SELECT COUNT(*) AS Total_Employees
FROM hr_data;

-- Total Attrition
SELECT COUNT(*) AS Attrition_Count
FROM hr_data
WHERE Attrition = 'Yes';

-- Attrition Rate
SELECT
ROUND(
(COUNT(CASE WHEN Attrition='Yes' THEN 1 END) * 100.0)
/ COUNT(*),
2
) AS Attrition_Rate
FROM hr_data;

-- Employees by Department
SELECT
Department,
COUNT(*) AS Employee_Count
FROM hr_data
GROUP BY Department
ORDER BY Employee_Count DESC;

-- Attrition by Department
SELECT
Department,
COUNT(*) AS Attrition_Count
FROM hr_data
WHERE Attrition = 'Yes'
GROUP BY Department
ORDER BY Attrition_Count DESC;

-- Department-wise Attrition Rate
SELECT
    Department,
    COUNT(CASE WHEN Attrition='Yes' THEN 1 END) AS Attrition_Count,
    COUNT(*) AS Total_Employees,
    ROUND(
        COUNT(CASE WHEN Attrition='Yes' THEN 1 END) * 100.0
        / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY Department
ORDER BY Attrition_Rate DESC;

-- Attrition by Gender
SELECT
    Gender,
    COUNT(CASE WHEN Attrition='Yes' THEN 1 END) AS Attrition_Count,
    COUNT(*) AS Total_Employees,
    ROUND(
        COUNT(CASE WHEN Attrition='Yes' THEN 1 END) * 100.0
        / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY Gender
ORDER BY Attrition_Rate DESC;

-- Attrition by Overtime
SELECT
    OverTime,
    COUNT(CASE WHEN Attrition='Yes' THEN 1 END) AS Attrition_Count,
    COUNT(*) AS Total_Employees,
    ROUND(
        COUNT(CASE WHEN Attrition='Yes' THEN 1 END) * 100.0
        / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY OverTime;


-- Average Salary by Department
SELECT
    Department,
    ROUND(AVG(MonthlyIncome),2) AS Avg_Salary
FROM hr_data
GROUP BY Department
ORDER BY Avg_Salary DESC;

-- Top 10 Highest Paid Job Roles
SELECT
    JobRole,
    ROUND(AVG(MonthlyIncome),2) AS Avg_Salary
FROM hr_data
GROUP BY JobRole
ORDER BY Avg_Salary DESC
LIMIT 10;

-- Attrition by Job Role
SELECT
    JobRole,
    COUNT(CASE WHEN Attrition='Yes' THEN 1 END) AS Attrition_Count,
    COUNT(*) AS Total_Employees,
    ROUND(
        COUNT(CASE WHEN Attrition='Yes' THEN 1 END) * 100.0
        / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY JobRole
ORDER BY Attrition_Rate DESC;