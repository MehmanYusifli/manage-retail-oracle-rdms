-- Departments cədvəlində manager_id-si boş olmayan departmentlərin yerləşdiyi city və street_address məlumatını çıxaran sorğu
select
  city,
  street_address
from locations
where location_id in (
  select location_id
  from departments
  where manager_id is not null
);

-- Employees cədvəlindən max və min salary alan bütün işçilərin siyahısını çıxaran sorğu
select *
from employees
where salary in (
  (select max(salary) from employees),
  (select min(salary) from employees)
);

-- task8: Employees cədvəlindən first_name, last_name, salary, average_salary (bütün işçilərin orta maaşı)
-- və salary_status sütununu çıxaran sorğu
select
  first_name,
  last_name,
  salary,
  (select avg(salary) from employees) as avg_salary,
  case 
    when salary > (select avg(salary) from employees) then 'Above total average salary'
    else 'Below total average salary'
  end as salary_status
from employees;

-- Countries, locations cədvəllərindən location_id-si 1200 və 1800 aralığında olan ölkə adlarını çıxaran sorğu
select distinct
  c.country_name
from countries c
join locations l on c.country_id = l.country_id
where l.location_id between 1200 and 1800;

-- Countries, locations, regions cədvəllərindən location_id-si 1200 və 2000 aralığında olan ölkə və region adlarını çıxaran sorğu
select  
  c.country_name,
  r.region_name
from countries c
join regions r on c.region_id = r.region_id
where c.country_id in (
  select country_id
  from locations
  where location_id between 1200 and 2000
);

-- Jobs və employees cədvəllərindən job_title və həmin job_title üzrə işçi sayını çıxaran sorğu
select
  j.job_title,
  count(e.employee_id) as employee_count
from employees e
join jobs j on e.job_id = j.job_id
group by j.job_title;

-- Jobs və employees cədvəllərindən first_name, last_name, salary və jobs cədvəlindəki min_salary, max_salary əsasında orta maaşı çıxaran sorğu
select
  e.first_name,
  e.last_name,
  e.salary,
  (j.min_salary + j.max_salary) / 2 as avg_job_salary
from employees e
join jobs j on e.job_id = j.job_id;

-- Departments və employees cədvəllərindən işçisi olmayan departmentlərin adlarını çıxaran sorğu (exists ilə)
select
  department_name
from departments d
where not exists (
  select 1
  from employees e
  where e.department_id = d.department_id
);

-- Employees cədvəlindən employee_id-si Kevin Feeney-nin employee_id-sindən böyük olan işçiləri çıxaran sorğu
select *
from employees
where employee_id > (
  select employee_id
  from employees
  where first_name = 'Kevin' and last_name = 'Feeney'
);

-- Employees cədvəlindən employee_id-si 146 olan işçi ilə eyni manager-ə sahib işçiləri çıxaran sorğu (subquery ilə)
select *
from employees
where manager_id = (
  select manager_id
  from employees
  where employee_id = 146
);

-- Employees cədvəlindən salary-si 10000 olan işçilərin çalışdığı departmentlərin bütün işçilərini çıxaran sorğu (subquery ilə)
select *
from employees
where department_id in (
  select department_id
  from employees
  where salary = 10000
);

-- Departments və employees cədvəllərindən job_id-si 'SA_REP' olan və ya salary-si 15000-dən böyük olan işçilərin çalışdığı department_name-lərin təkrarlanmayan siyahısı (subquery ilə)
select distinct
  department_name
from departments
where department_id in (
  select department_id
  from employees
  where job_id = 'SA_REP' or salary > 15000
);

-- Salary-si 5000-dən kiçik olan işçilərin olduğu təkrarlanmayan job_title siyahısı
select distinct
  job_title
from jobs
where job_id in (
  select job_id
  from employees
  where salary < 5000
);

-- Salary-si 5000-dən kiçik olan işçilərin first_name, last_name, job_id və salary-sini çıxaran sorğu
select 
  first_name,
  last_name,
  job_id, 
  salary
from employees
where salary < 5000;

-- Bütün employees cədvəlini çıxaran sorğu
select *
from employees;
