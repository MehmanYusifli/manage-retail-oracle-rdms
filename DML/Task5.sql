-----Department_id-si 90 olan i?�il?rin maa? c?mini tapan sor?u yaz?n .
select
sum(salary) AS sahin
from employees
where department_id = 90;

---- Ad? A h?rfi il? ba?layan i?�il?rin maa? ortalamas?n? tapan sor?u yaz?n.
select
avg(salary) as sahin
from employees
where first_name like 'A%';

---- H?r bir department-d? ne�? i?�i oldu?unu tapan sor?u yaz?n.
select 
department_id, 
count(*) as sahin
from employees
group by department_id;

---- Departments c?dv?lind?n manager_id s�tununda null olan s?tirl?rin say?n? tap?n.
select 
count(*) as sahin
from departments
WHERE manager_id is null;

---- Locations c?dv?lind?n locations c?dv?lind?n  location_id -nin maksimal qiym?tini tap?n.
select
max(location_id) as sahin
from locations;

----H?r bir country_id �zr? street_address say?n? tapan sor?u yaz?n.
select
country_id,
count(street_address) as sahin
from locations
group by country_id;

----- Employees c?dv?lind?n 110-cu department-d?ki  maksimum maa?la minimum maa??n f?rqini tap?n.
select
max(salary) - min(salary) as mehman
from employees
where department_id = 110;

select
salary,
department_id
from employees;


---- 70-ci department-d?ki i?�i say?n? tapan sql sor?usu yaz?n.
select 
count(*) as sahin
from employees
where department_id = 70;

---- Ad?n?n uzunlu?u 5-d?n b�y�k olan i?�il?rin orta maa??n? tapan sor?u yaz?n.
select 
avg(salary) as sahin
from employees
where 
length(first_name) > 5;

----- Orta maa?? 7000-d?n �ox olan departmentl?ri tap?n
select department_id,
avg(salary) As sahin
from employees
group by department_id;

---- task2 Salary-si 10000-d?n �ox olan department-d? i?l?y?n i?�il?ri department adlar?n? tapan sor?u yaz?n.
select
distinct department_name
from Departments
where department_id 
in (select 
distinct department_id
from Employees
where salary > 10000);


----- task3  Adminstration departmentinin yerl??diyi k��?nin ad?n? tap?n. (departments v? locations c?dv?ll?rind?n istifad? etm?kl?)
select
street_address
from locations
where location_id = (select 
location_id
from departments
where department_name = 'Administration');



---- task5 50-ci department-d? i?l?m?y?n ,maa??  50-ci departmentd?ki i?�il?rin orta maa??nda �ox olan i?�il?ri tap?n.
select
department_id,
e.salary
from employees e
where e.department_id <> 50
and e.salary > (select avg(salary)
from employees e
where department_id=50);


