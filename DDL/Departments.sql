CREATE TABLE departments (
    department_id NUMBER PRIMARY KEY,
    department_name VARCHAR2(100) NOT NULL,
    manager_id NUMBER,
    location_id NUMBER,
    CONSTRAINT fk_location FOREIGN KEY (location_id) REFERENCES locations(location_id)
);
