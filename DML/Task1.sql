--- task 1 
select 
*
from hr.employees;

---task 2
select
*
from hr.employees
where JOB_ID = 'SA_REP' and  salary between 4000 and 10000;


--- task 3 
select 
   *
from hr.departments
where DEPARTMENT_NAME like  '%er%';

---task4
select
*
from locations
where street_address like '%-%';

---task5
---Employees c?dv?lind? manager_id s�tunu bo? olan s?tirl?rin employee_id ,first_name, 
--last_name s�tunlar?n? �?xaran sql yaz?n.

select 
*

from employees;

Task 06 
--Employees c?dv?lind? ?m?k haqq?s? 5000 v? 10000 aras?nda olan i?�il?rin siyah?n? �?xaran 2 
--?d?d sql yaz?n (between operatorundan istifad? etm?kl? v? etm?m?kl?).

select 
*
from employees
where  salary between 5000 and 10000;
where salary >= 5000 and salary < 10000;

Task 07 
--Employees c?dv?lind?n s?tirl?ri �?xar, department_id-l?r? g�r? s?ralanm??(b�y�k id yuxar?da), 
--eyni department_id-y? malik s?tirl?r bir daha employee_id s�tununa g�r? d? 
--s?ralans?nlar(ki�ik id yuxar?da).

select
employee_id,
last_name,
salary,
department_id
from employees
order by department_id desc;



TASK08
---Employees c?dv?lind? commission_pct s�tununa g�r? s?ralama edin, null qiym?tl?r ?vv?l 
--g?lsin.

SELECT
*
FROM EMPLOYEES
WHERE commission_pct  is null;


task9
--Employees c?dv?lind? first_name, last_name v? 12*salary m?lumatlar �?xs?n, 3-c� s�tuna 
--g�r? s?ralanma olsun (ki�ik qiym?t sonda)





task10
--Employees c?dv?lind?n 2004-c� ild?n sonra i?? q?bul olunmu? v? maa?? 5000 �d?n b�y�k 
--olan yaxud da i?? q?bul tarixind?n as?l? olmayaraq maa?? 10000-d?n b�y�k olan b�t�n 
--i?�il?rin siyah?s?n? �?xaran sql yaz?n.

select
*
from departments;

select
region_id,
country_name
from countries;

select
*
from employees;


select
employee_id,
first_name,
last_name
from employees;

select 
*
from jobs;

select
*
from emp_details_view;

select
*
from jobs;






SELECT 
DEPARTMENT_NAME
FROM HR.DEPARTMENTS
WHERE DEPARTMENT_NAME LIKE '%er%';




select
*
from countries;

---Employees c?dv?lind? job_id-si SA_REP v? ya MK_MAN qiym?tl?rind?n biri olan, ?m?k 
--haqq?s? 4000 v? 10000 aras?nda olan i?�il?rin siyah?s?n? �?xar?n.
--colum hamisi
--- salary 4000 100000 olan iscilerin siyahisini 
-- JOB_ID SI SA_REP MK_MAN QIYMETLERINDDEN BIRI OLAN



SELECT * from EMPLOYEES
where FIRST_NAME IN  ('PETER', 'DAVID') AND salary between 4000 and 10000;


---DEPARTMENTS c?dv?lind? ad?nda (department_name) �er� hiss?ciyi olan departamentl?rin 
--siyah?n? �?xaran sql yaz?n.

SELECT *FROM departments
WHERE department_name like '%%er%%';



---Locations c?dv?lind? street_address s�tununda �-� simvolu olan s?trl?ri �?xaran sql yaz?n.
select * from locations
where street_address not like '%%-%%';


--Employees c?dv?lind? manager_id s�tunu bo? olan s?tirl?rin employee_id ,first_name, 
--last_name s�tunlar?n? �?xaran sql yaz?n.
-- table adi employees
-- hansi columlari gormeliyem o employee_id, first_name, last_name, 
-- sert  bos olan setirleri cixaran sql yazmaq


select 
employee_id,
first_name,
last_name
from employees
where manager_id is  null;Employees c?dv?lind? ?m?k haqq?s? 5000 v? 10000 aras?nda olan i?�il?rin siyah?n? �?xaran 2 
?d?d sql yaz?n (between operatorundan istifad? etm?kl? v? etm?m?kl?).

---Employees c?dv?lind? ?m?k haqq?s? 5000 v? 10000 aras?nda olan i?�il?rin siyah?n? �?xaran 2 
--?d?d sql yaz?n (between operatorundan istifad? etm?kl? v? etm?m?kl?).

select
last_name,
first_name,
salary
from employees
where salary >5000 and salary < 10000;

----- task 1.3 Job_History c?dv?lind?n ilk iki s�tunu �?xaran sql yaz?n.
select
employee_id,
start_date
from JOB_HISTORY;

----task2.3 Departments c?dv?lind?n b�t�n s�tunlar? �?xaran sql yaz?n.
select
*
from departments;

----task 3.3 DEPARTMENTS c?dv?lind? ad?nda (department_name) �er� hiss?ciyi olan departamentl?rin siyah?n? �?xaran sql yaz?n.
select
department_name
from departments
where department_name like '%er%';

----task4.3 Locations c?dv?lind?n city sutunu 'Venice','Hiroshima','Bern' olan v? country_id-si 'JP' olan v?
---ya state_province-si null olub country_id-si 'JP','IT' olmayan s?tirl?ri �?xaran sql yaz?n.
select
*
from locations
where
(city in ( 'Venice','Hiroshima','Bern' ) and country_id = 'JP')
or
(state_province is null and  country_id not in ( 'JP','IT' ));
    
---task5.3 Departments c?dv?lind?n h?r departmentin ad?n? v? ad?nda ne�? simvol oldu?unu �?xar?n.
select 
department_name,
length(department_name) as mehman
from departments;



----task 6.3 Employees c?dv?lind? first_name s�tununu �?xar?n, lakin �?xan s�tunda simvol say?, h?r
--s?tird?ki last_name-d? olan simvol say? q?d?r olsun. �at??mayan simvollar?n ?v?zin? �#�
--i?ar?sind?n istifad? edin.
select
first_name,
last_name,
rpad(first_name, length(last_name),'#') 
from employees;

