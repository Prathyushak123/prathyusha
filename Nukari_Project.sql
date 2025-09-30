use naukari;

create table Job_Seeker
(
Seeker_Id INT primary key,
First_Name varchar(50),
Last_Name varchar(50),
Gender ENUM('Male','Female'),
Date_Of_Birth date,
Email varchar(100),
Phone_Number BIGINT,
City Varchar(50),
Qualification Varchar(50),
Experience_Years int
);

use naukari;
INSERT INTO Job_Seeker 
(Seeker_Id,First_Name, Last_Name, Gender, Date_Of_Birth, Email, Phone_Number, City, Qualification, Experience_Years)
VALUES
(1,'Rahul', 'Sharma', 'Male', '1995-03-15', 'rahul.sharma@gmail.com', 9876543210, 'Bangalore', 'B.Tech', 3),
(2,'Ananya', 'Verma', 'Female', '1997-07-21', 'ananya.verma@gmail.com', 9123456789, 'Hyderabad', 'MBA', 2),
(3,'Rohit', 'Kumar', 'Male', '1992-11-05', 'rohit.kumar@gmail.com', 9988776655, 'Delhi', 'MCA', 5),
(4,'Sneha', 'Iyer', 'Female', '1998-02-14', 'sneha.iyer@gmail.com', 9871234567, 'Chennai', 'B.Sc IT', 1),
(5,'Vikas', 'Patel', 'Male', '1994-09-09', 'vikas.patel@gmail.com', 9098765432, 'Ahmedabad', 'M.Tech', 4),
(6,'Priya', 'Nair', 'Female', '1996-12-01', 'priya.nair@gmail.com', 9123987654, 'Kochi', 'MBA', 2),
(7,'Arjun', 'Reddy', 'Male', '1993-04-22', 'arjun.reddy@gmail.com', 9345678123, 'Hyderabad', 'B.Com', 6),
(8,'Meera', 'Kapoor', 'Female', '1999-06-18', 'meera.kapoor@gmail.com', 9765432189, 'Mumbai', 'B.A', 1),
(9,'Karan', 'Singh', 'Male', '1991-01-27', 'karan.singh@gmail.com', 9812345678, 'Delhi', 'MBA', 7),
(10,'Neha', 'Gupta', 'Female', '1995-10-10', 'neha.gupta@gmail.com', 9654321789, 'Pune', 'B.Tech', 3);

select * from Job_Seeker;

create table Employers
(
Employer_Id INT primary key,
Company_Name varchar(100),
Industry varchar(50),
City varchar(50),
Email_Id varchar(100),
Phone_Number BIGINT
);

INSERT INTO Employers 
(Employer_Id,Company_Name, Industry, City, Email_Id, Phone_Number)
VALUES
(101,'Infosys','IT','Bangalore','contact@infosys.com',8041234567),
(102,'TCS','IT','Mumbai','hr@tcs.com',7722345678),
(103,'Wipro','IT','Hyderabad','careers@wipro.com',9023456789),
(104,'HDFC Bank','Banking','Mumbai','support@hdfcbank.com',9045678901),
(105,'Reliance','Oil & Gas','Vijayawada','info@ril.com',9223987654),
(106,'Tech Mahindra','IT Services','Pune','jobs@techmahindra.com',723456789),
(107,'Amazon','E-commerce','Bangalore','careers@amazon.in',8048765432),
(108,'Flipkart','E-commerce','Vizag','hr@flipkart.com',8042345678),
(109,'ICICI Bank','Banking','Chennai','careers@icicibank.com',9945671234),
(110,'Larsen & Toubro','Construction','Hyderabad','info@lnt.com',9445678912);

select * from Employers;

create table Jobs
(
Job_Id INT primary key,
Employer_Id INT, foreign key (Employer_Id) references Employers(Employer_Id),
Job_Title Varchar(50),
Descriptions TEXT,
Location varchar(50),
Salary_Min INT,
Salary_Max INT,
Experience_Years INT,
Job_Posted_Date date
);


select * from Jobs;

