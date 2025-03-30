select * from hr_analytics;

create table hr_insights
like hr_analytics;

select * from hr_insights;
insert hr_insights
select * from  hr_analytics;

select * from hr_insights;

ALTER TABLE hr_insights
CHANGE COLUMN `ï»¿EmpID` `EmpID` VARCHAR(255);

UPDATE hr_insights
set EmpID = REPLACE(EmpID, 'RM', '');



-- Lets Lookin to the dataset
select * from hr_insights;

-- Lets update the Business Travel column
select distinct BusinessTravel
from hr_insights;

UPDATE hr_insights
SET BusinessTravel = REPLACE(REPLACE(REPLACE(REPLACE(BusinessTravel, 'Travel_Rarely', 'Travel Rarely'), 'TravelRarely', 'Travel Rarely'), 'Travel_Frequently', 'Travel Frequently'), 'Non-Travel', 'Non Travel')
WHERE BusinessTravel IN ('Travel_Rarely', 'TravelRarely', 'Travel_Frequently', 'Non-Travel');

UPDATE hr_insights
SET Over18 = REPLACE(REPLACE(Over18, 'Y', 'Yes'), 'N', 'No')
WHERE  Over18 IN ('Y', 'N');

--  Check for nulls across all the columns
SELECT 
    SUM(CASE WHEN EmpID IS NULL THEN 1 ELSE 0 END) AS EmpID_nulls,
    SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS Age_nulls,
    SUM(CASE WHEN AgeGroup IS NULL THEN 1 ELSE 0 END) AS AgeGroup_nulls,
    SUM(CASE WHEN Attrition IS NULL THEN 1 ELSE 0 END) AS Attrition_nulls,
    SUM(CASE WHEN BusinessTravel IS NULL THEN 1 ELSE 0 END) AS BusinessTravel_nulls,
    SUM(CASE WHEN DailyRate IS NULL THEN 1 ELSE 0 END) AS DailyRate_nulls,
    SUM(CASE WHEN Department IS NULL THEN 1 ELSE 0 END) AS Department_nulls,
    SUM(CASE WHEN DistanceFromHome IS NULL THEN 1 ELSE 0 END) AS DistanceFromHome_nulls,
    SUM(CASE WHEN Education IS NULL THEN 1 ELSE 0 END) AS Education_nulls,
    SUM(CASE WHEN EducationField IS NULL THEN 1 ELSE 0 END) AS EducationField_nulls,
    SUM(CASE WHEN EmployeeCount IS NULL THEN 1 ELSE 0 END) AS EmployeeCount_nulls,
    SUM(CASE WHEN EmployeeNumber IS NULL THEN 1 ELSE 0 END) AS EmployeeNumber_nulls,
    SUM(CASE WHEN EnvironmentSatisfaction IS NULL THEN 1 ELSE 0 END) AS EnvironmentSatisfaction_nulls,
    SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS Gender_nulls,
    SUM(CASE WHEN HourlyRate IS NULL THEN 1 ELSE 0 END) AS HourlyRate_nulls,
    SUM(CASE WHEN JobInvolvement IS NULL THEN 1 ELSE 0 END) AS JobInvolvement_nulls,
    SUM(CASE WHEN JobLevel IS NULL THEN 1 ELSE 0 END) AS JobLevel_nulls,
    SUM(CASE WHEN JobRole IS NULL THEN 1 ELSE 0 END) AS JobRole_nulls,
    SUM(CASE WHEN JobSatisfaction IS NULL THEN 1 ELSE 0 END) AS JobSatisfaction_nulls,
    SUM(CASE WHEN MaritalStatus IS NULL THEN 1 ELSE 0 END) AS MaritalStatus_nulls,
    SUM(CASE WHEN MonthlyIncome IS NULL THEN 1 ELSE 0 END) AS MonthlyIncome_nulls,
    SUM(CASE WHEN SalarySlab IS NULL THEN 1 ELSE 0 END) AS SalarySlab_nulls,
    SUM(CASE WHEN MonthlyRate IS NULL THEN 1 ELSE 0 END) AS MonthlyRate_nulls,
    SUM(CASE WHEN NumCompaniesWorked IS NULL THEN 1 ELSE 0 END) AS NumCompaniesWorked_nulls,
    SUM(CASE WHEN Over18 IS NULL THEN 1 ELSE 0 END) AS Over18_nulls,
    SUM(CASE WHEN OverTime IS NULL THEN 1 ELSE 0 END) AS OverTime_nulls,
    SUM(CASE WHEN PercentSalaryHike IS NULL THEN 1 ELSE 0 END) AS PercentSalaryHike_nulls,
    SUM(CASE WHEN PerformanceRating IS NULL THEN 1 ELSE 0 END) AS PerformanceRating_nulls,
    SUM(CASE WHEN RelationshipSatisfaction IS NULL THEN 1 ELSE 0 END) AS RelationshipSatisfaction_nulls,
    SUM(CASE WHEN StandardHours IS NULL THEN 1 ELSE 0 END) AS StandardHours_nulls,
    SUM(CASE WHEN StockOptionLevel IS NULL THEN 1 ELSE 0 END) AS StockOptionLevel_nulls,
    SUM(CASE WHEN TotalWorkingYears IS NULL THEN 1 ELSE 0 END) AS TotalWorkingYears_nulls,
    SUM(CASE WHEN TrainingTimesLastYear IS NULL THEN 1 ELSE 0 END) AS TrainingTimesLastYear_nulls,
    SUM(CASE WHEN WorkLifeBalance IS NULL THEN 1 ELSE 0 END) AS WorkLifeBalance_nulls,
    SUM(CASE WHEN YearsAtCompany IS NULL THEN 1 ELSE 0 END) AS YearsAtCompany_nulls,
    SUM(CASE WHEN YearsInCurrentRole IS NULL THEN 1 ELSE 0 END) AS YearsInCurrentRole_nulls,
    SUM(CASE WHEN YearsSinceLastPromotion IS NULL THEN 1 ELSE 0 END) AS YearsSinceLastPromotion_nulls,
    SUM(CASE WHEN YearsWithCurrManager IS NULL THEN 1 ELSE 0 END) AS YearsWithCurrManager_nulls
