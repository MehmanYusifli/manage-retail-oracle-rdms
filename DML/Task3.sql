----- task1 Employees c?dv?lind?n employee_id-si t?k ?d?d olan i?�il?ri �?xar?n.
select
employee_id
from employees
where mod (employee_id,2)=1;



----Locations c?dv?lind?n street_address s�tununda ikinci rast g?l?n bo?lu?un m�vqeyini �?xar?n.
select
location_id,
instr(street_address, ' ',1,2) as sahin
from locations;

select
*
from locations;

---- task3  Departments c?dv?lind?n h?r departmentin ad?n? v? ad?nda ne�? simvol oldu?unu �?xar?n.
select
department_name,
length(department_name)
from departments;




----task4 Employees c?dv?lind?n ad v? soyad?nda birlikd? olan simvol say? 12-d?n �ox olan i?�il?ri �?xar?n.
select
first_name,
last_name
from employees
where length(first_name) + length(last_name) >12;

---- task5 Employees c?dv?lind?n salary-l?ri 27-? b�l�b, yuvarlaqla?d?rma �sulu il?, k?srd? maximum 2 r?q?m olmaqla �?xar?n.
select
salary,
round(salary / 27,2) as sahin
from employees;


---Employee_id-si 113 olan i?�id?n sonra i?? gir?n i?�il?ri tap?n.
select
* 
from employees
where hire_date > 
(select hire_date
from employees
where employee_id =113);


task 10 Phone_number-i 8-l?  bit?n i?�il?rin manager adlar?n? tap?n.
select 
distinct
m.first_name,
m.last_name
from employees e
join employees m on e.manager_id =m.employee_id
where e.phone_number like '%8';

----  task 1 H?r bir i??inin ad?n?, soyad?n?,v?zif?sinin ad?n? ( job_title) tapan sor?u yaz?n.
select
e.first_name,
e.last_name,
j.job_title
from employees e
left join jobs j on e.job_id = j.job_id;

---- task2  H?r bir i??inin ad?n?,  maa??n?, v? ?z v?zif?si ?zr? maksimum  maa??n? (max_salary) tapan sor?u yaz?n.
select
e.first_name,
e.salary,
j.max_salary
from employees e
left join jobs j on e.job_id =j.job_id;

----task3H?r bir i??inin ad?n?,v?zif?sinin ad?n?, departamentinin ad?n? tapan sql sor?usu yaz?n.
select
e.first_name,
j.job_title,
dep.department_name
from employees e
left join jobs j on e.job_id =j.job_id
left join departments dep on dep.department_id = dep.department_id;

---Ad?nda v? ya i?l?diyi departamentin ad?nda a h?rfi olan i??il?ri tap?n.
select
e.first_name,
dep.department_name
from employees etask6.He? bir i??isi olmayan departmentl?rin ad?n?, yerl??diyi ??h?ri tapan sor?u yaz?n.
join departments dep on e.department_id = dep.department_id
where 
lower (e.first_name) like '%a%' or lower(dep.department_name) like '%a%';

----- Ad? I h?rfi il? ba?layan  ?lk?l?rd? yerl???n departmentl?ri tapan sor?u yaz?n.
select
c.country_id,
d.department_name
from countries c
join locations l on l.country_id = c.country_id
join departments d on d.location_id =l.location_id
where
lower(c.country_name) like '%i%';


----- task6.He? bir i??isi olmayan departmentl?rin ad?n?, yerl??diyi ??h?ri tapan sor?u yaz?n.
select
d.department_name,
l.city
from departments d
left join employees e on  d.department_id =e.department_id
left join locations l on d.location_id =l.location_id
where e.employee_id is null;

---task7.H?r bir i??inin ad?n?, soyad?n?, v?zif?sinin ad?n?, maa??n?, maa?? il? ?z v?zif?si ?zr? minimum maa??n f?rqini tap?n.
select
e.first_name,
e.last_name,
j.job_title,
e.salary,
e.salary - j.min_salary as sahin
from employees e
left join jobs j on e.job_id = j.job_id;

----task8.Job_ history c?dv?lind?n istifad? ed?r?k, v?zif?sini d?yi?mi? i??il?rin ad?n?, soyad?n?, v?zif?sinin ad?n? tapan sor?u yaz?n.
select distinct
e.first_name,
e.last_name,
j.job_title
from job_history j
join employees e on j.employee_id = e.employee_id
join jobs j on e.job_id =j.job_id
where j.job_id <> e.job_id;




-----H?r ??h?rin (city) qar??s?na yerl??diyi �lk?nin ad?n? (country_name) �?xaran SQL yaz?n.
-----Countries cedvelinde country_name qarsisinda aid oldugu regionun adini cixarin.
----H?r bir departamentin qar??s?na aid oldu?u ??h?rin ad?n? �?xaran SQl yaz?n.
----H?r bir addressin qar??s?nda hansi regiona aid oldu?unu v? han?? ??h?rd? oldu?unu �?xar?n















---- task1 Employee_id-si 206 olan i?�il?rl? eyni g�nd? i?? gir?n i?�il?ri tap?n.
select



------task2 Salary-si 10000-d?n �ox olan department-d? i?l?y?n i?�il?ri department adlar?n? tapan sor?u yaz?n.
select
department_name
from Departments
where department_id 
in (select 
distinct department_id
from Employees
where salary > 10000);


