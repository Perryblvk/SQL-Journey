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