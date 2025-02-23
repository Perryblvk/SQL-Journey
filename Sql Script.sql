SELECT employee_id, Last_name, age, birth_date , age * 10
FROM parks_and_recreation.employee_demographics;
# PEMDAS
-- AND OR NOT --- Logical Operators
Select Last_name, First_name, Gender, Age, birth_date
FROM parks_and_recreation.employee_demographics
where age != 44
and gender = 'female'
;

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
-- GROUP BY AND ORDER BY
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
