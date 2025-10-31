# Создание функций

Для схемы таблиц создадим 3 хранимые функции

---

Хранимая функция №1 _CalculateAverageExpenses_ вычисляет средние расходы клиентов на напитки из таблицы _ncd.clients_ и возвращает это значение. 

```sql
CREATE FUNCTION CalculateAverageExpenses()
RETURNS NUMERIC
AS $$
DECLARE
    avg_expenses NUMERIC;
BEGIN
    SELECT AVG(expenses) INTO avg_expenses
    FROM ncd.clients;
    RETURN avg_expenses;
END;
$$
 LANGUAGE plpgsql;
```
Для вызова функции достаточно вызова _SELECT_:
```sql
SELECT CalculateAverageExpenses();
```

---

Хранимая функция №2 _FindProvidersByDrinkCategoryAndRating_ для поиска поставщиков, которые поставляют напитки определенной категории и имеют рейтинг выше указанного: 

```sql
CREATE FUNCTION FindProvidersByDrinkCategoryAndRating(category VARCHAR(200), rating VARCHAR(200))
RETURNS TABLE (company_title VARCHAR(200), provider_ VARCHAR(200), provider_rating VARCHAR(200))
AS $$
BEGIN
    RETURN QUERY
    SELECT p.company_title, p.provider_, p.provider_rating
    FROM ncd.providers p
    JOIN ncd.menu m ON p.drink_ID = m.drink_ID
    WHERE m.category = $1 AND p.provider_rating > $2;
END;
$$
 LANGUAGE plpgsql;

```
Для вызова функции достаточно просто передать нужные параметры:
```sql
SELECT *
FROM FindProvidersByDrinkCategoryAndRating('Coffee', '4 stars');

```

Хранимая функция №3 _GenerateRandomDish_ для генерации случайного блюда из меню:

```sql
CREATE FUNCTION GenerateRandomDish()
RETURNS TABLE (menu_drink_title VARCHAR(200), menu_price NUMERIC, menu_category VARCHAR(200), menu_ingredients VARCHAR(200))
AS $$
BEGIN
    RETURN QUERY
    SELECT menu.drink_title, menu.price, menu.category, menu.ingredients
    FROM ncd.menu
    ORDER BY RANDOM()
    LIMIT 1;
END;
$$
 LANGUAGE plpgsql;
```
Для вызова функции достаточно вызова _SELECT * from_:
```sql
SELECT * from GenerateRandomDish();
```