----task3 Adminstration departmentinin yerl??diyi k��?nin ad?n? tap?n. (departments v? locations c?dv?ll?rind?n istifad? etm?kl?)
select
street_address
from locations
where location_id in (select 
location_id
from departments
where department_name = 'Administration');


---task4 H?r bir i?�inin ad?n?, soyad?n?, i?? girm? tarixini v? departmenti �zr? minimum maa??n? g�st?rin.
select
e.first_name,
e.last_name,
e.hire_date,
d.department_name,
(select min(salary)
from employees
where department_id = e.department_id) as sahin
from employees e
join departments d on e.department_id = d.department_id;

-----task5 50-ci department-d? i?l?m?y?n ,maa??  50-ci departmentd?ki i?�il?rin orta maa??nda �ox olan i?�il?ri tap?n.
select
e.salary,
e.department_id
from employees e
where e.department_id <> 50
and e.salary > (select avg(salary) 
from employees e
where department_id=50);

---- task6 .Employees c?dv?lind?n h?r bir i?�inin ad?n?, department_id-sini, i?? girm? tarixini v? �z departmenti �zr? son i?? girm? tarixini g�st?rin
select
department_id,
e.salary
from employees e
where e.department_id <> 50
and e.salary > (select min(salary)
from employees e
where department_id=50);





----task7 Alexander adl? i?�id?n �ox maa? alan i?�il?rin orta maa??n? tap?n.
select
avg(salary) as sahin
from employees
where
salary > (select max(salary)
from employees
where first_name = 'Alexander');


---- task8 Employee_id-si 113 olan i?�id?n sonra i?? gir?n i?�il?ri tap?n.
select
* 
from employees
where hire_date >( 
select hire_date 
from employees 
where employee_id = 113);


----task9 Maa?? 90-c? departmentin orta maa??ndan az 110-cu departmentin orta maa??ndan �ox olan i?�il?rin ad?n?, soyad?n?, department ad?n? tap?n.
select
e.first_name,
e.last_name,
d.department_name
from employees e
join departments d on e.department_id = d.department_id
where e.salary > ( select avg(salary) 
from employees 
where department_id = 110)
and 
e.salary < (select avg(salary) 
from employees
where department_id =90);
 

---- task 10 Phone_number-i 8-l?  bit?n i?�il?rin manager adlar?n? tap?n.

select distinct
m.first_name, 
m.last_name
from employees e
join employees m on e.manager_id = m.employee_id
where e.phone_number like '%8';


----- yeni ders 


---- task6 Departments cedvelinde manager_id-si bos olmayan departmentlerinin yerlesdiyi city,street_address melumatini cixaran sql yazin
select 
city, 
street_address
from locations
where location_id in (
select location_id
from departments
where manager_id is not null );

----task7 Employees cedvelinden max ve min salary alan butun iscilerin siyahisini cixarin
select 
* 
from employees
where salary  in (select max(salary) 
from employees)
or salary  in (select min(salary) 
from employees);



---- task8 Employees cedvelinden first_name, last_name, salary, average_salary ( bu umumi employees cedveli uzre butun iscilerin orta maasidir)
---ve eger maasi orta maasdan yuxaridirsa �Above total average salary� kicikdirse �Below total average salary� yazmaqla salary_status adli sutun cixarin
select 
first_name, 
last_name, 
salary, 
(select avg(salary) 
from employees) as average_salary,
case 
when salary > (select avg(salary) 
from employees) 
then 'Above total average salary'
else 'Below total average salary'
end AS salary_2
from employees;

task9 Countries, locations cedvellerini istifade etmekle location_id-si 1200,1800 araliginda olan olke
adlarini cixarin
select 
c.country_name
from countries c
join locations l on c.country_id = l.country_id
where l.location_id 
between 1200 and 1800;

-----task10 Countries, locations,regions cedvellerini istifade etmekle location_id-si 1200,2000 araliginda
olan olke adlarini ve region adlarini cixarin
select 
c.country_name,
r.region_name
from countries c
join locations l on c.country_id = l.country_id
join regions r on c.region_id = r.region_id
where l.location_id between 1200 and 2000;

--- task 11 Jobs ve employees cedvellerini istifade etmekle job_title ve qarsisinda hemin job_title uzre isci sayini cixarin(iki
select
j.job_title,
count(e.employee_id) as sahin
from jobs j
join employees e on j.job_id = e.job_id
group by j.job_title;

---- task 12 Jobs ve employees cedvellerini istifade etmekle first_name, last_name, salary ve jobs
cedvelindeki min_salary,max_salary esasinda orta maas cixaran sql yazin 
select 
e.first_name, 
e.last_name, 
e.salary, 
(j.min_salary + j.max_salary) / 2 as average_salary
from employees e
join jobs j on e.job_id = j.job_id;

----task13 Departments , employees cedvelinden istifade ederek iscisi olmayan department_name siyahisi cixarin.(exists ile)
select 
d.department_name
from departments d
where not exists (
select 1 
from employees e 
where e.department_id = d.department_id);

---- task14 Employees cedvelinde employee_id-si Kevin Feeney -nin employee_id-sinden boyuk olan iscileri cixarin.
select
* 
from employees 
where employee_id > (
select employee_id 
from employees 
where 
first_name = 'Kevin' and last_name = 'Feeney');

---- task15 Employees cedvelinden employee_id-si 146 olan isci ile eyni managere sahib isci melumatlarini cixarin.
select 
* 
from employees 
where manager_id = (
select manager_id 
from employees 
where employee_id = 146) ;





