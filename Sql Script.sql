SELECT employee_id, Last_name, age, birth_date , age * 10
FROM parks_and_recreation.employee_demographics;
# PEMDAS
-- AND OR NOT --- Logical Operators
Select Last_name, First_name, Gender, Age, birth_date
FROM parks_and_recreation.employee_demographics
where age != 44
and gender = 'female'
;
--- Insert data in a table
Insert Into parks_and_recreation.employee_demographics
  (Last_name, First_name, Gender, Age, birth_date)
Values
  ('Femi', 'Adeoye', 'Male', 40, '19/12/1998' )
;
-- Update inputted data in a table
Update parks_and_recreation.employee_demographics
Set Age = 45
where Last_Name = 'Femi' and First_Name = 'Adeoye'
;
--Limit the result returned to Top 8
select * from parks_and_recreation.employee_demographics
limit 8;

-- Script to a specified column based on the first name using the Like syntax
Select *
from parks_and_recreation.employee_demographics
where first_name Like '%Apr%'
;
-- Script to a specified column that starts with A and three other alphabets using the Like syntax
Select *
from parks_and_recreation.employee_demographics
where first_name Like 'A____%'
;
-- Script to a specified column based on the birth date using the Like syntax

Select *
from parks_and_recreation.employee_demographics
where birth_date Like '1989%'
;
-- GROUP BY AND ORDER BY.
-- GROUP BY

Select gender, avg(Age), max(Age), min(Age), count(Age)
from parks_and_recreation.employee_demographics
group by gender
;

Select occupation, salary
from parks_and_recreation.employee_salary
group by occupation, salary
;
-- Order by
Select *
from parks_and_recreation.employee_demographics
-- order by last_name desc
order by Gender, Age asc
;

--What are the 3 largest radius moons of Saturn?
Select * FROM moons 
where planet = 'Saturn' 
order by radius 
DESC LIMIT 3
;
-- what are the 5 largest area countries of Africa?
Select * FROM countries 
where continent = 'Africa' 
order by area 
DESC limit 5
;
--Select the 6 smallest countries of South America that have a population greater than 10 thousand.
Select * FROM countries 
where continent = 'South America' 
AND population > 10000 
order by area 
asc limit 6
;
-- retrieve the substrate column and count the number of vehicles for each substrate.
select substrate, count (vehicle) from vehicles 
group by substrate
;
select * from person.Person
where BusinessEntityID in (1,2,3,4,5,6,7,8)
Order by EmailPromotion desc
;
SELECT * FROM movies_tb
where Score > 70
order by Score desc
;
-- Movies with action Genre and rated PG-13

SELECT * FROM movies_tb
where Genre = 'Action' and Rating = 'PG-13'
;
-- To showcase length(No) of text in Ratings column
select Rating,
Len (Rating) as "Length of Text in rating"
from dbo.movies_tb
;
-- Movies released after 2010

SELECT * FROM movies_tb
where Release_Date > '2010-12-31'
;
-- OR

SELECT * FROM movies_tb
where year(Release_Date) > 2010
order by Release_Date desc
;

-- Generate Movie records for Movie ID, Movie Title, Genre, Movie_length, Director (for id 3,9,23,90,14,220,265,295,296,297,298,299,300)

SELECT Movie_Id, Movie_Title, Genre, Length_Minutes, Director
FROM movies_tb
where movie_id in (3,9,23,90,14,220,265,295,296,297,298,299,300)
;

-- No of movies by genre

SELECT Genre, count(genre) as sum_of_genre
from movies_tb
group by Genre
;
-- Number of movies by director

SELECT Director, count(Director) as no_of_movies_by_director
from movies_tb
group by Director
order by no_of_movies_by_director desc
;

-- Average Score of movies by genre
SELECT Genre, AVG(Score) as Average_Score
from movies_tb
group by Genre
order by Average_Score desc
;

-- Full meaning of rating abbrevation
Select Genre, Rating, Score,
-- PG = Parental Guidance
-- PG-13 = Parental Guidance 13
-- G = General Audience
-- R = Restricted
CASE
WHEN rating = 'PG' THEN 'Parental Guidance'
when rating = 'PG-13' THEN 'Parental Guidance 13'
when rating = 'G' THEN 'General Audience'
else 'Restricted'
END AS Rating_meaning
from movies_tb
;

