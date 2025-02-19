SELECT employee_id, Last_name, age, birth_date , age * 10
FROM parks_and_recreation.employee_demographics;
# PEMDAS
Select Last_name, First_name, Gender, Age, birth_date
FROM parks_and_recreation.employee_demographics
where age != 44
and gender = 'female'
;
-- AND OR NOT --- Logical Operators

Select *
from parks_and_recreation.employee_demographics
where first_name Like '%Apr%'
;

Select *
from parks_and_recreation.employee_demographics
where first_name Like 'A____%'
;
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