INSERT INTO Jobs
(Job_Id,Employer_Id, Job_Title, Descriptions, Location, Salary_Min, Salary_Max, Experience_Years, Job_Posted_Date)
VALUES
(1,101,'Software Engineer','Develop and maintain web applications using Java and Spring Boot.','Bangalore',400000,700000, 2,'2025-09-01'),
(2,102,'Data Analyst','Analyze business data and prepare reports using SQL and Power BI.','Mumbai',350000,600000,1,'2025-09-03'),
(3,103,'Cloud Engineer','Manage AWS cloud infrastructure and deployment automation.','Hyderabad',500000,900000,3,'2025-09-05'),
(4,104,'Banking Associate','Assist customers with loans, accounts, and financial products.','Mumbai',300000,500000,0,'2025-09-06'),
(5,105,'Petroleum Engineer','Work on refinery operations and oil exploration projects.','Mumbai',600000,1200000,4,'2025-09-07'),
(6,106,'Network Administrator','Maintain and secure enterprise network systems.','Pune',400000,750000,2,'2025-09-08'),
(7,107,'Operations Manager','Oversee logistics and operations for e-commerce warehouses.','Bangalore',700000,1200000, 5,'2025-09-09'),
(8,108,'UI/UX Designer','Design user-friendly interfaces for web and mobile apps.','Bangalore',350000,650000,1,'2025-09-10'),
(9,109,'Relationship Manager','Build and manage client relationships for banking services.','Chennai',400000,800000,3,'2025-09-11'),
(10,110,'Civil Engineer','Manage construction projects and ensure quality standards.','Hyderabad',500000,950000,2,'2025-09-11');


select * from Jobs;

create table Applications
(
Application_Id INT primary key,
Job_Id INT, foreign key (Job_Id) references Jobs(Job_Id),
Seeker_Id INT, foreign key (Seeker_Id) references Job_Seeker(Seeker_Id),
Application_Date date,
App_Status ENUM('Apply','Shortlisted','Rejected','Hired')
);

INSERT INTO Applications (Application_Id,Job_Id, Seeker_Id, Application_Date, App_Status)
VALUES
(1001,1, 1,'2025-09-02','Apply'),
(1002,2, 2,'2025-09-03','Shortlisted'),
(1003,3, 3,'2025-09-04','Rejected'),
(1004,4, 4,'2025-09-05','Apply'),
(1005,4, 5,'2025-09-06','Shortlisted'),
(1006,6, 6,'2025-09-07','Hired'),
(1007,7, 7,'2025-09-08','Apply'),
(1008,4, 8,'2025-09-09','Rejected'),
(1009,4, 9,'2025-09-10','Apply'),
(1010,10, 10,'2025-09-11','Shortlisted');

truncate table Applications;

select * from Applications;

create table Skills
(
Skill_Id INT primary key,
Seeker_Id INT, foreign key (Seeker_Id) references Job_Seeker(Seeker_Id),
Skill_Name varchar(100),
Proficiency ENUM('Beginner','Intermediate','Expert')
);

INSERT INTO Skills (Skill_Id, Seeker_Id, Skill_Name, Proficiency)
VALUES
(111, 1,'Software Engineer','Expert'),
(222, 1,'Data Analyst','Intermediate'),
(333, 1,'Cloud Engineer','Expert'),
(444, 1,'UI/UX Designer','Intermediate'),
(555, 5,'Petroleum Engineer','Intermediate'),
(666, 6,'Banking Associate','Beginner'),
(777, 7,'Operations Manager','Expert'),
(888, 8,'Civil Engineer','Intermediate'),
(999, 9,'Network Administrator','Intermediate'),
(1000, 10,'Relationship Manager','Intermediate');

truncate table Skills;

select * from Skills;

use naukari;

-- List all the Jobs seekers who have morethan 5 years of experience? --
select Seeker_Id,concat(First_Name,' ',Last_Name) as Full_Name
From Job_Seeker
where Experience_Years>5;

-- Find the distinct Industries of employeers in the portal? --
Select DISTINCT Industry
from Employers; 

- Show all jobs and the number of applications recieved for each job? --
select j.Job_Title,count(Application_Id)as Total_Applications
from Jobs j LEFT JOIN Applications a
ON a.Job_Id=j.Job_Id
group by j.Job_Title
order by Total_Applications DESC;

