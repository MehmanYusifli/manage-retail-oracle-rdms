-- task1: Employees cədvəlindən employee_id-si tək ədəd olan işçiləri çıxarın.
SELECT employee_id
FROM employees
WHERE MOD(employee_id, 2) = 1;

-- task2: Locations cədvəlindən street_address sütununda ikinci rast gəlinən boşluğun mövqeyini çıxarın.
SELECT location_id, INSTR(street_address, ' ', 1, 2) AS second_space_position
FROM locations;

-- task3: Departments cədvəlindən hər departmentin adını və adında neçə simvol olduğunu çıxarın.
SELECT department_name, LENGTH(department_name) AS name_length
FROM departments;

-- task4: Employees cədvəlindən ad və soyadında birlikdə olan simvol sayı 12-dən çox olan işçiləri çıxarın.
SELECT first_name, last_name
FROM employees
WHERE LENGTH(first_name) + LENGTH(last_name) > 12;

-- task5: Salary-ləri 27-yə bölüb, yuvarlaqlaşdırılmış şəkildə 2 onluq rəqəmlə çıxarın.
SELECT salary, ROUND(salary / 27, 2) AS salary_divided
FROM employees;

-- task6: Employee_id-si 113 olan işçidən sonra işə girən işçiləri tapın.
SELECT * 
FROM employees
WHERE hire_date > (
    SELECT hire_date
    FROM employees
    WHERE employee_id = 113
);

-- task7: Phone_number-i 8 ilə bitən işçilərin manager adlarını tapın.
SELECT DISTINCT m.first_name, m.last_name
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
WHERE e.phone_number LIKE '%8';

-- task8: Hər bir işçinin adı, soyadı, vəzifəsinin adı (job_title) ilə birlikdə çıxarılması.
SELECT e.first_name, e.last_name, j.job_title
FROM employees e
LEFT JOIN jobs j ON e.job_id = j.job_id;

-- task9: Hər bir işçinin adı, maaşı və öz vəzifəsi üzrə maksimum maaşı çıxarın.
SELECT e.first_name, e.salary, j.max_salary
FROM employees e
LEFT JOIN jobs j ON e.job_id = j.job_id;

-- task10: Hər işçinin adı, vəzifəsi və departamentinin adı.
SELECT e.first_name, j.job_title, d.department_name
FROM employees e
LEFT JOIN jobs j ON e.job_id = j.job_id
LEFT JOIN departments d ON e.department_id = d.department_id;

-- task11: Adında və ya işlədiyi department adında "a" hərfi olan işçiləri çıxarın.
SELECT e.first_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE LOWER(e.first_name) LIKE '%a%' OR LOWER(d.department_name) LIKE '%a%';

-- task12: Adı "I" ilə başlayan ölkələrdə yerləşən departmentləri tapın.
SELECT c.country_id, d.department_name
FROM countries c
JOIN locations l ON l.country_id = c.country_id
JOIN departments d ON d.location_id = l.location_id
WHERE LOWER(c.country_name) LIKE 'i%';

-- task13: Heç bir işçisi olmayan departmentlərin adını və yerləşdiyi şəhəri çıxarın.
SELECT d.department_name, l.city
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
LEFT JOIN locations l ON d.location_id = l.location_id
WHERE e.employee_id IS NULL;

-- task14: Hər bir işçinin adı, soyadı, vəzifəsi, maaşı və minimum maaş fərqini çıxarın.
SELECT e.first_name, e.last_name, j.job_title, e.salary, (e.salary - j.min_salary) AS salary_diff
FROM employees e
LEFT JOIN jobs j ON e.job_id = j.job_id;

-- task15: Vəzifəsini dəyişmiş işçilərin adı, soyadı və hazırkı vəzifəsini çıxarın.
SELECT DISTINCT e.first_name, e.last_name, j.job_title
FROM job_history jh
JOIN employees e ON jh.employee_id = e.employee_id
JOIN jobs j ON e.job_id = j.job_id
WHERE jh.job_id <> e.job_id;

-- task16: Hər şəhərin qarşısına yerləşdiyi ölkənin adını çıxarın.
SELECT l.city, c.country_name
FROM locations l
JOIN countries c ON l.country_id = c.country_id;

-- task17: Countries cədvəlində country_name qarşısında aid olduğu regionun adını çıxarın.
SELECT c.country_name, r.region_name
FROM countries c
JOIN regions r ON c.region_id = r.region_id;

-- task18: Hər bir departmentin qarşısına aid olduğu şəhərin adını çıxarın.
SELECT d.department_name, l.city
FROM departments d
JOIN locations l ON d.location_id = l.location_id;

