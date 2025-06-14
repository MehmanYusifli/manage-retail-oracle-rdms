CREATE TABLE locations (
    location_id NUMBER PRIMARY KEY,
    street_address VARCHAR2(100),
    postal_code VARCHAR2(20),
    city VARCHAR2(50),
    state_province VARCHAR2(50),
    country_id CHAR(2),
    CONSTRAINT fk_country FOREIGN KEY (country_id) REFERENCES countries(country_id)
);
