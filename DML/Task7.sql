---- task1H?r bir i?�inin ad, soyad, maa??n? v? 4-c� s�tunda �z maa??na g�r? (row_number, rank v? dense_rank) s?ras?n? �?xar?n.
select 
first_name, 
last_name, 
salary, 
row_number() 
over (order by salary desc) as row_number,
rank() 
over (order by salary desc) as rank,
dense_rank() 
over (order by salary desc) as dense_rank
from employees;


--- task 2 H?r bir i?�inin ad, soyad, maa??n? v? 4-c� s�tunda �z maa??na g�r? s?ra n�mr?sini �?xar?n (h?r biri unikal). balaca herflerle
select 
 first_name, 
last_name, 
salary, 
row_number() 
over (order by salary desc) as sira_nomresi
from employees;

--- task3 H?r bir i?�inin ad, soyad, maa??n? v? 4-c� s�tunda �z maa??na g�r? reytinqini �?xar?n (eyni maa?lar eyni n�mr?).
select 
first_name, 
last_name, 
salary, 
rank() 
over (order by salary desc) as reyting
from employees;


--- task4 H?r bir i?�inin ad, soyad, maa??n? v? 4-c� s�tunda �z maa??na g�r? reytinqini �?xar?n (eyni maa?lar eyni n�mr?, bo? n�mr?l?r qalmamaqla).
select 
first_name, 
last_name, 
salary, 
dense_rank() 
over (order by salary desc) as reyting
from employees;


---- task5 H?r bir i?�inin ad, soyad, maa??n? v? 4-c� s�tunda �z departamenti �zr? maa??na g�r? (row_number, rank v? dense_rank) s?ras?n? �?xar?n.
select 
first_name, 
last_name,  
department_id,
salary, 
row_number() 
over (partition by department_id 
order by salary desc) as row_number,
    rank() 
    over (partition by department_id order by salary desc) as rank,
    dense_rank() 
    over (partition by department_id order by salary desc) as dense_rank
from employees;


---- task6 H?r bir i?�inin ad, soyad, maa??n? v? 4-c� s�tunda �z departamenti �zr? maa??na g�r? s?ra n�mr?sini �?xar?n (h?r biri unikal).
select 
first_name, 
last_name, 
department_id, 
salary, 
row_number() 
over (partition by department_id order by salary desc) as sira_nomresi
from employees;
 
 
--- task7H?r bir i?�inin ad, soyad, maa??n? v? 4-c� s�tunda �z departamenti �zr? maa??na g�r? reytinqini �?xar?n (eyni maa?lar eyni n�mr?).
select 
first_name, 
last_name, 
department_id, 
salary, 
rank() 
over (partition by department_id order by salary desc) as reyting
from employees;


---- task8 H?r bir i?�inin ad, soyad, maa??n? v? 4-c� s�tunda �z departamenti �zr? maa??na g�r? reytinqini �?xar?n (eyni maa?lar eyni n�mr?, bo? n�mr?l?r qalmamaqla).
select 
first_name, 
last_name, 
department_id, 
salary, 
dense_rank() 
over (partition by department_id order by salary desc) as reting
from employees;

---- task9  H?r bir i?�inin ad, soyad?, departament_name-i v? 4-c� s�tunda �z departamenti �zr? c?m maa?? �?xar?n.
select 
first_name, 
last_name, 
department_id as department_name, 
    sum(salary) over (partition by department_id) as mak_salary
from employees;


---- task10  H?r bir i?�inin first_name, last_name, departament_name-i v? 4-c� s�tunda b�t�n i?�il?rin c?m maa??n? �?xar?n.
select 
    e.first_name, 
    e.last_name, 
    d.department_name, 
    sum(e.salary) over () as butun_iscilerin_cem_maasi
from employees e
join departament d on e.departament_id = d.department_id;



select 
    e.first_name, 
    e.last_name, 
    d.department_name, 
    (select 
    sum(e.salary) 
    from employees e ) as butun_iscilerin_cem_maasi
from employees e
join departaments d on e.departament_id = d.department_id;
