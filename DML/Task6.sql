----  Departments cedvelinde manager_id-si bos olmayan departmentlerinin yerlesdiyi city,street_address melumatini cixaran sql yazin
select
city,
street_address
from locations
where location_id in (
select 
location_id
from departments
where 
manager_id is not null);

 ----  Employees cedvelinden max ve min salary alan butun iscilerin siyahisini cixarin
select
*
from employees
where salary in (
(select max(salary)
from employees),
(select
min(salary)
from employees));

---task8 Employees cedvelinden first_name, last_name, salary, average_salary ( bu umumi employees cedveli uzre butun iscilerin orta maasidir)
---ve eger maasi orta maasdan yuxaridirsa �Above total average salary� kicikdirse �Below total average salary� yazmaqla salary_status adli sutun cixarin 
select
first_name,
last_name,
salary,
(select
avg(salary)
from employees) as avg_salary,
case 
when salary > (select avg(salary)
from employees)
then 'Above total average salary'
else 'Below total average salary' 
end as  info_salary
from employees;
 
 ---  Countries, locations cedvellerini istifade etmekle location_id-si 1200,1800 araliginda olan olke adlarini cixarin
select distinct
c.country_name
from countries c
join locations l on c.country_id = l.country_id
where l.location_id
between 1200 and 1800;

----  Countries, locations,regions cedvellerini istifade etmekle location_id-si 1200,2000 araliginda olan olke adlarini ve region adlarini cixarin
select  
country_name,
region_name
from countries c
join regions r on c.region_id = r.region_id
where country_id in (
select country_id
from locations
where 
location_id between 1200 and 2000);


-----Jobs ve employees cedvellerini istifade etmekle job_title ve qarsisinda hemin job_title uzre isci sayini cixarin
select
(select
job_title
from jobs j 
where j.job_id = e.job_id) as job_title,
(select
count(*)
from employees e 
where e.job_id = e.job_id) as job_id
from employees e
group by e.job_id;


---- Jobs ve employees cedvellerini istifade etmekle first_name, last_name, salary ve jobs
---cedvelindeki min_salary,max_salary esasinda orta maas cixaran sql yazin
select
e.first_name,
e.last_name,
e.salary,
(select (j.min_salary + j.max_salary)
from jobs j
where j.job_id = e.job_id) as sahin
from employees e;


---Departments , employees cedvelinden istifade ederek iscisi olmayan department_name siyahisi cixarin.(exists ile)
select
department_name
from departments d
where not exists ( select 1
from employees e 
where e.department_id = d.department_id);



---Employees cedvelinde employee_id-si Kevin Feeney -nin employee_id-sinden boyuk olan iscileri cixarin.
select
*
from employees
where employee_id > ( 
select employee_id 
from employees 
where 
first_name = 'Kevin' and
last_name = 'FEENEY');


---Employees cedvelinden employee_id-si 146 olan isci ile eyni managere sahib iscimelumatlarini cixarin. ( subqueryle)
select
*
from employees
where manager_id = (
select manager_id 
from employees
where employee_id = 146);


---Employees cedvelinden salary-si 10000 olan isciler calisan departamentlerin butun iscilerinin siyahisini cixarin.( subqueryle)
select
*
from employees
where department_id in ( 
select department_id
from employees
where salary = 10000);

--Departments , employees cedvelinden istifade ederek job_id-si SA_REP olan ve ya salary-si
--15000-den boyuk olan iscilerin calisdigi department_name-lerin tekrarlanmayan siyahisini cixarin ( subqueryle)
select
department_name
from departments
where department_id in (
select department_id
from employees
where 
job_id = 'SA_REP' or salary > 15000);


---Salary-si 5000-den kicik olan iscilerin oldugu tekrarlanmayan job_title siyahisi cixarin
select
job_title
from jobs
where job_id IN (
select job_id 
from employees
where salary < 5000);

select 
first_name,
last_name,
job_id, 
salary
from employees
where salary < 5000;


select
*
from employees;