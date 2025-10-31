# Создание представления таблиц

Создадим несколько представлений таблиц для лучшей визуализации внесенных данных.

---

Представление 1 -- создание виртуальной таблицы _BookingPersonFavor_. Здесь показана информация о бронировании столиков, включая поля из 3 разных таблиц.

```sql
CREATE VIEW BookingPersonFavor AS
SELECT ncd.booking.booking_ID AS "Номер бронирования",
	   ncd.booking.client_name AS "Имя гостя",
	   ncd.menu.drink_title AS "Любимый напиток",
	   ncd.employees.employees_name AS "Имя официанта",
	   ncd.employees.employees_rating AS "Оценка работы официанта"
FROM ncd.employees
INNER JOIN ncd.booking ON ncd.employees.booking_ID = ncd.booking.booking_ID
INNER JOIN ncd.clients on ncd.booking.client_ID = ncd.clients.client_ID
INNER JOIN ncd.menu on ncd.clients.drink_ID = ncd.menu.drink_ID;
```
Результат зароса:

| Номер бронирования| Имя гостя       | Любимый напиток  | Имя официанта   | Оценка работы официанта |
|-------------------|-----------------|------------------|-----------------|-------------------------|
| 1                 | John Doe        | Cappuccino       | Alice Johnson   | 4.5 stars               |
| 2                 | Jane Smith      | Latte            | Bob Smith       | 4 stars                 |
| 3                 | Bob Johnson     | Mocha            | Catherine Brown | 4.2 stars               |
| 4                 | Sarah Lee       | Tea              | David White     | 4.8 stars               |
| 5                 | Tom Wilson      | Hot Chocolate    | Emma Green      | 4.3 stars               |
| 6                 | Emily Davis     | Fresh Juice      | Frank Black     | 4.6 stars               |
| 7                 | Michael Brown   | Smoothie         | Grace Young     | 4.1 stars               |
| 8                 | Jessica Taylor  | Iced Coffee      | Henry Davis     | 4.7 stars               |
| 9                 | David Anderson  | Iced Tea         | Ivy Wilson      | 4.4 stars               |
| 10                | Olivia Martinez | Chai Latte       | Jack Roberts    | 4.9 stars               |

---

Представление 2 -- создание виртуальной таблицы _Supplies_. Здесь отражена информация о закупках алкоголя, включая столбцы из 3 разных таблиц.
```sql
CREATE VIEW Supplies AS
SELECT ncd.money.transaction_ID AS "Номер закупки",
	   ncd.money.date_ AS "Дата",
	   ncd.money.cost AS "Стоимость",
	   ncd.providers.company_title AS "Название компании",
	   ncd.menu.drink_title AS "Напиток",
	   ncd.providers.provider_rating AS "Рейтинг поставщика"
FROM ncd.money
INNER JOIN ncd.providers ON ncd.money.provider_ID = ncd.providers.provider_ID
INNER JOIN ncd.menu on ncd.providers.drink_ID = ncd.menu.drink_ID;
```
Результат зароса:

| Номер закупки | Дата                | Стоимость | Название компании     | Напиток       | Рейтинг поставщика |
|---------------|---------------------|-----------|-----------------------|---------------|--------------------|
| 1             | 2023-04-15 09:30:00 | 500       | Coffee Suppliers Inc. | Cappuccino    | 5 stars            |
| 2             | 2023-04-16 10:15:00 | 750       | Beverage World        | Latte         | 4 stars            |
| 3             | 2023-04-17 11:00:00 | 600       | Tea Emporium          | Mocha         | 4.5 stars          |
| 4             | 2023-04-18 13:45:00 | 900       | Choco Delights        | Tea           | 4 stars            |
| 5             | 2023-04-19 14:20:00 | 400       | Juice Masters         | Hot Chocolate | 4.5 stars          |
| 6             | 2023-04-20 15:00:00 | 550       | Fruit Fusion Co.      | Fresh Juice   | 4 stars            |
| 7             | 2023-04-21 16:30:00 | 700       | Smoothie Haven        | Smoothie      | 4.5 stars          |
| 8             | 2023-04-22 17:45:00 | 800       | Cold Brew Supplies    | Iced Coffee   | 4 stars            |
| 9             | 2023-04-23 09:00:00 | 650       | Tea Time Co.          | Iced Tea      | 4.5 stars          |
| 10            | 2023-04-24 10:45:00 | 850       | Spice & Brew          | Chai Latte    | 4 stars            |

---

Представление 3 -- создание виртуальной таблицы _ClientsView_. Является таблицей _clients_ с убранными техническими деталями.
```sql
CREATE VIEW ClientsView AS
SELECT ncd.clients.client_name AS "Имя и фамилия",
	   ncd.clients.client_phone AS "Номер телефона",
	   ncd.clients.client_email AS "электронная почта",
	   ncd.clients.attendance_dates AS "даты посещения",
	   ncd.clients.expenses AS "Сумма потраченных средств"
FROM ncd.clients;
```

---

Представление 4 -- создание виртуальной таблицы _BookingView_. Является таблицей _booking_ с убранными техническими деталями.
```sql
CREATE VIEW BookingView AS
SELECT ncd.booking.client_name AS "ФИО клиента",
	   ncd.booking.date_  AS "Дата",
	   ncd.booking.booking_status  AS "Статус бронирования",
	   ncd.booking.table_number  AS "№ стола"
FROM ncd.booking;
```
