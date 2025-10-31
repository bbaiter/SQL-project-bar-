
CREATE TABLE if not exists ncd.menu (
  drink_ID INTEGER PRIMARY KEY,
  drink_title VARCHAR(200) NOT NULL,
  price NUMERIC NOT NULL,
  category VARCHAR(200) NOT NULL,
  ingredients VARCHAR(200) NOT NULL,
  availability_ BOOLEAN NOT NULL
);
CREATE TABLE if not exists ncd.clients (
    client_ID INTEGER PRIMARY KEY,
    drink_ID INTEGER REFERENCES ncd.menu(drink_ID),
    client_name VARCHAR(200) NOT NULL,
    client_phone VARCHAR(200) NOT NULL,
    client_email VARCHAR(200) NOT NULL,
    attendance_dates TIMESTAMP NOT NULL,
    expenses NUMERIC NOT NULL,
    drink_title VARCHAR(200) NOT NULL
);
CREATE TABLE if not exists ncd.providers (
  provider_ID INTEGER PRIMARY KEY,
  drink_ID INTEGER REFERENCES ncd.menu(drink_ID),
  company_title VARCHAR(200) NOT NULL,
  provider_ VARCHAR(200) NOT NULL,
  address_ VARCHAR(200) NOT NULL,
  provider_phone VARCHAR(200) NOT NULL,
  provider_email VARCHAR(200) NOT NULL,
  payment_conditions VARCHAR(200) NOT NULL,
  provider_rating VARCHAR(200) NOT NULL
);
CREATE TABLE if not exists ncd.booking (
    booking_ID INTEGER PRIMARY KEY,
    client_ID INTEGER REFERENCES ncd.clients(client_ID),
    client_name VARCHAR(200) NOT NULL,
    date_ TIMESTAMP NOT NULL,
    booking_status VARCHAR(200) NOT NULL,
    table_number INTEGER NOT NULL
);
CREATE TABLE if not exists ncd.employees (
  employee_ID INTEGER PRIMARY KEY,
  booking_ID INTEGER REFERENCES ncd.booking(booking_ID),
  employees_name VARCHAR(200) NOT NULL,
  age INTEGER NOT NULL,
  employee_phone VARCHAR(200) NOT NULL,
  employee_email VARCHAR(200) NOT NULL,
  position VARCHAR(200) NOT NULL,
  hire_date TIMESTAMP NOT NULL,
  salary NUMERIC NOT NULL,
  schedule VARCHAR(200) NOT NULL,
  education VARCHAR(200) NOT NULL,
  employees_rating VARCHAR(200) NOT NULL,
  fire_date TIMESTAMP NULL
);
CREATE TABLE if not exists ncd.money (
    transaction_ID INTEGER PRIMARY KEY,
    provider_ID INTEGER REFERENCES ncd.providers(provider_ID),
    date_ TIMESTAMP NOT NULL,
    cost NUMERIC NOT NULL
);