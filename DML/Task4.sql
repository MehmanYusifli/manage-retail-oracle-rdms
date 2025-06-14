-- task11: Hər bir işçinin ad, soyad, job_id və 4-cü sütunda öz jobu üzrə maksimum maaşı çıxarır.
select
  first_name, 
  last_name, 
  job_id, 
  max(salary) over (partition by job_id) as max_salary
from employees;

-- task12: Hər bir işçinin ad, soyad, job_id və 4-cü sütunda öz jobu üzrə minimum maaşı çıxarır.
select
  first_name, 
  last_name, 
  job_id, 
  min(salary) over (partition by job_id) as min_salary
from employees;

-- task13: Hər bir işçinin ad, soyad, job_id və 4-cü sütunda öz jobu üzrə maksimum və minimum maaşların fərqini çıxarır.
select 
  first_name, 
  last_name, 
  job_id, 
  max(salary) over (partition by job_id) - min(salary) over (partition by job_id) as salary_difference
from employees;

-- task14: Hər bir işçinin ad, soyad, job_id və 4-cü sütunda öz jobu üzrə maaş fərqinə görə status çıxarır.
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

-- task15: Hər bir işçinin employee_id, ad, soyad, hire_date, salary və hire_date üzrə sıralanmışda əvvəlki və sonrakı maaşların fərqi.
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
order by hire_date;

-- task16: Maksimum maaş alan işçinin ad, soyad və maaşı.
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

-- task23: Hər bir işçinin ad, soyad və adın əlifba sırasına görə sıralanması; sonra ikinci sıralıq işçiləri seçmək.
SELECT 
  first_name,
  last_name,
  DENSE_RANK() OVER (ORDER BY first_name) AS ad_siraliq
FROM employees;

with ranked_employees as (
  select 
    first_name,
    last_name,
    dense_rank() over (order by last_name) as ad
  from employees
)
select *
from ranked_employees
WHERE ad = 2;

-- task_region_country_count: Hər regionda yerləşən ölkələrin sayını çıxarır.
select
  region_id,
  count(*) as count_country
from countries
group by region_id;

-- task_commission_null_counts: Employees cədvəlində hər department_id üzrə commission_pct sütununda null və null olmayan sətirlərin sayı.
select
  department_id,
  count(case when commission_pct is null then 1 end) as null_count,
  count(case when commission_pct is not null then 1 end) as notnull_count
from employees
group by department_id;

-- task_salary_sum_dept_90: Department_id-si 90 olan işçilərin maaş cəmi.
SELECT
  SUM(salary) 
FROM employees
WHERE department_id = 90;

-- task_avg_salary_name_a: Adı A hərfi ilə başlayan işçilərin maaş ortalaması.
select
  AVG(salary) as salary
FROM employees 
WHERE upper(first_name) LIKE 'A%';

-- task_employee_count_per_dept: Hər bir departmentdə neçə işçi olduğunu çıxarır.
select
  department_id, 
  count(*) as employee_count
from employees
group by department_id;

-- task_departments_null_managers: Departments cədvəlində manager_id sütunu null olan sətirlərin sayı.
select
  count(*) 
from departments
where manager_id is null;

-- task_max_location_id: Locations cədvəlində location_id-nin maksimal dəyəri.
select
  max(location_id) 
from locations;

-- task_street_address_count_per_country: Hər bir country_id üzrə locations cədvəlində street_address sayını tapır.
select
  country_id,
  count(street_address) 
from locations
group by country_id;
