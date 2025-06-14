CREATE TABLE countries (
    country_id CHAR(2) PRIMARY KEY,
    country_name VARCHAR2(50),
    region_id NUMBER,
    CONSTRAINT fk_region FOREIGN KEY (region_id) REFERENCES regions(region_id)
);