-- which skill is most common among job_seekers? --
select Skill_Name,count(*) as Total_Jobseekers
from Skills
group by Skill_Name
order by Total_Jobseekers DESC
Limit 1;

-- List the job_Seekers who applied to morethan 3 Jobs? -- 
select js.Seeker_Id,js.First_Name,count(a.Job_Id)as Total_App
From  Applications a JOIN Job_Seeker js
ON js.Seeker_Id=a.Seeker_Id
group by js.Seeker_Id,js.First_Name
Having count(a.Job_Id)>3;

use naukari;

-- Rank the Jobs by the Salary offered within each Industry? --
 select j.Job_Title,e.Industry,Salary_Min,Salary_Max,
 rank() over(partition by e.Industry order by Salary_Max  DESC)as Salary_Rank
 from Jobs j JOIN Employers  e
 ON e.Employer_Id=j.Employer_Id
 order by e.Industry,Salary_Rank;

--Find the job seekers who never applied for any job? --
select Seeker_Id,First_Name
from Job_Seeker 
where Seeker_Id NOT IN(Select Seeker_Id from Applications);

-- Show the Number of Applications recieved by each company? --
select e.Company_Name,count(Application_Id) as Num_Of_App
from Employers e JOIN Jobs j
ON j.Employer_Id=e.Employer_Id
LEFT JOIN Applications a
ON a.Job_Id=j.Job_Id
group by e.Company_Name;

-- find all jobs posted by TCS Comapany? --
select *from 
Jobs j JOIN Employers e
ON e.Employer_Id=j.Employer_Id
where e.Company_Name='TCS';

-- Show Cumulative application over-time? -- 
select Application_Date,Count(Application_Id) as Num_Of_App,
Sum(count(Application_Id)) over(order by Application_Date) as Cummulative
from Applications
Group by Application_Date
Order by Application_Date;

use naukari;

-- Get the most common skill in each city? --
SELECT js.City, s.Skill_Name, COUNT(*) AS skill_count
FROM Job_Seeker js
JOIN Skills s ON js.Seeker_id = s.Seeker_id
GROUP BY js.City, s.Skill_Name
HAVING COUNT(*) = (
    SELECT MAX(cnt)
    FROM (
        SELECT COUNT(*) AS cnt
        FROM Job_Seeker js2
        JOIN Skills s2 ON js2.Seeker_id = s2.Seeker_id
        WHERE js2.City = js.City
        GROUP BY s2.Skill_Name
    ) x
);

-- Find the Job with the highest salary in each industry? --
select j.Job_Id,j.Job_Title,e.Industry,j.Salary_Max,max(Salary_Max) as Highest
from Jobs j  JOIN  Employers e                                                                         
ON e.Employer_Id=j.Employer_Id
group by j.Job_Id,Job_Title
order by Highest DESC
Limit 1;

