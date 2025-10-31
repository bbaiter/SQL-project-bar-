--- Создадим индексы для ускорения выполнения работы запросов, которые фильтруют или сортируют данные по указанным столбцам.

--- Индекс на столбцах drink_ID и drink_title в таблице ncd.menu
CREATE INDEX idx_menu_id_title
ON ncd.menu 
USING btree
(drink_ID, drink_title);

--- Индекс на столбцах client_ID, drink_ID и expenses в таблице ncd.clients
CREATE INDEX idx_clients_client_id_drink_id_expenses
ON ncd.clients 
USING btree
(client_ID, drink_ID, expenses);

--- Индекс на столбцах employee_ID, age и salary в таблице ncd.employees
CREATE INDEX idx_employees_employee_id_age_salary
ON ncd.employees
USING btree
(employee_ID, age, salary);

--- Индекс на столбцах booking_ID, client_ID и booking_status в таблице ncd.booking
CREATE INDEX idx_booking_booking_id_client_id_status
ON ncd.booking 
USING btree
(booking_ID, client_ID, booking_status);

--- Индекс на столбцах provider_ID и drink_ID в таблице ncd.providers
CREATE INDEX idx_providers_provider_id_drink_id
ON ncd.providers 
USING btree
(provider_ID, drink_ID);

--- Индекс на столбцах transaction_ID и provider_ID в таблице ncd.money:
CREATE INDEX idx_money_transaction_id_provider_id
ON ncd.money 
USING btree
(transaction_ID, provider_ID);

--- Индекс на столбцах client_ID, client_name и client_phone в таблице ncd.clients
CREATE INDEX idx_clients_client_id_name_phone
ON ncd.clients 
USING btree
(client_ID, client_name, client_phone);

--- Индекс на столбцах employee_ID, booking_ID и position в таблице ncd.employees
CREATE INDEX idx_employees_employee_id_booking_id_position
ON ncd.employees 
USING btree
(employee_ID, booking_ID, position);

--- Индекс на столбцах provider_ID, company_title и provider_rating в таблице ncd.providers
CREATE INDEX idx_providers_provider_id_company_rating
ON ncd.providers
USING btree
(provider_ID, company_title, provider_rating);