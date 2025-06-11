-- task1 H?r bir is�inin ad?n?, soyad?n?,v?zif?sinin ad?n? ( job_title) tapan sor?u yaz?n.
select
e.first_name,
e.last_name ,
j.job_title
from employees e
join jobs j on e.job_id = j.job_id;

--- task2 H?r bir i?�inin ad?n?,  maa??n?, v? �z v?zif?si �zr? maksimum  maa??n? (max_salary) tapan sor?u yaz?n.
select
e.last_name
e.salary
job.

--task3 H?r bir i??inin ad?n?,v?zif?sinin ad?n?, departamentinin ad?n? tapan sql sor?usu yaz?n.
select 
e.last_name,
j.job_title,
d.department_name
from employees e
join jobs j on e.job_id =j.job_id
join departments d on e.department_id = d.department_id;

--task4  Ad?nda v? ya i?l?diyi departamentin ad?nda a h?rfi olan i?�il?ri tap?n.
select 
e.first_name,
d.department_name
from employees e
join departments d on e.department_id = d.department_id
where lower e.first_name like '%a%' 
or department_name like '%a%';

--- task 5 Ad? I h?rfi il? ba?layan  �lk?l?rd? yerl???n departmentl?ri tapan sor?u yaz?n.
select
c.country_name,
d.department_name
from departments d
join locations l on d.location_ID  = l.location_ID
join countries c on l.country_id = c.country_id
where d.department_id like 'I%';


--- task 6 He� bir i?�isi olmayan departmentl?rin ad?n?, yerl??diyi ??h?ri tapan sor?u yaz?n.
SELECT 
d.department_name, 
l.city
FROM departments d
JOIN locations l ON d.location_id = l.location_id
LEFT JOIN employees e ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;

---- task7 H?r bir i?�inin ad?n?, soyad?n?, v?zif?sinin ad?n?, maa??n?, maa?? il? �z v?zif?si �zr? minimum maa??n f?rqini tap?n.
SELECT e.first_name, 
       e.last_name, 
       j.job_title, 
       e.salary, 
     
     
 
--- task 11 H?r ??h?rin (city) qar??s?na yerl??diyi �lk?nin ad?n? (country_name) �?xaran SQL yaz?n.
SELECT 
l.city ,
c.country_name 
FROM locations l
JOIN countries c ON l.country_id = c.country_id;

--- task 12 Countries cedvelinde country_name qarsisinda aid oldugu regionun adini cixarin.
SELECT
c.country_name , 
r.region_name 
FROM countries c
JOIN regions r ON c.region_id = r.region_id;

----task13 H?r bir departamentin qar??s?na aid oldu?u ??h?rin ad?n? �?xaran SQl yaz?n.
SELECT 
d.department_name, 
l.city AS city_name
FROM departments d
JOIN locations l ON d.location_id = l.location_id;

----task14 H?r bir addressin qar??s?nda hansi regiona aid oldu?unu v? han?? ??h?rd? oldu?unu �?xar?n.
--

---task15 H?r bir departamementin qar??s?na h?min departamentin menecerinin ad?n? �?xaran SQl yaz?n.
SELECT 
d.department_name, 
first_name 
FROM departments d
 left JOIN employees m ON d.manager_id = m.employee_id;
 
---task 16 Employees ve Departments c?dv?ll?rini istifad? etm?kl? h?r bir i?�inin qar??s?na �z deprtamentini 
--�?xaran SQL yaz?n.

SELECT
e.first_name, 
e.last_name  , 
d.department_name 
FROM employees e
 left JOIN departments d ON e.department_id = d.department_id;


--- task 17 Employees, Departments v? Locations c?dv?ll?rind?n istifad? etm?kl? h?r bir i?�inin 
--ad?n?, soyad?n? v? �al??d??? ?�b?nin yerl??diyi ??h?rin ad?n? �?xaran sql sor?usu t?rtib 
--edin. 
SELECT 
e.first_name, 
e.last_name      
FROM employees e
 left JOIN departments d ON e.department_id = d.department_id
 left JOIN locations l ON d.location_id = l.location_id;



----Employees, Departments v? Locations c?dv?ll?rind?n istifad? etm?kl? country_id-si �CA�,�IT�,�UK�
--olan h?r bir i?�inin ad?n?, soyad?n? v? �al??d??? ?�b?nin yerl??diyi ??h?rin ad?n? �?xaran sql sor?usu
--t?rtib edin.
SELECT 
e.first_name, 
e.last_name,
l.city
FROM Employees e
inner JOIN Departments d ON e.department_id = d.department_id
inner JOIN Locations l ON d.location_id = l.location_id
WHERE l.country_id IN ('CA', 'IT', 'UK');

