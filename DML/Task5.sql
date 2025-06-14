----- Department_id-si 90 olan işçilərin maaş cəmini tapan sorğu.
select
  sum(salary) AS sahin
from employees
where department_id = 90;

---- Adı A hərfi ilə başlayan işçilərin maaş ortalamasını tapan sorğu.
select
  avg(salary) as sahin
from employees
where first_name like 'A%';

---- Hər bir departmentdə neçə işçi olduğunu tapan sorğu.
select 
  department_id, 
  count(*) as sahin
from employees
group by department_id;

---- Departments cədvəlində manager_id sütununda null olan sətirlərin sayını tapan sorğu.
select 
  count(*) as sahin
from departments
where manager_id is null;

---- Locations cədvəlində location_id-nin maksimal qiymətini tapan sorğu.
select
  max(location_id) as sahin
from locations;

---- Hər bir country_id üzrə street_address sayını tapan sorğu.
select
  country_id,
  count(street_address) as sahin
from locations
group by country_id;

----- Employees cədvəlində 110-cu departmentdəki maksimum maaşla minimum maaşın fərqini tapan sorğu.
select
  max(salary) - min(salary) as mehman
from employees
where department_id = 110;

-- Bütün employee-lərin maaş və department_id-lərini göstərən sorğu.
select
  salary,
  department_id
from employees;

---- 70-ci departmentdəki işçi sayını tapan sorğu.
select 
  count(*) as sahin
from employees
where department_id = 70;

---- Adının uzunluğu 5-dən böyük olan işçilərin orta maaşını tapan sorğu.
select 
  avg(salary) as sahin
from employees
where length(first_name) > 5;

----- Orta maaşı 7000-dən çox olan departmentləri tapan sorğu.
select 
  department_id,
  avg(salary) as sahin
from employees
group by department_id
having avg(salary) > 7000;

---- task2: Salary-si 10000-dən çox olan işçilərin işlədiyi departmentlərin adlarını tapan sorğu.
select
  distinct department_name
from departments
where department_id in (
  select distinct department_id
  from employees
  where salary > 10000
);

----- task3: Administration departmentinin yerləşdiyi küçənin adını tapmaq (departments və locations cədvəllərindən istifadə etməklə).
select
  street_address
from locations
where location_id = (
  select location_id
  from departments
  where department_name = 'Administration'
);

---- task5: 50-ci departmentdə işləməyən, maaşı isə 50-ci departmentdəki işçilərin orta maaşından çox olan işçiləri tapan sorğu.
select
  department_id,
  e.salary
from employees e
where e.department_id <> 50
  and e.salary > (
    select avg(salary)
    from employees
    where department_id = 50
  );
