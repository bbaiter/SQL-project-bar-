--- Получить список всех доступных напитков и их цену:
SELECT drink_title, price
FROM ncd.menu
WHERE availability_ = TRUE;

--- Найти клиентов, совершивших покупки на сумму более 2 долларов:

SELECT client_name, expenses
FROM ncd.clients
WHERE expenses > 2;

--- Найти сотрудников старше 30 лет с зарплатой выше 3000 долларов:
SELECT employees_name, age, salary
FROM ncd.employees
WHERE age > 30 AND salary > 3000;

--- Получить список клиентов и их контактных данных:
SELECT client_name, client_phone, client_email
FROM ncd.clients;

--- Найти все бронирования с статусом "Confirmed":
SELECT *
FROM ncd.booking
WHERE booking_status = 'Confirmed';

--- Найти все транзакции, совершенные после определенной даты:
SELECT *
FROM ncd.money
WHERE date_ > '2022-06-01';

--- Получить список клиентов и названия напитков, которые они заказывали:
SELECT c.client_name, m.drink_title
FROM ncd.clients c
JOIN ncd.menu m ON c.drink_ID = m.drink_ID;

--- Найти поставщиков, которые поставляют напитки определенной категории:
SELECT p.company_title, m.category
FROM ncd.providers p
JOIN ncd.menu m ON p.drink_ID = m.drink_ID
WHERE m.category = 'Coffee';

--- Получить информацию о бронированиях клиентов и их контактные данные:
SELECT b.client_name, b.date_, c.client_phone, c.client_email
FROM ncd.booking b
JOIN ncd.clients c ON b.client_ID = c.client_ID;


--- Найти сотрудников, обслуживающих определенное бронирование:
SELECT e.employees_name, b.client_name, b.date_
FROM ncd.employees e
JOIN ncd.booking b ON e.booking_ID = b.booking_ID
WHERE b.booking_ID = 1;

--- Получить информацию о транзакциях и названиях напитков, связанных с ними:
SELECT mo.cost, m.drink_title
FROM ncd.money mo
JOIN ncd.providers p ON mo.provider_ID = p.provider_ID
JOIN ncd.menu m ON p.drink_ID = m.drink_ID;

--- Найти клиентов, которые заказывали напитки определенного поставщика:
SELECT c.client_name, p.company_title
FROM ncd.clients c
JOIN ncd.menu m ON c.drink_ID = m.drink_ID
JOIN ncd.providers p ON m.drink_ID = p.drink_ID
WHERE p.company_title = 'Coffee Suppliers Inc.';

--- Найти поставщиков, которые поставляют напитки, заказанные определенным клиентом:

SELECT p.company_title
FROM ncd.providers p
JOIN ncd.menu m ON p.drink_ID = m.drink_ID
JOIN ncd.clients c ON m.drink_ID = c.drink_ID
WHERE c.client_name = 'John Doe';

--- Найти сотрудников, которые обслуживают бронирования определенного клиента:

SELECT e.employees_name, e.position
FROM ncd.employees e
JOIN ncd.booking b ON e.booking_ID = b.booking_ID
WHERE b.client_name = 'John Doe';

--- Найти клиентов, которые заказывали напитки, поставляемые поставщиками с определенным рейтингом:

SELECT c.client_name
FROM ncd.clients c
JOIN ncd.menu m ON c.drink_ID = m.drink_ID
JOIN ncd.providers p ON m.drink_ID = p.drink_ID
WHERE p.provider_rating >= '4.5 stars'
GROUP BY c.client_name;

--- Найти клиентов, которые заказывали напитки, поставляемые поставщиками с определенным рейтингом, и сумму их расходов, отсортированную по убыванию:
SELECT c.client_name, SUM(c.expenses) AS total_expenses
FROM ncd.clients c
JOIN ncd.menu m ON c.drink_ID = m.drink_ID
JOIN ncd.providers p ON m.drink_ID = p.drink_ID
WHERE p.provider_rating >= '4 stars'
GROUP BY c.client_name
ORDER BY total_expenses DESC;

--- Найти поставщиков, их названия компаний, условия оплаты и рейтинг, а также имена напитков, которые они поставляют:

SELECT p.company_title, p.payment_conditions, p.provider_rating, m.drink_title
FROM ncd.providers p
JOIN ncd.menu m ON p.drink_ID = m.drink_ID;

--- Получить информацию о сотрудниках, их имена, возраст, должности и график работы, а также имена клиентов, которых они обслуживают:

SELECT e.employees_name, e.age, e.position, e.schedule, c.client_name
FROM ncd.employees e
JOIN ncd.booking b ON e.booking_ID = b.booking_ID
JOIN ncd.clients c ON b.client_ID = c.client_ID;

--- Найти клиентов, их имена, номера телефонов и email, а также названия напитков, которые они заказывали, и статус бронирования:

SELECT c.client_name, c.client_phone, c.client_email, m.drink_title, b.booking_status
FROM ncd.clients c
JOIN ncd.menu m ON c.drink_ID = m.drink_ID
JOIN ncd.booking b ON c.client_ID = b.client_ID;

--- Получить средний возраст клиентов, которые заказывали напитки категории 'Coffee', и средние расходы этих клиентов:
SELECT AVG(e.age) AS avg_age, AVG(c.expenses) AS avg_expenses
FROM ncd.clients c
JOIN ncd.menu m ON c.drink_ID = m.drink_ID
JOIN ncd.employees e ON c.client_ID = e.client_ID
WHERE m.category = 'Coffee';