select * from [Sales].[SalesPerson]

--- Answering Business question to state Total Sales by Years in Sales Table
Select YEAR(modifieddate) AS Years, Round(SUM(SalesYTD),1) as TotalSales
from Sales.SalesPerson
Group by Year(Modifieddate)
;
--- Tables callup
SELECT TOP 5 * FROM Person.Person
SELECT TOP 5 * FROM Person.BusinessEntity
SELECT TOP 5 * FROM Person.AddressType
-- THE JOIN SYNTAX
-- Inner Join/Join

Select pp.PersonType, pp.FirstName, pp.MiddleName , pp.LastName, pp.Demographics, pb.rowguid
from Person.Person as PP
Join person.BusinessEntity as PB
On PP.BusinessEntityID = PB.BusinessEntityID
;

SELECT TOP 5 * FROM Production.Product;
SELECT TOP 5 * FROM Person.Person;
SELECT TOP 5 * FROM Production.ProductCategory;
-- Right Join

Select G.Name, G.ProductNumber, G.SafetyStockLevel , g.ReorderPoint, h.ModifiedDate, H.rowguid,H.FirstName,H.LastName
from Production.Product as G
Right Join  person.Person H
On G.ProductID = H.BusinessEntityID
;

-- Left Join
Select G.Name, G.ProductNumber, G.SafetyStockLevel , g.ReorderPoint, h.ModifiedDate, H.rowguid,H.FirstName,H.LastName
from Production.Product as G
Left Join  person.Person H
On G.ProductID = H.BusinessEntityID
;

-- Full Join
Select G.Name, G.ProductNumber, G.SafetyStockLevel , g.ReorderPoint, h.ModifiedDate, H.rowguid,H.FirstName,H.LastName
from Production.Product as G
Full Join  person.Person H
On G.ProductID = H.BusinessEntityID
;

--Inner Join
Select G.Name, G.ProductNumber, G.SafetyStockLevel , g.ReorderPoint, h.ModifiedDate, H.rowguid,H.FirstName,H.LastName
from Production.Product as G
Join  person.Person H
On G.ProductID = H.BusinessEntityID
;
--Adding the where function and inner join
Select PS.employee_id,PD.first_name, PD.last_name, PD.age , PD.Gender, PD.Age * 2 AS "Multiply Age", PS.salary,PS.occupation,PS.dept_id
from parks_and_recreation.employee_demographics as PD
inner join parks_and_recreation.employee_salary as PS
On PD.employee_id = PS.employee_id
where PS.employee_id in (3,5,10,11,12,7)
;
--Adding the table join and Order by function to portray the result in ascending order by employee ID
Select PS.employee_id,PD.first_name, PD.last_name, PD.age , PD.Gender, PD.Age * 2 AS "Multiply Age", PS.salary,PS.occupation,PS.dept_id
from parks_and_recreation.employee_demographics as PD
join parks_and_recreation.employee_salary as PS
On PD.employee_id = PS.employee_id
order by PS.employee_id asc
;

