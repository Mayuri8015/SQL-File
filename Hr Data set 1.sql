create database project1;
use project1;

CREATE TABLE hrdataset (
        `Employee_Name` VARCHAR(25) NOT NULL,
        `EmpID` DECIMAL(38, 0) NOT NULL,
        `MarriedID` BOOL NOT NULL,
        `MaritalStatusID` DECIMAL(38, 0) NOT NULL,
        `GenderID` BOOL NOT NULL,
        `EmpStatusID` DECIMAL(38, 0) NOT NULL,
        `DeptID` DECIMAL(38, 0) NOT NULL,
        `PerfScoreID` DECIMAL(38, 0) NOT NULL,
        `FromDiversityJobFairID` VARCHAR(32) ,
        `Salary` DECIMAL(38, 0) NOT NULL,
        `Termd` BOOL NOT NULL,
        `PositionID` DECIMAL(38, 0) NOT NULL,
        `Position` VARCHAR(28) NOT NULL,
        `State` VARCHAR(2) NOT NULL,
        `Zip` DECIMAL(38, 0) NOT NULL,
        `DOB` VARCHAR(30),
        `Sex` VARCHAR(2) NOT NULL,
        `MaritalDesc` VARCHAR(9) NOT NULL,
        `CitizenDesc` VARCHAR(19) NOT NULL,
        `HispanicLatino` varchar(10),
        `RaceDesc` VARCHAR(32) NOT NULL,
        `DateofHire` VARCHAR(32),
        `DateofTermination` VARCHAR(32) ,
        `TermReason` VARCHAR(32) NOT NULL,
        `EmploymentStatus` VARCHAR(22) NOT NULL,
        `Department` VARCHAR(20) NOT NULL,
        `ManagerName` VARCHAR(18) NOT NULL,
        `ManagerID` varchar(30),
        `RecruitmentSource` VARCHAR(23) NOT NULL,
        `PerformanceScore` VARCHAR(17) NOT NULL,
        `EngagementSurvey` DECIMAL(38, 2) NOT NULL,
        `EmpSatisfaction` DECIMAL(38, 0) NOT NULL,
        `SpecialProjectsCount` DECIMAL(38, 0) NOT NULL,
        `LastPerformanceReview_Date` VARCHAR(32) ,
        `DaysLateLast30` DECIMAL(38, 0) NOT NULL,
        `Absences` DECIMAL(38, 0) NOT NULL
);

select * from hrdataset;

select str_to_date(DateofHire,'%m/%d/%y') from hrdataset;

alter table hrdataset
add column date_of_hire_new  date after DateofHire;

update hrdataset
set date_of_hire_new= str_to_date(DateofHire,'%m/%d/%Y');



LOAD DATA INFILE  
'G:/hrdataset.csv'
into table hrdataset
FIELDS TERMINATED by ','
ENCLOSED by '"'
lines terminated by '\n'
IGNORE 1 ROWS;

#1.Count the total number of employees

select count(*)from hrdataset; 

SELECT COUNT(*) AS total_employees
FROM hrdataset; 

#2.Get the average salary of employees:

SELECT AVG(Salary) AS average_salary
FROM hrdataset;

#3 Count the number of employees by gender:

SELECT Sex, COUNT(*) AS employee_count
FROM hrdataset
GROUP BY Sex;

#4 Calculate the average engagement survey score by department:
SELECT Department, AVG(EngagementSurvey) AS avg_engagement_survey
FROM hrdataset
GROUP BY Department;

#5 Find the number of terminated employees by termination reason:
SELECT TermReason, COUNT(*) AS termination_count
FROM hrdataset
WHERE Termd = 1
GROUP BY TermReason;

#6Identify the top 5 managers with the highest number of employees:
SELECT ManagerName, COUNT(*) AS employee_count
FROM hrdataset
GROUP BY ManagerName
ORDER BY employee_count DESC
LIMIT 5;

#7 Calculate the average days late in the last 30 days by department:
SELECT Department, AVG(DaysLateLast30) AS avg_days_late
FROM hrdataset
GROUP BY Department;

#8 Get the count of employees by performance score:

SELECT PerformanceScore, COUNT(*) AS employee_count
FROM hrdataset
GROUP BY PerformanceScore;

#9 Calculate the average number of absences by marital status:
SELECT MaritalDesc, AVG(Absences) AS avg_absences
FROM hrdataset
GROUP BY MaritalDesc;


#10 Identify the recruitment sources and the number of employees hired from each:
SELECT RecruitmentSource, COUNT(*) AS employees_hired
FROM hrdataset
GROUP BY RecruitmentSource;
