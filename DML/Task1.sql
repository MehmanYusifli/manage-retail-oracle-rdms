-- TASK 1: HR.EMPLOYEES cədvəlindən bütün məlumatları çıxarın
SELECT * FROM hr.employees;

-- TASK 2: JOB_ID-si 'SA_REP' olan və maaşı 4000-10000 arası olan işçiləri çıxarın
SELECT *
FROM hr.employees
WHERE JOB_ID = 'SA_REP' AND salary BETWEEN 4000 AND 10000;

-- TASK 3: DEPARTMENT_NAME sütununda “er” olan departamentləri çıxarın
SELECT *
FROM hr.departments
WHERE DEPARTMENT_NAME LIKE '%er%';

-- TASK 4: STREET_ADDRESS sütununda "-" olan sətirləri çıxarın
SELECT *
FROM locations
WHERE street_address LIKE '%-%';

-- TASK 5: Employees cədvəlində manager_id sütunu boş olan sətirlərin employee_id, first_name, last_name sütunlarını çıxaran sql yazın.
SELECT 
  employee_id,
  first_name,
  last_name
FROM employees
WHERE manager_id IS NULL;

-- TASK 6.1: Employees cədvəlində əməkhaqqısı 5000 və 10000 arasında olan işçilərin siyahısını BETWEEN ilə çıxarın
SELECT *
FROM employees
WHERE salary BETWEEN 5000 AND 10000;

-- TASK 6.2: Employees cədvəlində əməkhaqqısı 5000 və 10000 arasında olan işçilərin siyahısını BETWEEN istifadə etmədən çıxarın
SELECT *
FROM employees
WHERE salary >= 5000 AND salary <= 10000;

-- TASK 7: Employees cədvəlindən sətirləri department_id-ə görə azalan (böyük ID yuxarıda), 
-- eyni department_id-yə malik sətirlər bir daha employee_id sütununa görə sıralansınlar (kiçik ID yuxarıda)
SELECT
  employee_id,
  last_name,
  salary,
  department_id
FROM employees
ORDER BY department_id DESC, employee_id ASC;

-- TASK 8: Employees cədvəlində commission_pct sütununa görə sıralama edin, null qiymətlər əvvəl gəlsin
SELECT *
FROM employees
ORDER BY commission_pct NULLS FIRST;

-- TASK 9: Employees cədvəlində first_name, last_name və 12*salary məlumatları çıxarın, 
-- 3-cü sütuna görə sıralama olsun (kiçik qiymət sonda)
SELECT
  first_name,
  last_name,
  12 * salary AS yearly_salary
FROM employees
ORDER BY yearly_salary ASC;

-- TASK 10: Employees cədvəlində 2004-cü ildən sonra işə qəbul olunmuş və maaşı 5000-dən böyük 
-- olan yaxud da işə qəbul tarixindən asılı olmayaraq maaşı 10000-dən böyük olan bütün işçilərin siyahısını çıxaran sql yazın
SELECT *
FROM employees
WHERE (hire_date > TO_DATE('2004-01-01', 'YYYY-MM-DD') AND salary > 5000)
   OR salary > 10000;

-- TASK 11: Employees cədvəlində job_id-si SA_REP və ya MK_MAN olan, əməkhaqqısı 4000 və 10000 arasında olan işçilərin siyahısını çıxarın
SELECT *
FROM employees
WHERE JOB_ID IN ('SA_REP', 'MK_MAN') AND salary BETWEEN 4000 AND 10000;

-- TASK 12: Employees cədvəlində first_name-i 'PETER' və 'DAVID' olan və maaşı 4000–10000 arasında olan işçiləri çıxarın
SELECT *
FROM employees
WHERE first_name IN ('PETER', 'DAVID') AND salary BETWEEN 4000 AND 10000;

-- TASK 13: DEPARTMENTS cədvəlində adında (department_name) “er” hissəciyi olan departamentlərin siyahısını çıxaran sql yazın
SELECT *
FROM departments
WHERE department_name LIKE '%er%';

-- TASK 14: LOCATIONS cədvəlində street_address sütununda “-” simvolu olmayan sətirləri çıxarın
SELECT *
FROM locations
WHERE street_address NOT LIKE '%-%';

-- TASK 15: JOB_HISTORY cədvəlindən ilk iki sütunu çıxarın
SELECT
  employee_id,
  start_date
FROM job_history;

-- TASK 16: DEPARTMENTS cədvəlindən bütün sütunları çıxarın
SELECT *
FROM departments;

-- TASK 17: DEPARTMENTS cədvəlində department_name-də “er” hissəciyi olan adları çıxarın
SELECT
  department_name
FROM departments
WHERE department_name LIKE '%er%';

-- TASK 18: LOCATIONS cədvəlindən city sütunu 'Venice','Hiroshima','Bern' olan və country_id-si 'JP' olan 
-- və ya state_province-si NULL olub country_id-si 'JP','IT' olmayan sətirləri çıxaran sql yazın
SELECT *
FROM locations
WHERE (city IN ('Venice', 'Hiroshima', 'Bern') AND country_id = 'JP')
   OR (state_province IS NULL AND country_id NOT IN ('JP', 'IT'));

-- TASK 19: DEPARTMENTS cədvəlindən hər departmentin adını və adında neçə simvol olduğunu çıxarın
SELECT 
  department_name,
  LENGTH(department_name) AS character_count
FROM departments;

-- TASK 20: Employees cədvəlində first_name sütununu çıxarın, 
-- lakin çıxan sütunda simvol sayı, hər sətirdəki last_name-də olan simvol sayı qədər olsun. 
-- Çatışmayan simvolların əvəzinə '#' işarəsindən istifadə edin
SELECT
  first_name,
  last_name,
  RPAD(first_name, LENGTH(last_name), '#') AS adjusted_first_name
FROM employees;