--Adding the table join and Order by function to portray the result in ascending order by Salary
Select PS.employee_id,PD.first_name, PD.last_name, PD.age , PD.Gender, PD.Age * 2 AS "Multiply Age", PS.salary,PS.occupation,PS.dept_id
from parks_and_recreation.employee_demographics as PD
inner join parks_and_recreation.employee_salary as PS
On PD.employee_id = PS.employee_id
order by PS.salary asc
;
-- Combination of details from three tables
Select PP.BusinessEntityID,PP.PersonType,PP.FirstName,pp.LastName,pp.EmailPromotion, PB.rowguid,PB.ModifiedDate,PE.EmailAddress,PE.EmailAddressID
from Person.Person as PP
inner join Person.BusinessEntity as PB
On PP.BusinessEntityID = PB.BusinessEntityID
inner join Person.EmailAddress as PE
on (PP.BusinessEntityID=PE.BusinessEntityID and PB.BusinessEntityID=PE.BusinessEntityID)
;
-- Combinatiion of Inner join,as, On, and, where, In function to merge details from multiple tables  and filter by BusinessEntityID
Select PP.BusinessEntityID,PP.PersonType,PP.FirstName,pp.LastName,pp.EmailPromotion, PB.rowguid,PB.ModifiedDate,PE.EmailAddress,PE.EmailAddressID
from Person.Person as PP
inner join Person.BusinessEntity as PB
On PP.BusinessEntityID = PB.BusinessEntityID
inner join Person.EmailAddress as PE
on (PP.BusinessEntityID=PE.BusinessEntityID and PB.BusinessEntityID=PE.BusinessEntityID)
where PE.BusinessEntityID IN (1,2,3,4,5,6,7,8,9,18,30,245,247,850,10000)
;
-- Combinatiion of Inner join,as, On, and, where, In function to merge details from multiple tables  and filter by BusinessEntityID then arranged in Descending order by entity code
Select PP.BusinessEntityID,PP.PersonType,PP.FirstName,pp.LastName,pp.EmailPromotion, PB.rowguid,PB.ModifiedDate,PE.EmailAddress,PE.EmailAddressID
from Person.Person as PP
inner join Person.BusinessEntity as PB
On PP.BusinessEntityID = PB.BusinessEntityID
inner join Person.EmailAddress as PE
on (PP.BusinessEntityID=PE.BusinessEntityID and PB.BusinessEntityID=PE.BusinessEntityID)
where PE.BusinessEntityID IN (1,2,3,4,5,6,7,8,9,18,30,245,247,850,10000)
order by PP.BusinessEntityID desc
;

-- specify column with national ID as 245797967 and where the organization level number is (1,3,4)
select * from HumanResources.Employee
where OrganizationLevel in (1,3,4)
and NationalIDNumber = 245797967
;
-- Combination of inner join, the where and in syntax for filter while sorting in descending using Order by
Select HE.BusinessEntityID,HE.NationalIDNumber,HE.LoginID,HE.OrganizationNode ,HE.OrganizationLevel,HED.ModifiedDate,HED.DepartmentID,HED.StartDate,HED.EndDate
from HumanResources.Employee as HE
inner join HumanResources.EmployeeDepartmentHistory  as HED
On HE.BusinessEntityID = HED.BusinessEntityID
WHERE HED.BusinessEntityID IN (3,4,5,6,7,8,9,10)
order by HE.BusinessEntityID DESC
;
-- -- Combinatiion of Inner join,as, On, and, where, In function to merge details from multiple tables  and filter by BusinessEntityID then extract details where PersonType column is EM and Last Name is Matthew
Select PP.BusinessEntityID,PP.PersonType,PP.FirstName,pp.LastName,pp.EmailPromotion, PB.rowguid,PB.ModifiedDate,PE.EmailAddress,PE.EmailAddressID
from Person.Person as PP
inner join Person.BusinessEntity as PB
On PP.BusinessEntityID = PB.BusinessEntityID
inner join Person.EmailAddress as PE
on (PP.BusinessEntityID=PE.BusinessEntityID and PB.BusinessEntityID=PE.BusinessEntityID)
where PE.BusinessEntityID IN (1,2,3,4,5,6,7,8,9,18,30,245,247,850,10000)
and PP.PersonType = 'EM' and PP.LastName ='Matthew'
;
-- Combination of 4 tables using inner join, as, On, and, where, In function where person Type is EM and First name starts with letter R
Select PP.BusinessEntityID,PP.PersonType,PP.FirstName,pp.LastName,pp.EmailPromotion, PB.rowguid,PB.ModifiedDate,PE.EmailAddress,PE.EmailAddressID,ppd.PasswordHash,ppd.PasswordSalt
from Person.Person as PP
inner join Person.BusinessEntity as PB
On PP.BusinessEntityID = PB.BusinessEntityID
inner join Person.EmailAddress as PE
on (PP.BusinessEntityID=PE.BusinessEntityID and PB.BusinessEntityID=PE.BusinessEntityID)
inner join Person.Password as PPD
on (PP.BusinessEntityID=PE.BusinessEntityID and PB.BusinessEntityID=PE.BusinessEntityID and ppd.BusinessEntityID=PE.BusinessEntityID)
where PE.BusinessEntityID IN (1,2,3,4,5,6,7,8,9,18,30,245,247,850,10000) and pp.PersonType ='EM' and pp.FirstName like 'R%'
;
--Add AGE of staffs from their DOB
select BusinessEntityID, NationalIDNumber, LoginID, OrganizationNode, JobTitle, MaritalStatus, Gender, HireDate, VacationHours, BirthDate,
DATEDIFF(year, BirthDate, GETDATE())
          - CASE WHEN (MONTH(BirthDate) > MONTH(GETDATE())) 
                  OR (MONTH(BirthDate) = MONTH(GETDATE()) AND DAY(BirthDate) > DAY(GETDATE())) 
            THEN 1 ELSE 0 
			END AS Age
			from HumanResources.Employee