--Departments ve locations cedvellerini istifade etmekle Roma,Venice,Tokyo,Hiroshima seherlerinde
--yerlesmeyen departmet_name ve street_address melumatini cixaran sql yazin
SELECT
d.department_name, 
l.street_address
FROM Departments d
JOIN Locations l ON d.location_id = l.location_id
WHERE l.city not IN ('Roma', 'Venice', 'Tokyo', 'Hiroshima');

select * from employees;

---Employees, Locations v? Departments c?dv?ll?rind?n istifad? etm?kl? 15000-den yuxari maas alan
--h?r bir i?�inin ad?n?, soyad?n? , �al??d??? departamentin ad?n? ve yerlesdiyi seherin adini �?xaran sql
--sor?usu t?rtib edin.
SELECT
e.first_name, 
e.last_name, 
d.department_name, 
l.city
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id
JOIN Locations l ON d.location_id = l.location_id
WHERE e.salary > 15000;
--Employees, Departments v? Locations c?dv?ll?rind?n istifad? etm?kl? department_id-si 30-150
--araliginda olan ve ya manager_id-si bos olan h?r bir i?�inin ad?n?, soyad?n? v? �al??d??? ?�b?nin
--yerl??diyi ??h?rin ve kucenin ad?n? �?xaran sql sor?usu t?rtib edin.
SELECT 
    e.first_name,
    e.last_name,
    l.city,
    l.street_address
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id
JOIN Locations l ON d.location_id = l.location_id
WHERE 
    (e.department_id BETWEEN 30 AND 150 OR e.manager_id IS NULL);
    
    
---- task11 Employees, Departments v? Locations c?dv?ll?rind?n istifad? etm?kl? country_id-si �CA�,�IT�,�UK�
--olan h?r bir i?�inin ad?n?, soyad?n? v? �al??d??? ?�b?nin yerl??diyi ??h?rin ad?n? �?xaran sql sor?usu
--t?rtib edin. 37 setir

select 
e.first_name,
e.last_name,
l.city
from locations l
inner join departments d on l.location_id=d.location_id
inner join employees e on d.department_id=e.department_id
where country_id in ('CA','IT','UK');


-----task12 Departments ve locations cedvellerini istifade etmekle Roma,Venice,Tokyo,Hiroshima seherlerinde
--yerlesmeyen departmet_name ve street_address melumatini cixaran sql yazin 27 setir

select *
from  locations l
inner join departments d on d.location_id=l.location_id
where city not in ('Roma','Venice','Tokyo','Hiroshima');



---- task13 Employees, Locations v? Departments c?dv?ll?rind?n istifad? etm?kl? 15000-den yuxari maas alan
--h?r bir i?�inin ad?n?, soyad?n? , �al??d??? departamentin ad?n? ve yerlesdiyi seherin adini �?xaran sql
--sor?usu t?rtib edin. 3 setir
select 
emp.first_name,
emp.last_name,
dep.department_name,
loc.city 
from employees emp
left join departments dep on emp.department_id=dep.department_id
left join locations loc on dep.location_id=loc.location_id
where salary>15000;

----task14 Employees, Departments v? Locations c?dv?ll?rind?n istifad? etm?kl? department_id-si 30-150
---araliginda olan ve ya manager_id-si bos olan h?r bir i?�inin ad?n?, soyad?n? v? �al??d??? ?�b?nin
--yerl??diyi ??h?rin ve kucenin ad?n? �?xaran sql sor?usu t?rtib edin. 103 setir

select 
emp.first_name,
emp.last_name,
loc.city,
loc.street_address
 from employees emp
left join departments dep on emp.department_id=dep.department_id
left join locations loc on dep.location_id=loc.location_id
where emp.department_id between 30 and 150
or emp.manager_id is null;

 




---task4 
SELECT 
    first_name, 
    last_name,
    LENGTH(first_name) as 
FROM employees
WHERE 
instr (last_name, 'b') >3; 
    


---task8   
SELECT *
FROM job_history
WHERE EXTRACT(YEAR FROM start_date) = EXTRACT(YEAR FROM end_date);

--task9 
SELECT *
FROM locations
WHERE postal_code LIKE '% %';

---task10 
SELECT department_id, LOWER(department_name) AS department_name
FROM departments
WHERE manager_id IS NULL
  AND MOD(department_id, 3) = 0;
  
    
--- task 5
SELECT *
FROM employees
WHERE EXTRACT(MONTH FROM hire_date) IN (1, 4, 7, 10);

--- task 7 
SELECT 
    LOWER(first_name)|| '.' || LOWER(last_name) || '@gmail.com' AS email_address
FROM employees;


---- task 6
SELECT first_name, last_name, salary, 
LAST_DAY(ADD_MONTHS(hire_date, 6)) AS salary_3
FROM employees 
WHERE department_id = 50; 


