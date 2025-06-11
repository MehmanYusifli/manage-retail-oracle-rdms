--- task11 H?r bir i?�inin ad, soyad?, job_id-sini v? 4-c� s�tunda �z jobu �zr? maximum maa?? �?xar?n.
select
first_name, 
 last_name, 
job_id, 
max(salary) 
over (partition by job_id) as max_salary
from employees;

---- task12  H?r bir i?�inin ad, soyad?, job_id-sini v? 4-c� s�tunda �z jobu �zr? minimum maa?? �?xar?n.
select
first_name, 
last_name, 
job_id, 
min(salary) 
over (partition by job_id) as min_salary
from employees;

---- task13 H?r bir i?�inin ad, soyad?, job_id-sini v? 4-c� s�tunda �z jobu �zr? maximum v? minimum maa?lar?n f?rqini �?xar?n.
select 
first_name, 
last_name, 
job_id, 
max(salary) over (partition by job_id) - min(salary) over (partition by job_id) as salary_difference
from employees;


---- task14  H?r bir i?�inin ad, soyad?, job_id-sini v? 4-c� s�tunda �z jobu �zr? maximum v? minimum maa?lar?n f?rqi
---2000-d?n b�y�k deyils?, 'Normal',
---2000-d?n b�y�k v? 5000-d?n ki�ikdirs? (<=), 'Problem',
---5000-d?n b�y�kd�rs?, 'Ciddi Problem' yaz?ls?n.
select 
first_name, 
last_name, 
job_id, 
case 
when max(salary) over (partition by job_id) - min(salary) over (partition by job_id) <= 2000 then 'Normal'
when max(salary) over (partition by job_id) - min(salary) over (partition by job_id) > 2000 
and max(salary) over (partition by job_id) - min(salary) over (partition by job_id) <= 5000 then 'Problem'
when max(salary) over (partition by job_id) - min(salary) over (partition by job_id) > 5000 then 'Ciddi Problem'
end as status
from employees;


---- task15  H?r bir i?�inin employee_id, ad, soyad, hire_date, salary v? 6-ci s�tunda hire_date �zr? ascending
---d�z�l�?d? �z�nd?n 2 s?tr ?vv?lki il? �z�nd?n 3 s?tr sonrak? salary-l?rin c?mini �?xar?n.
select 
first_name,    
last_name,
employee_id,
hire_date,
salary,
(salary - 
(lag(salary, 2) over (order by hire_date)) - 
(lead(salary, 3) over (order by hire_date))
) as salary
from employees
order by hire_date ;


----  task 16 Max maa? alan i?�inin ad, soyad v? maa??n? �?xar?n.
select 
first_name, 
last_name, 
salary
from 
(
    select 
    first_name, 
    last_name, 
    salary, 
           rank() over (order by salary desc) as rank
    from employees
) as ranked_employees
where rank = 1;


---- task23

H?r bir i?�inin ad, soyad v? 3-c� s�tunda h?min adam?n ad?n?n ?lifda s?ras? �zr? d�z�l�?d?
F?RQL? ne�?n�i ad oldu?unu �?xar?n.
SELECT 
    first_name,
    last_name,
    DENSE_RANK() OVER (ORDER BY first_name) AS ad_siraliq
FROM 
    employees;
    
    
    
    
    
    
with ranked_employees as (
    select 
        first_name,
        last_name,
        dense_rank() over (order by last_name) as ad
    from employees
)
select 
*
from ranked_employees
WHERE ad = 2;




------H?r regionda yerl???n �lk?l?rin say?n? �?xaran SQL yaz?n. N?tic?d? iki s�tun olacaq: region_id, count_country.
select
region_id,

count(*) as count_country
from countries
group by region_id;

---- Employees c?dv?lind? h?r department_id �zr?, commission_pct s�tunlar?n?n null olan v? null olmayan s?tirl?rin saylar?n? �?xaran sql yaz?n. N?tic?d? �� s�tun olacaq: department_id, null_count,
--notnull_count
select
department_id,
count(case when commission_pct is null then 1  end ) as null_count,
count(case when commission_pct  is not null then 1 end ) as notnull_count
from employees
group by department_id;

----Department_id-si 90 olan i?�il?rin maa? c?mini tapan sor?u yaz?n .
SELECT
SUM(salary) 
FROM employees
WHERE department_id = 90;


---.Ad? A h?rfi il? ba?layan i?�il?rin maa? ortalamas?n? tapan sor?u yaz?n.
select
 AVG(SALARY) as SALARY
FROM EMPLOYEES 
WHERE upper(FIRST_NAME) LIKE 'A%';

----.H?r bir department-d? ne�? i?�i oldu?unu tapan sor?u yaz?n. N?tic?d? 2 s�tun olsun
select
department_id, 
count(*) as employee_count
from employees
group by department_id;

---Departments c?dv?lind?n manager_id s�tununda null olan s?tirl?rin say?n? tap?n
select
count(*) 
from departments
where manager_id is null;

----Locations c?dv?lind?n locations c?dv?lind?n  location_id -nin maksimal qiym?tini tap?n.
select
max (location_id) 
from locations;

----- H?r bir country_id �zr? street_address say?n? tapan sor?u yaz?n.
select country_id,
count(street_address) 
from locations
group by country_id;