FROM hr_insights;

-- Lets categorize the Age (Youth, Young Adult, Senior, Matured Adult, Adult)
select distinct Age
from hr_insights
order by age Desc;

SELECT 
    age,
    CASE 
        WHEN age BETWEEN 18 AND 25 THEN 'Youth'
        WHEN age BETWEEN 26 AND 35 THEN 'Young Adult'
        WHEN age BETWEEN 36 AND 45 THEN 'Adult'
        WHEN age BETWEEN 46 AND 55 THEN 'Matured Adult'
        ELSE 'Senior'
    END AS AgeCategory
FROM hr_insights;


ALTER TABLE hr_insights
ADD COLUMN AgeCategory VARCHAR(50);

UPDATE hr_insights
SET AgeCategory = 
    CASE 
        WHEN Age BETWEEN 18 AND 25 THEN 'Youth'
        WHEN Age BETWEEN 26 AND 35 THEN 'Young Adult'
        WHEN Age BETWEEN 36 AND 45 THEN 'Adult'
        WHEN Age BETWEEN 46 AND 55 THEN 'Matured Adult'
        ELSE 'Senior'
    END;
    
UPDATE hr_insights
SET AgeCategory = 
    CASE 
        WHEN Age BETWEEN 18 AND 25 THEN 'Youth'
        WHEN Age BETWEEN 26 AND 35 THEN 'Young Adult'
        WHEN Age BETWEEN 36 AND 45 THEN 'Adult'
        WHEN Age BETWEEN 46 AND 55 THEN 'Matured Adult'
        ELSE 'Senior'
    END;
-- lets categorize the Distance From Home
SELECT DISTINCT DistanceFromHome
FROM hr_insights
ORDER BY DistanceFromHome DESC;

SELECT 
    DistanceFromHome,
    CASE 
        WHEN DistanceFromHome BETWEEN 1 AND 7 THEN 'Very Close'
        WHEN DistanceFromHome BETWEEN 8 AND 14 THEN 'Close'
        WHEN DistanceFromHome BETWEEN 15 AND 21 THEN 'Far'
        WHEN DistanceFromHome BETWEEN 22 AND 29 THEN 'Very Far'
        ELSE 'Out of Range'
    END AS DistanceCategory
FROM hr_insights;

ALTER TABLE hr_insights
ADD COLUMN DistanceCategory VARCHAR(50);