-- Combination of 4 tables adding concat In function where person Type is EM and First name starts with letter J
Select PP.BusinessEntityID,PP.PersonType,PP.FirstName,pp.LastName,pp.EmailPromotion, PB.rowguid,PB.ModifiedDate,PE.EmailAddress,PE.EmailAddressID,ppd.PasswordHash,ppd.PasswordSalt, CONCAT(pp.firstName, ' ','-',' ',PP.LastName)as FullName
from Person.Person as PP
inner join Person.BusinessEntity as PB
On PP.BusinessEntityID = PB.BusinessEntityID
inner join Person.EmailAddress as PE
on (PP.BusinessEntityID=PE.BusinessEntityID and PB.BusinessEntityID=PE.BusinessEntityID)
inner join Person.Password as PPD
on (PP.BusinessEntityID=PE.BusinessEntityID and PB.BusinessEntityID=PE.BusinessEntityID and ppd.BusinessEntityID=PE.BusinessEntityID)
where PE.BusinessEntityID IN (1,2,3,4,5,6,7,8,9,18,30,245,247,850,10000) and pp.PersonType ='EM' and pp.FirstName like 'J%'
	
-- multi-table SQL Server query joining Person and HumanResources schemas to compute employee ages, classify them into dynamic age groups (Minor, Adult, Aged), and order results from youngest to oldest for analytical insights.
Select PP.BusinessEntityID,PP.PersonType,PP.FirstName,pp.LastName,pp.EmailPromotion, PB.rowguid,PB.ModifiedDate,PE.EmailAddress,PE.EmailAddressID,ppd.PasswordHash,ppd.PasswordSalt,HE.jobTitle,HE.NationalIDNumber,
HE.MaritalStatus,HE.HireDate,HE.VacationHours,HE.SickLeaveHours,HE.BirthDate,
DATEDIFF(YEAR, HE.BirthDate, GETDATE())
      - CASE 
          WHEN (MONTH(HE.BirthDate) > MONTH(GETDATE())) 
               OR (MONTH(HE.BirthDate) = MONTH(GETDATE()) AND DAY(HE.BirthDate) > DAY(GETDATE())) 
          THEN 1 ELSE 0 
        END AS Age,
		CASE 
        WHEN (DATEDIFF(YEAR, HE.BirthDate, GETDATE())
              - CASE 
                  WHEN (MONTH(hE.BirthDate) > MONTH(GETDATE())) 
                       OR (MONTH(HE.BirthDate) = MONTH(GETDATE()) AND DAY(HE.BirthDate) > DAY(GETDATE())) 
                  THEN 1 ELSE 0 
                END) < 18 THEN 'Minor'
        WHEN (DATEDIFF(YEAR, HE.BirthDate, GETDATE())
              - CASE 
                  WHEN (MONTH(HE.BirthDate) > MONTH(GETDATE())) 
                       OR (MONTH(HE.BirthDate) = MONTH(GETDATE()) AND DAY(HE.BirthDate) > DAY(GETDATE())) 
                  THEN 1 ELSE 0 
                END) BETWEEN 18 AND 59 THEN 'Adult'
        ELSE 'Aged'
    END AS AgeGroup
