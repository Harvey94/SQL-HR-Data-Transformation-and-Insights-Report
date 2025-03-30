HR Data Transformation and Insights Report
1. Data Extraction and Preparation
We started by extracting data from the hr_analytics table and creating a new table, hr_insights, to store our transformed dataset. After verifying the structure, we copied all records from hr_analytics into hr_insights.

We also cleaned the EmpID column by removing any unwanted characters to ensure consistency.

2. Data Cleaning and Standardization
Business Travel & Over18 Column Standardization
We standardized values in the BusinessTravel column to ensure uniformity (e.g., changing Travel_Rarely and TravelRarely to Travel Rarely).

The Over18 column values were converted from Y/N to Yes/No for better readability.

Handling Missing Data
We conducted a null check across all columns to identify any missing values.

3. Data Transformation
Categorizing Age Groups
To make age-related insights more meaningful, we categorized employees into the following groups:

Youth: 18–25

Young Adult: 26–35

Adult: 36–45

Matured Adult: 46–55

Senior: 56+

We created a new column, AgeCategory, to store these categories.

Categorizing Distance from Home
To better understand commuting patterns, we created DistanceCategory:

Very Close: 1–7 km

Close: 8–14 km

Far: 15–21 km

Very Far: 22–29 km

Work-Life Balance Categorization
We transformed WorkLifeBalance into a more understandable format:

1 → Poor

2 → Average

3 → Good

4 → Excellent

4. Identifying Employees for Promotion
We identified employees who meet the following promotion criteria:

Performance Rating = 4

Years at Company ≥ 5

Years in Current Role ≥ 5

Years Since Last Promotion ≥ 5

A new column, PromotionNeeded, was added to flag eligible employees. The count of employees meeting these criteria was also retrieved.

5. Column Name Formatting
To improve readability, we updated column names by adding spaces where needed. For example:

NumCompaniesWorked → Number of Companies Worked

YearsAtCompany → Years At Company

WorkLifeBalance → Work Life Balance

StockOptionLevel → Stock Option Level

6. Final Verification
After completing all transformations, we conducted a final check to ensure all changes were correctly applied, and no data was lost.

Conclusion
This data transformation process has significantly improved the dataset's clarity, making it easier to analyze trends and generate insights for HR decision-making. Key improvements include:
✅ Standardized and cleaned categorical values
✅ Created meaningful categories for age, distance, and work-life balance
✅ Identified employees eligible for promotion
✅ Reformatted column names for better readability

This structured dataset will now support more effective HR analytics and decision-making. 🚀