UPDATE hr_insights
SET DistanceCategory = 
    CASE 
        WHEN DistanceFromHome BETWEEN 1 AND 7 THEN 'Very Close'
        WHEN DistanceFromHome BETWEEN 8 AND 14 THEN 'Close'
        WHEN DistanceFromHome BETWEEN 15 AND 21 THEN 'Far'
        WHEN DistanceFromHome BETWEEN 22 AND 29 THEN 'Very Far'
        ELSE 'Out of Range'
    END;
select * from hr_insights;

-- Work Life Balance Category (Poor, Average, Good, Excellent)
ALTER table hr_insights
add column WorkLifeBalanceCategory varchar(50);

update hr_insights
set WorkLifeBalanceCategory=
	case
		when WorkLifeBalance = 1 then 'Poor'
        when WorkLifeBalance = 2 then 'Average'
        when WorkLifeBalance = 3 then 'Good'
        else 'Excellent'
	end;

select * from hr_insights;
-- Employees that Need Automatic Promotions

ALTER TABLE hr_insights
ADD COLUMN PromotionNeeded VARCHAR(50);

UPDATE hr_insights
SET PromotionNeeded = 
    CASE 
        WHEN PerformanceRating = 4 
             AND YearsAtCompany >= 5 
             AND YearsInCurrentRole >= 5 
             AND YearsSinceLastPromotion >= 5 
        THEN 'Yes' 
        ELSE 'No' 
    END;
    
SELECT 	
    PromotionNeeded, 
    COUNT(*) AS EmployeeCount
FROM hr_insights
GROUP BY PromotionNeeded;

select * from hr_insights;
-- Change the column names to a more readable names
ALTER TABLE hr_insights
CHANGE COLUMN EmpID `Emp ID` VARCHAR(255),
CHANGE COLUMN Age `Age` INT,
CHANGE COLUMN AgeGroup `Age Group` VARCHAR(255),
CHANGE COLUMN Attrition `Attrition` VARCHAR(255),
CHANGE COLUMN BusinessTravel `Business Travel` VARCHAR(255),
CHANGE COLUMN DailyRate `Daily Rate` INT,
CHANGE COLUMN Department `Department` VARCHAR(255),
CHANGE COLUMN DistanceFromHome `Distance From Home` INT,
CHANGE COLUMN Education `Education` INT,
CHANGE COLUMN EducationField `Education Field` VARCHAR(255),
CHANGE COLUMN EmployeeCount `Employee Count` INT,
CHANGE COLUMN EmployeeNumber `Employee Number` INT,
CHANGE COLUMN EnvironmentSatisfaction `Environment Satisfaction` INT,
CHANGE COLUMN Gender `Gender` VARCHAR(255),
CHANGE COLUMN HourlyRate `Hourly Rate` INT,
CHANGE COLUMN JobInvolvement `Job Involvement` INT,
CHANGE COLUMN JobLevel `Job Level` INT,
CHANGE COLUMN JobRole `Job Role` VARCHAR(255),
CHANGE COLUMN JobSatisfaction `Job Satisfaction` INT,
CHANGE COLUMN MaritalStatus `Marital Status` VARCHAR(255),
CHANGE COLUMN MonthlyIncome `Monthly Income` INT,
CHANGE COLUMN SalarySlab `Salary Slab` VARCHAR(255),
CHANGE COLUMN MonthlyRate `Monthly Rate` INT,
CHANGE COLUMN NumCompaniesWorked `Number of Companies Worked` INT,
CHANGE COLUMN Over18 `Over 18` VARCHAR(255),
CHANGE COLUMN OverTime `Over Time` VARCHAR(255),
CHANGE COLUMN PercentSalaryHike `Percent Salary Hike` INT,
CHANGE COLUMN PerformanceRating `Performance Rating` INT,
CHANGE COLUMN RelationshipSatisfaction `Relationship Satisfaction` INT,
CHANGE COLUMN StandardHours `Standard Hours` INT,
CHANGE COLUMN StockOptionLevel `Stock Option Level` INT,
CHANGE COLUMN TotalWorkingYears `Total Working Years` INT,
CHANGE COLUMN TrainingTimesLastYear `Training Times Last Year` INT,
CHANGE COLUMN WorkLifeBalance `Work Life Balance` INT,
CHANGE COLUMN YearsAtCompany `Years At Company` INT,
CHANGE COLUMN YearsInCurrentRole `Years In Current Role` INT,
CHANGE COLUMN YearsSinceLastPromotion `Years Since Last Promotion` INT,
CHANGE COLUMN YearsWithCurrManager `Years With Current Manager` INT;

select * from hr_insights;