use naukari;
-- Find the percentage of Applications that got hired? --
SELECT 
   (SUM(CASE WHEN App_Status = 'Hired' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS hire_percentage
FROM Applications;

--Show the Seekers with morethan 2 Skills? --
SELECT js.Seeker_Id, js.First_Name, js.Last_Name, COUNT(s.Skill_Id) AS total_skills
FROM Job_Seeker js
JOIN Skills s ON js.Seeker_Id = s.Seeker_Id
GROUP BY js.Seeker_Id, js.First_Name, js.Last_Name
HAVING COUNT(s.Skill_Id) > 2;

-- Find Seekers who have applied to jobs only in the IT Industry? --
SELECT js.Seeker_Id, js.First_Name, js.Last_Name
FROM Job_Seeker js
WHERE NOT EXISTS (
    SELECT 1
    FROM Applications a
    JOIN Jobs j ON a.Job_Id = j.Job_Id
    JOIN Employers e ON j.Employer_id = e.Employer_id
    WHERE a.Seeker_Id = js.Seeker_Id
	AND e.Industry <> 'IT'
);
-- (or) --

SELECT js.Seeker_id, js.First_Name, js.Last_Name
FROM Job_Seeker js
LEFT JOIN Applications a ON js.Seeker_Id = a.Seeker_Id
LEFT JOIN Jobs j ON a.Job_Id = j.Job_Id
LEFT JOIN Employers e ON j.Employer_Id = e.Employer_Id
GROUP BY js.Seeker_Id, js.First_Name, js.Last_Name
HAVING COUNT(CASE WHEN e.Industry <> 'IT' THEN 1 END) = 0;

-- Find Jobs where the number of Apllications is above the average Applications per Job? --
SELECT j.Job_Id, j.Job_Title, COUNT(Application_Id) AS total_apps
FROM Jobs j LEFT JOIN Applications a
 ON j.Job_Id = a.Job_Id
GROUP BY j.Job_Id, j.Job_Title
HAVING COUNT(Application_Id) > (
    SELECT AVG(app_count)
    FROM (
        SELECT COUNT(*) AS app_count
        FROM Applications
        GROUP BY Job_Id
    ) x
);

use naukari;
-- Calculate the moving Average of apllications perday last 7 Days?
SELECT Application_Date,
COUNT(Application_Id) AS daily_apps,
AVG(COUNT(Application_Id)) OVER (ORDER BY Application_Date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS moving_avg
FROM Applications
GROUP BY Application_Date
ORDER BY Application_Date;

-- Find month with the highest number of job Postings? --
select Job_Posted_Date,Job_Title,count(Job_Id) as Total_Job_Ids,
MONTH(Job_Posted_Date) as months 
from Jobs
group by Job_Posted_Date,Job_Title
order by Total_Job_Ids DESC;

--Find the Conversion Rate for each Comapny? --
SELECT e.Company_Name,
       COUNT(a.Application_Id) AS total_apps,
       SUM(CASE WHEN a.App_Status = 'Shortlisted' THEN 1 ELSE 0 END) AS shortlisted,
       SUM(CASE WHEN a.App_Status = 'Hired' THEN 1 ELSE 0 END) AS hired,
       (SUM(CASE WHEN a.App_Status = 'Hired' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS hire_rate
FROM Employers e JOIN Jobs j 
ON e.Employer_Id = j.Employer_Id
JOIN Applications a 
ON j.Job_Id = a.Job_Id
GROUP BY e.Company_Name;

-- Show the top 3 most applied jobs in each Industry? --
SELECT Industry,Job_Title,rnk
from(
SELECT e.Industry, j.Job_Title, COUNT(a.Application_Id) AS total_apps,
RANK() OVER (PARTITION BY e.Industry ORDER BY COUNT(a.Application_Id) DESC) AS rnk
FROM Jobs j
JOIN Employers e ON j.Employer_Id = e.Employer_Id
JOIN Applications a ON j.Job_Id = a.Job_Id
GROUP BY e.Industry, j.Job_Title)x
where rnk<=3;
-- (or) --
SELECT Industry, Job_Title, Total_Apps, rnk
FROM (
    SELECT e.Industry,
           j.Job_Title,
           COUNT(a.Application_Id) AS total_apps,
           RANK() OVER (
               PARTITION BY e.Industry
               ORDER BY COUNT(a.Application_Id) DESC
           ) AS rnk
    FROM Jobs j
    JOIN Employers e ON j.Employer_Id = e.Employer_Id
    JOIN Applications a ON j.Job_Id = a.Job_Id
    GROUP BY e.Industry, j.Job_Title
) AS ranked_jobs
WHERE rnk <= 3
ORDER BY Industry, rnk;

-- Find the job with the Highest higher to Application ratio? --
SELECT j.Job_Id, j.Job_Title,
SUM(CASE WHEN a.App_Status = 'Hired' THEN 1 ELSE 0 END) * 1.0 / COUNT(*) AS hire_ratio
FROM Jobs j
JOIN Applications a ON j.Job_Id = a.Job_Id
GROUP BY j.Job_Id, j.Job_Title
ORDER BY hire_ratio DESC;

-- we want frequency check the job-Seekers and their Applications using Views? --
CREATE VIEW SeekerApplications AS
SELECT js.Seeker_Id, js.First_Name, js.Last_Name, j.Job_Title, a.App_Status
FROM Job_Seeker js
JOIN Applications a ON js.Seeker_Id = a.Seeker_Id
JOIN Jobs j ON a.Job_Id = j.Job_Id;


