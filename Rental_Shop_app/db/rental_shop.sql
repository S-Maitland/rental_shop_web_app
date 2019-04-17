DROP TABLE IF EXISTS rentals;
DROP TABLE IF EXISTS cars;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers(
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  second_name VARCHAR(255),
  age INTEGER,
  wallet INTEGER
);

CREATE TABLE cars(
  id SERIAL PRIMARY KEY,
  manufacturer VARCHAR(255),
  model VARCHAR(255),
  mileage INTEGER,
  registration_year INTEGER,
  daily_rental_rate INTEGER,
  rented BOOLEAN,
  car_image TEXT
);

CREATE TABLE rentals(
  id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
  car_id INT REFERENCES cars(id) ON DELETE CASCADE
);
