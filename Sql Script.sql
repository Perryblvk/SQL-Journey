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
