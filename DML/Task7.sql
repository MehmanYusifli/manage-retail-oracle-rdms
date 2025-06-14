---- task1: Hər bir işçinin ad, soyad, maaşı və 4-cü sütunda öz maaşına görə (row_number, rank və dense_rank) sırasını çıxarır.
select 
  first_name, 
  last_name, 
  salary, 
  row_number() over (order by salary desc) as row_number,
  rank() over (order by salary desc) as rank,
  dense_rank() over (order by salary desc) as dense_rank
from employees;


--- task2: Hər bir işçinin ad, soyad, maaşı və 4-cü sütunda öz maaşına görə sıra nömrəsini çıxarır (hər biri unikaldır). Balaca hərflərlə.
select 
  first_name, 
  last_name, 
  salary, 
  row_number() over (order by salary desc) as sira_nomresi
from employees;


--- task3: Hər bir işçinin ad, soyad, maaşı və 4-cü sütunda öz maaşına görə reytinqini çıxarır (eyni maaşlar eyni nömrə).
select 
  first_name, 
  last_name, 
  salary, 
  rank() over (order by salary desc) as reyting
from employees;


--- task4: Hər bir işçinin ad, soyad, maaşı və 4-cü sütunda öz maaşına görə reytinqini çıxarır (eyni maaşlar eyni nömrə, boş nömrələr qalmamaqla).
select 
  first_name, 
  last_name, 
  salary, 
  dense_rank() over (order by salary desc) as reyting
from employees;


---- task5: Hər bir işçinin ad, soyad, maaşı və 4-cü sütunda öz departamenti üzrə maaşına görə (row_number, rank və dense_rank) sırasını çıxarır.
select 
  first_name, 
  last_name,  
  department_id,
  salary, 
  row_number() over (partition by department_id order by salary desc) as row_number,
  rank() over (partition by department_id order by salary desc) as rank,
  dense_rank() over (partition by department_id order by salary desc) as dense_rank
from employees;


---- task6: Hər bir işçinin ad, soyad, maaşı və 4-cü sütunda öz departamenti üzrə maaşına görə sıra nömrəsini çıxarır (hər biri unikaldır).
select 
  first_name, 
  last_name, 
  department_id, 
  salary, 
  row_number() over (partition by department_id order by salary desc) as sira_nomresi
from employees;
 
 
--- task7: Hər bir işçinin ad, soyad, maaşı və 4-cü sütunda öz departamenti üzrə maaşına görə reytinqini çıxarır (eyni maaşlar eyni nömrə).
select 
  first_name, 
  last_name, 
  department_id, 
  salary, 
  rank() over (partition by department_id order by salary desc) as reyting
from employees;


---- task8: Hər bir işçinin ad, soyad, maaşı və 4-cü sütunda öz departamenti üzrə maaşına görə reytinqini çıxarır (eyni maaşlar eyni nömrə, boş nömrələr qalmamaqla).
select 
  first_name, 
  last_name, 
  department_id, 
  salary, 
  dense_rank() over (partition by department_id order by salary desc) as reting
from employees;


---- task9: Hər bir işçinin ad, soyadı, departament_name-i və 4-cü sütunda öz departamenti üzrə cəm maaşı çıxarır.
select 
  first_name, 
  last_name, 
  department_id as department_name, 
  sum(salary) over (partition by department_id) as mak_salary
from employees;


---- task10: Hər bir işçinin first_name, last_name, departament_name-i və 4-cü sütunda bütün işçilərin cəm maaşını çıxarır.
select 
  e.first_name, 
  e.last_name, 
  d.department_name, 
  sum(e.salary) over () as butun_iscilerin_cem_maasi
from employees e
join departament d on e.departament_id = d.department_id;


-- Alternativ task10: subquery ilə bütün işçilərin cəm maaşını çıxarır.
select 
  e.first_name, 
  e.last_name, 
  d.department_name, 
  (select sum(salary) from employees) as butun_iscilerin_cem_maasi
from employees e
join departaments d on e.departament_id = d.department_id;
