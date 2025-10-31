# Создание триггеров

Триггеры в SQL - это специальные хранимые процедуры, которые автоматически выполняются при наступлении определенного события в базе данных, такого как вставка, обновление или удаление данных в таблице. В PostgreSQL триггеры создаются в два этапа: сначала определяется функция триггера, а затем сам триггер. Код ниже напишен в соответсвии с этим правилом.

Создадим 3 триггера для нашей схемы таблиц.

---

Триггер №1 _UpdateTotalExpenses_ для автоматического обновления общей суммы расходов клиента при добавлении нового расхода. 

```sql
CREATE OR REPLACE FUNCTION UpdateTotalExpensesFunction()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE ncd.clients c
    SET expenses = (SELECT SUM(expenses) FROM ncd.clients WHERE client_ID = NEW.client_ID)
    WHERE c.client_ID = NEW.client_ID;
    RETURN NEW;
END;
$$
 LANGUAGE plpgsql;

CREATE TRIGGER UpdateTotalExpenses
AFTER INSERT ON ncd.clients
FOR EACH ROW
EXECUTE FUNCTION UpdateTotalExpensesFunction();

```

Триггер №2 _UpdateProviderRating_ для автоматического обновления рейтинга поставщика при изменении его условий оплаты.
```sql
CREATE OR REPLACE FUNCTION UpdateProviderRatingFunction()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.payment_conditions = 'Immediate Payment' THEN
        NEW.provider_rating := 'High';
    ELSE
        NEW.provider_rating := 'Standard';
    END IF;
    RETURN NEW;
END;
$$
 LANGUAGE plpgsql;

CREATE TRIGGER UpdateProviderRating
AFTER UPDATE OF payment_conditions ON ncd.providers
FOR EACH ROW
EXECUTE FUNCTION UpdateProviderRatingFunction();

```

Триггер №3 _UpdateAvailabilityTrigger_ автоматического обновления _availability_ в таблице menu при изменении количества доступных напитков.
```sql
CREATE OR REPLACE FUNCTION update_availability()
RETURNS TRIGGER AS $$
BEGIN
    IF (SELECT COUNT(*) FROM ncd.clients WHERE drink_ID = NEW.drink_ID) = 0 THEN
        UPDATE ncd.menu
        SET availability_ = TRUE
        WHERE drink_ID = NEW.drink_ID;
    ELSE
        UPDATE ncd.menu
        SET availability_ = FALSE
        WHERE drink_ID = NEW.drink_ID;
    END IF;
    RETURN NULL;
END;
$$
 LANGUAGE plpgsql;

CREATE TRIGGER UpdateAvailabilityTrigger
AFTER INSERT OR DELETE ON ncd.clients
FOR EACH ROW
EXECUTE FUNCTION update_availability();

```