-- task19: Hər bir addressin qarşısında hansı regiona və şəhərə aid olduğunu çıxarın.
SELECT l.street_address, r.region_name, l.city
FROM locations l
JOIN countries c ON l.country_id = c.country_id
JOIN regions r ON c.region_id = r.region_id;

-- task20: Employee_id-si 206 olan işçilərlə eyni gündə işə girənləri tapın.
SELECT * 
FROM employees 
WHERE hire_date = (
    SELECT hire_date 
    FROM employees 
    WHERE employee_id = 206
);

-- task21: Maaşı 10000-dən çox olan departmentlərdə çalışan işçilərin department adlarını tapın.
SELECT department_name
FROM departments
WHERE department_id IN (
    SELECT DISTINCT department_id
    FROM employees
    WHERE salary > 10000
);

-- task22: Administration departmentinin yerləşdiyi küçənin adını tapın.
SELECT street_address
FROM locations
WHERE location_id IN (
    SELECT location_id
    FROM departments
    WHERE department_name = 'Administration'
);

-- task23: Hər işçinin adı, soyadı, işə giriş tarixi və department üzrə minimum maaşını göstərin.
SELECT e.first_name, e.last_name, e.hire_date, d.department_name,
    (SELECT MIN(salary) FROM employees WHERE department_id = e.department_id) AS min_dept_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

-- task24: 50-ci departmentdə işləməyən, lakin onların maaşından yüksək alan işçiləri tapın.
SELECT e.salary, e.department_id
FROM employees e
WHERE e.department_id <> 50
  AND e.salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = 50
);

-- task25: Hər bir işçinin adı, department_id-si, işə giriş tarixi və department üzrə son giriş tarixi.
SELECT e.first_name, e.department_id, e.hire_date,
    (SELECT MAX(hire_date) FROM employees WHERE department_id = e.department_id) AS latest_hire
FROM employees e;

-- task26: Alexander adlı işçidən çox maaş alan işçilərin orta maaşını çıxarın.
SELECT AVG(salary) AS avg_salary
FROM employees
WHERE salary > (
    SELECT MAX(salary)
    FROM employees
    WHERE first_name = 'Alexander'
);

-- task27: Employees cədvəlində ən çox və ən az maaş alan işçilərin siyahısını çıxarın.
SELECT * 
FROM employees
WHERE salary IN (
    SELECT MAX(salary) FROM employees
)
OR salary IN (
    SELECT MIN(salary) FROM employees
);

-- task28: Orta maaşla müqayisədə işçinin maaş vəziyyətini göstər.
SELECT first_name, last_name, salary,
    (SELECT AVG(salary) FROM employees) AS average_salary,
    CASE 
        WHEN salary > (SELECT AVG(salary) FROM employees) THEN 'Above total average salary'
        ELSE 'Below total average salary'
    END AS salary_status
FROM employees;

-- task29: location_id-si 1200-1800 aralığında olan ölkə adlarını çıxarın.
SELECT c.country_name
FROM countries c
JOIN locations l ON c.country_id = l.country_id
WHERE l.location_id BETWEEN 1200 AND 1800;

-- task30: location_id-si 1200-2000 aralığında olan ölkə və region adlarını çıxarın.
SELECT c.country_name, r.region_name
FROM countries c
JOIN locations l ON c.country_id = l.country_id
JOIN regions r ON c.region_id = r.region_id
WHERE l.location_id BETWEEN 1200 AND 2000;

-- task31: Hər job_title üçün işçi sayını çıxarın.
SELECT j.job_title, COUNT(e.employee_id) AS employee_count
FROM jobs j
JOIN employees e ON j.job_id = e.job_id
GROUP BY j.job_title;

-- task32: İşçinin adı, soyadı, maaşı və job_title-ə uyğun orta maaşı çıxarın.
SELECT e.first_name, e.last_name, e.salary,
       (j.min_salary + j.max_salary) / 2 AS average_salary
FROM employees e
JOIN jobs j ON e.job_id = j.job_id;

-- task33: EXITS ilə işçisi olmayan departmentləri çıxarın.
SELECT d.department_name
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
);

-- task34: Kevin Feeney-nin employee_id-sindən böyük olan işçiləri çıxarın.
SELECT * 
FROM employees
WHERE employee_id > (
    SELECT employee_id
    FROM employees
    WHERE first_name = 'Kevin' AND last_name = 'Feeney'
);

-- task35: Employee_id-si 146 olan işçi ilə eyni manager-ə sahib işçiləri çıxarın.
SELECT * 
FROM employees
WHERE manager_id = (
    SELECT manager_id
    FROM employees
    WHERE employee_id = 146
);