from Person.Person as PP
inner join Person.BusinessEntity as PB
On PP.BusinessEntityID = PB.BusinessEntityID
inner join Person.EmailAddress as PE
on (PP.BusinessEntityID=PE.BusinessEntityID and PB.BusinessEntityID=PE.BusinessEntityID)
inner join Person.Password as PPD
on (PP.BusinessEntityID=PE.BusinessEntityID and PB.BusinessEntityID=PE.BusinessEntityID and ppd.BusinessEntityID=PE.BusinessEntityID)
inner join HumanResources.Employee as HE
on (PP.BusinessEntityID=PE.BusinessEntityID and PB.BusinessEntityID=PE.BusinessEntityID and ppd.BusinessEntityID=PE.BusinessEntityID and HE.BusinessEntityID=PE.BusinessEntityID)
ORDER BY 
    DATEDIFF(YEAR, HE.BirthDate, GETDATE()) 
    - CASE 
        WHEN (MONTH(HE.BirthDate) > MONTH(GETDATE())) 
             OR (MONTH(HE.BirthDate) = MONTH(GETDATE()) AND DAY(HE.BirthDate) > DAY(GETDATE())) 
        THEN 1 ELSE 0 
      END ASC;

--Consolidates employee data from multiple tables to generate a unified employee profile that includes personal, contact, and job details, calculating each employee’s age and age group, counting married employees and staff per job title, and sorting results from youngest to oldest.
Select PP.BusinessEntityID,PP.PersonType,PP.FirstName,pp.LastName,pp.EmailPromotion, PB.rowguid,PB.ModifiedDate,PE.EmailAddress,PE.EmailAddressID,ppd.PasswordHash,ppd.PasswordSalt,HE.jobTitle,HE.NationalIDNumber,
HE.MaritalStatus,HE.HireDate,HE.VacationHours,HE.SickLeaveHours,HE.BirthDate,
COUNT(CASE WHEN he.MaritalStatus = 'M' THEN 1 END) over() AS MarriedCount,
COUNT(*) OVER(PARTITION BY HE.JobTitle) AS StaffCountPerJobTitle,
DATEDIFF(YEAR, HE.BirthDate, GETDATE())
      - CASE 
          WHEN (MONTH(HE.BirthDate) > MONTH(GETDATE())) 
               OR (MONTH(HE.BirthDate) = MONTH(GETDATE()) AND DAY(HE.BirthDate) > DAY(GETDATE())) 
          THEN 1 ELSE 0 
        END AS Age,
		CASE 
        WHEN (DATEDIFF(YEAR, HE.BirthDate, GETDATE())
              - CASE 
                  WHEN (MONTH(hE.BirthDate) > MONTH(GETDATE())) 
                       OR (MONTH(HE.BirthDate) = MONTH(GETDATE()) AND DAY(HE.BirthDate) > DAY(GETDATE())) 
                  THEN 1 ELSE 0 
                END) < 18 THEN 'Minor'
        WHEN (DATEDIFF(YEAR, HE.BirthDate, GETDATE())
              - CASE 
                  WHEN (MONTH(HE.BirthDate) > MONTH(GETDATE())) 
                       OR (MONTH(HE.BirthDate) = MONTH(GETDATE()) AND DAY(HE.BirthDate) > DAY(GETDATE())) 
                  THEN 1 ELSE 0 
                END) BETWEEN 18 AND 59 THEN 'Adult'
        ELSE 'Aged'
    END AS AgeGroup
from Person.Person as PP
inner join Person.BusinessEntity as PB
On PP.BusinessEntityID = PB.BusinessEntityID
inner join Person.EmailAddress as PE
on (PP.BusinessEntityID=PE.BusinessEntityID and PB.BusinessEntityID=PE.BusinessEntityID)
inner join Person.Password as PPD
on (PP.BusinessEntityID=PE.BusinessEntityID and PB.BusinessEntityID=PE.BusinessEntityID and ppd.BusinessEntityID=PE.BusinessEntityID)
inner join HumanResources.Employee as HE
on (PP.BusinessEntityID=PE.BusinessEntityID and PB.BusinessEntityID=PE.BusinessEntityID and ppd.BusinessEntityID=PE.BusinessEntityID and HE.BusinessEntityID=PE.BusinessEntityID)
ORDER BY 
    DATEDIFF(YEAR, HE.BirthDate, GETDATE()) 
    - CASE 
        WHEN (MONTH(HE.BirthDate) > MONTH(GETDATE())) 
             OR (MONTH(HE.BirthDate) = MONTH(GETDATE()) AND DAY(HE.BirthDate) > DAY(GETDATE())) 
        THEN 1 ELSE 0 
      END ASC;
