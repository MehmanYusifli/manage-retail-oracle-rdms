-- task1 Hər bir işçinin adını, soyadını və vəzifəsinin adını (job_title) tapan sorğu
SELECT
    e.first_name,
    e.last_name,
    j.job_title
FROM employees e
JOIN jobs j ON e.job_id = j.job_id;

-- task2 Hər bir işçinin adını, maaşını və öz vəzifəsi üzrə maksimum maaşı (max_salary) tapan sorğu
SELECT
    e.last_name,
    e.salary,
    j.max_salary
FROM employees e
JOIN jobs j ON e.job_id = j.job_id;

-- task3 Hər bir işçinin adını, vəzifəsinin adını və departamentinin adını tapan sorğu
SELECT 
    e.last_name,
    j.job_title,
    d.department_name
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
JOIN departments d ON e.department_id = d.department_id;

-- task4 Adında və ya işlədiyi departamentin adında "a" hərfi olan işçiləri tapan sorğu
SELECT 
    e.first_name,
    d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE LOWER(e.first_name) LIKE '%a%' 
   OR LOWER(d.department_name) LIKE '%a%';

-- task5 Adı "I" hərfi ilə başlayan ölkələrdə yerləşən departamentləri tapan sorğu
SELECT
    c.country_name,
    d.department_name
FROM departments d
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id
WHERE c.country_name LIKE 'I%';

-- task6 Heç bir işçisi olmayan departamentlərin adını və yerləşdiyi şəhəri tapan sorğu
SELECT 
    d.department_name, 
    l.city
FROM departments d
JOIN locations l ON d.location_id = l.location_id
LEFT JOIN employees e ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;

-- task7 Hər bir işçinin adını, soyadını, vəzifəsinin adını, maaşını və öz vəzifəsinə görə minimum maaş fərqini tapan sorğu
SELECT 
    e.first_name, 
    e.last_name, 
    j.job_title, 
    e.salary,
    (e.salary - j.min_salary) AS salary_difference
FROM employees e
JOIN jobs j ON e.job_id = j.job_id;

-- task11 Hər şəhərin (city) qarşısına yerləşdiyi ölkənin adını çıxaran sorğu
SELECT 
    l.city,
    c.country_name 
FROM locations l
JOIN countries c ON l.country_id = c.country_id;

-- task12 Countries cədvəlində country_name qarşısında aid olduğu regionun adını çıxaran sorğu
SELECT
    c.country_name, 
    r.region_name 
FROM countries c
JOIN regions r ON c.region_id = r.region_id;

-- task13 Hər bir departamentin qarşısına aid olduğu şəhərin adını çıxaran sorğu
SELECT 
    d.department_name, 
    l.city AS city_name
FROM departments d
JOIN locations l ON d.location_id = l.location_id;

-- task14 Hər bir ünvanın qarşısında hansı regiona və şəhərə aid olduğunu çıxaran sorğu
SELECT
    l.street_address,
    l.city,
    r.region_name
FROM locations l
JOIN countries c ON l.country_id = c.country_id
JOIN regions r ON c.region_id = r.region_id;

-- task15 Hər bir departamentin qarşısına həmin departamentin menecerinin adını çıxaran sorğu
SELECT 
    d.department_name, 
    m.first_name 
FROM departments d
LEFT JOIN employees m ON d.manager_id = m.employee_id;

-- task16 Hər bir işçinin qarşısına öz departamentinin adını çıxaran sorğu
SELECT
    e.first_name, 
    e.last_name, 
    d.department_name 
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;

-- task17 Hər bir işçinin adını, soyadını və çalışdığı şöbənin yerləşdiyi şəhəri çıxaran sorğu
SELECT 
    e.first_name, 
    e.last_name,
    l.city
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id
LEFT JOIN locations l ON d.location_id = l.location_id;

-- task18 Country_id-si 'CA', 'IT', 'UK' olan işçilərin adını, soyadını və şəhərini çıxaran sorğu
SELECT 
    e.first_name, 
    e.last_name,
    l.city
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE l.country_id IN ('CA', 'IT', 'UK');

-- task19 Roma, Venice, Tokyo, Hiroshima şəhərlərində yerləşməyən departamentlərin adını və ünvanını çıxaran sorğu
SELECT
    d.department_name, 
    l.street_address
FROM departments d
JOIN locations l ON d.location_id = l.location_id
WHERE l.city NOT IN ('Roma', 'Venice', 'Tokyo', 'Hiroshima');

-- task20 Maaşı 15000-dən yuxarı olan işçilərin adını, soyadını, departament adını və şəhərini çıxaran sorğu
SELECT
    e.first_name, 
    e.last_name, 
    d.department_name, 
    l.city
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE e.salary > 15000;

-- task21 Department_id-si 30-150 aralığında olan və ya manager_id-si boş olan işçilərin adını, soyadını, şəhərini və ünvanını çıxaran sorğu
SELECT 
    e.first_name,
    e.last_name,
    l.city,
    l.street_address
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE e.department_id BETWEEN 30 AND 150
   OR e.manager_id IS NULL;
