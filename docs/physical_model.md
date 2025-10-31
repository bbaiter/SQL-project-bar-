# Физическая модель

---

Таблица `menu`  

| Название        | Описание                   |Тип данных    |Ограничение  |
|-----------------|----------------------------|--------------|------------ |
| `drink_ID`      | ID напитка                 |`INTEGER`     |`PRIMARY KEY`|
| `drink_title`   | Наименование напитка       |`VARCHAR(200)`|`NOT NULL`   |
| `price`         | Цена                       |`NUMERIC`     |`NOT NULL`   |
| `category`      | Категория напитка          |`VARCHAR(200)`|`NOT NULL`   |
| `ingredients`   | Ингредиенты                |`VARCHAR(200)`|`NOT NULL`   |
| `availability`  | Доступность(в наличии/нет) |`BOOLEAN`     |`NOT NULL`   |


Таблица `clients`

| Название           | Описание                   |Тип данных    |Ограничение   |
|--------------------|----------------------------|--------------|--------------|
| `client_ID`        | ID клиента                 |`INTEGER`     |`PRIMARY KEY` |
| `drink_ID`         | ID напитка                 |`INTEGER`     |`FOREIGN KEY` |
| `client_name`      | Имя и фамилия              |`VARCHAR(200)`|`NOT NULL`    |
| `client_phone`     | Номер телефона             |`VARCHAR(200)`|`NOT NULL`    | 
| `client_email`     | электронная почта          |`VARCHAR(200)`|`NOT NULL`    |
| `attendance_dates` | даты посещения             |`TIMESTAMP`   |`NOT NULL`    |
| `expenses`         | Сумма потраченных средств  |`NUMERIC`     |`NOT NULL`    |


Таблица `employees`

| Название           | Описание                   |Тип данных    |Ограничение  |
|--------------------|----------------------------|--------------|-------------|
| `employee_ID`      | ID сотрудика               |`INTEGER`     |`PRIMARY KEY`|
| `booking_ID`       | ID бронирования            |`INTEGER`     |`FOREIGN KEY`|
| `employees_name`   | Имя и фамилия              |`VARCHAR(200)`|`NOT NULL`   |
| `age`              | Возраст                    |`INTEGER`     |`NOT NULL`   |
| `employee_phone`   | Номер телефона             |`VARCHAR(200)`|`NOT NULL`   | 
| `employee_email`   | Электронная почта          |`VARCHAR(200)`|`NOT NULL`   |
| `position`         | Должность                  |`VARCHAR(200)`|`NOT NULL`   |
| `hire_date`        | Дата приема на работу      |`TIMESTAMP`   |`NOT NULL`   |
| `salary`           | Зарплата                   |`NUMERIC`     |`NOT NULL`   |
| `schedule`         | график работы              |`VARCHAR(200)`|`NOT NULL`   |
| `education`        | Образование                |`VARCHAR(200)`|`NOT NULL`   |
| `employees_rating` | оценка рейтинга работы     |`VARCHAR(200)`|`NOT NULL`   |
| `fire_date`        | Дата окончания работы      |`TIMESTAMP`   |`NULL`       |

Таблица `providers`

| Название            | Описание                          |Тип данных     |Ограничение  |
|---------------------|-----------------------------------|---------------|------------ |
| `provider_ID`       | ID поставщика                     |`INTEGER`      |`PRIMARY KEY`|
| `drink_ID`          | ID напитка                        |`INTEGER`      |`FOREIGN KEY`|
| `company_title`     | Наименование компании/фирмы       |`VARCHAR(200)` |`NOT NULL`   |
| `provider_`         | Контактное лицо                   |`VARCHAR(200)` |`NOT NULL`   |
| `address_`          | Адрес                             |`VARCHAR(200)` |`NOT NULL`   |
| `provider_phone`    | Номер телефона                    |`VARCHAR(200)` |`NOT NULL`   |
| `provider_email`    | Электронная почта                 |`VARCHAR(200)` |`NOT NULL`   |
| `payment_conditions`| Условия оплаты                    |`VARCHAR(200)` |`NOT NULL`   |
| `provider_rating`   | Рейтинг надежности поставки       |`VARCHAR(200)` |`NOT NULL`   |



Таблица `booking`

| Название             | Описание             |Тип данных    |Ограничение    |    
|----------------------|----------------------|--------------|---------------|
| `booking_ID`         | ID бронирования      |`INTEGER`     |`PRIMARY KEY`  |
| `client_ID`          | ID клиента           |`INTEGER`     |`FOREIGN KEY`  |
| `client_name`        | ФИО клиента          |`VARCHAR(200)`|`NOT NULL`     |
| `date_`              | Дата                 |`TIMESTAMP`   |`NOT NULL`     |
| `booking_status`     | Статус бронирования  |`VARCHAR(200)`|`NOT NULL`     |
| `table`              | № стола              |`INTEGER`     |`NOT NULL`     |


Таблица `money`

| Название             | Описание               |Тип данных  |Ограничение  |    
|----------------------|------------------------|------------|-------------|
| `transaction_ID`     | ID транзакции          |`INTEGER`   |`PRIMARY KEY`|
| `provider_ID`        | ID поставщика          |`INTEGER`   |`FOREIGN KEY`|
| `date_`              | Дата                   |`TIMESTAMP` |`NOT NULL`   |
| `cost`               | Стоимость покупки      |`NUMERIC`   |`NOT NULL`   |

### Описание таблиц
 ##### 1. Меню, цены, состав и ассортимент напитков
   
 ```sql
CREATE TABLE if not exists ncd.menu (
  drink_ID INTEGER PRIMARY KEY,
  drink_title VARCHAR(200) NOT NULL,
  price NUMERIC NOT NULL,
  category VARCHAR(200) NOT NULL,
  ingredients VARCHAR(200) NOT NULL,
  availability_ BOOLEAN NOT NULL
);
```


 ##### 2. Клиенты и основная информация о гостях
   
 ```sql
CREATE TABLE if not exists ncd.clients (
    client_ID INTEGER PRIMARY KEY,
    drink_ID INTEGER REFERENCES ncd.menu(drink_ID),
    client_name VARCHAR(200) NOT NULL,
    client_phone VARCHAR(200) NOT NULL,
    client_email VARCHAR(200) NOT NULL,
    attendance_dates TIMESTAMP NOT NULL,
    expenses NUMERIC NOT NULL,
);
```
##### 3. Поставщики и товар, привозимый ими.

```sql
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
```


##### 4. Бронирования. Основная информация о бронировании столиков.

```sql
CREATE TABLE if not exists ncd.booking (
    booking_ID INTEGER PRIMARY KEY,
    client_ID INTEGER REFERENCES ncd.clients(client_ID),
    client_name VARCHAR(200) NOT NULL,
    date_ TIMESTAMP NOT NULL,
    booking_status VARCHAR(200) NOT NULL,
    table_number INTEGER NOT NULL
);
```
 ##### 5. Сотрудники и информация о них.
   
 ```sql
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
  fire_date TIMESTAMP NULL,
);
```

##### 6. Деньги. В таблице отражены основные транзакции при поставках бара.

```sql
CREATE TABLE if not exists ncd.money (
    transaction_ID INTEGER PRIMARY KEY,
    provider_ID INTEGER REFERENCES ncd.providers(provider_ID),
    date_ TIMESTAMP NOT NULL,
    cost NUMERIC NOT NULL
);
```


