INSERT INTO ncd.menu (drink_ID, drink_title, price, category, ingredients, availability_)
VALUES
  (1, 'Cappuccino', 3.50, 'Coffee', 'Espresso, steamed milk, foam', TRUE),
  (2, 'Latte', 3.25, 'Coffee', 'Espresso, steamed milk', TRUE),
  (3, 'Mocha', 3.75, 'Coffee', 'Espresso, steamed milk, chocolate syrup', TRUE),
  (4, 'Tea', 2.50, 'Beverage', 'Hot tea', TRUE),
  (5, 'Hot Chocolate', 2.75, 'Beverage', 'Hot chocolate', TRUE),
  (6, 'Fresh Juice', 4.00, 'Beverage', 'Freshly squeezed orange juice', TRUE),
  (7, 'Smoothie', 4.50, 'Beverage', 'Blended yogurt, fruit', TRUE),
  (8, 'Iced Coffee', 3.00, 'Coffee', 'Cold brew coffee, ice', TRUE),
  (9, 'Iced Tea', 2.25, 'Beverage', 'Cold brew tea, ice', TRUE),
  (10, 'Chai Latte', 3.75, 'Coffee', 'Espresso, steamed milk, chai spices', TRUE);

INSERT INTO ncd.clients (client_ID, drink_ID, client_name, client_phone, client_email, attendance_dates, expenses)
VALUES
  (1, 1, 'John Doe', '555-1234', 'john@example.com', '2023-04-15 09:30:00', 3.50),
  (2, 2, 'Jane Smith', '555-5678', 'jane@example.com', '2023-04-15 10:15:00', 3.25),
  (3, 3, 'Bob Johnson', '555-9012', 'bob@example.com', '2023-04-16 11:00:00', 3.75),
  (4, 4, 'Sarah Lee', '555-3456', 'sarah@example.com', '2023-04-16 13:45:00', 2.50),
  (5, 5, 'Tom Wilson', '555-7890', 'tom@example.com', '2023-04-17 14:20:00', 2.75),
  (6, 6, 'Emily Davis', '555-2109', 'emily@example.com', '2023-04-17 15:00:00', 4.00),
  (7, 7, 'Michael Brown', '555-6543', 'michael@example.com', '2023-04-18 16:30:00', 4.50),
  (8, 8, 'Jessica Taylor', '555-0987', 'jessica@example.com', '2023-04-18 17:45:00', 3.00),
  (9, 9, 'David Anderson', '555-4321', 'david@example.com', '2023-04-19 09:00:00', 2.25),
  (10, 10, 'Olivia Martinez', '555-8765', 'olivia@example.com', '2023-04-19 10:45:00', 3.75);

INSERT INTO ncd.providers (provider_ID, drink_ID, company_title, provider_, address_, provider_phone, provider_email, payment_conditions, provider_rating)
VALUES
  (1, 1, 'Coffee Suppliers Inc.', 'John Smith', '123 Main Street, Cityville', '5551234', 'john@coffeesuppliers.com', 'Net 30', '5 stars'),
  (2, 2, 'Beverage World', 'Jane Doe', '456 Elm Street, Townsville', '555-5678', 'jane@beverageworld.com', 'Cash on delivery', '4 stars'),
  (3, 3, 'Tea Emporium', 'Mike Johnson', '789 Oak Avenue, Villagetown', '555-9012', 'mike@teaemporium.com', 'Net 15', '4.5 stars'),
  (4, 4, 'Choco Delights', 'Sarah Brown', '321 Pine Road, Hamlet City', '555-3456', 'sarah@chocodelights.com', 'Credit card', '4 stars'),
  (5, 5, 'Juice Masters', 'Tom Wilson', '654 Cedar Lane, Grovetown', '555-7890', 'tom@juicemasters.com', 'Net 45', '4.5 stars'),
  (6, 6, 'Fruit Fusion Co.', 'Emily Green', '987 Maple Drive, Riverside', '555-2109', 'emily@fruitfusion.com', 'Cash in advance', '4 stars'),
  (7, 7, 'Smoothie Haven', 'Michael White', '210 Walnut Street, Lakeside', '555-6543', 'michael@smoothiehaven.com', 'Net 60', '4.5 stars'),
  (8, 8, 'Cold Brew Supplies', 'Jessica Taylor', '543 Birch Avenue, Hilltop', '555-0987', 'jessica@coldbrewsupplies.com', 'Net 30', '4 stars'),
  (9, 9, 'Tea Time Co.', 'David Anderson', '876 Pinecrest Drive, Mountainview', '555-4321', 'david@teatimeco.com', 'Cash on delivery', '4.5 stars'),
  (10, 10, 'Spice & Brew', 'Olivia Martinez', '765 Oakwood Lane, Seaview', '555-8765', 'olivia@spiceandbrew.com', 'Net 30', '4 stars');
  
INSERT INTO ncd.booking (booking_ID, client_ID, client_name, date_, booking_status, table_number)
VALUES
  (1, 1, 'John Doe', '2023-04-15 09:30:00', 'Confirmed', 1),
  (2, 2, 'Jane Smith', '2023-04-15 10:15:00', 'Confirmed', 2),
  (3, 3, 'Bob Johnson', '2023-04-16 11:00:00', 'Confirmed', 3),
  (4, 4, 'Sarah Lee', '2023-04-16 13:45:00', 'Confirmed', 4),
  (5, 5, 'Tom Wilson', '2023-04-17 14:20:00', 'Confirmed', 5),
  (6, 6, 'Emily Davis', '2023-04-17 15:00:00', 'Confirmed', 6),
  (7, 7, 'Michael Brown', '2023-04-18 16:30:00', 'Confirmed', 7),
  (8, 8, 'Jessica Taylor', '2023-04-18 17:45:00', 'Confirmed', 8),
  (9, 9, 'David Anderson', '2023-04-19 09:00:00', 'Confirmed', 9),
  (10, 10, 'Olivia Martinez', '2023-04-19 10:45:00', 'Confirmed', 10);

INSERT INTO ncd.employees (employee_ID, booking_ID, employees_name, age, employee_phone, employee_email, position, hire_date, salary, schedule, education, employees_rating)
VALUES
  (1, 1, 'Alice Johnson', 28, '555-1111', 'alice@example.com', 'Waiter', '2022-05-10 08:00:00', 2500.00, 'Shift work', 'Hospitality Management', '4.5 stars'),
  (2, 2, 'Bob Smith', 35, '555-2222', 'bob@example.com', 'Chef', '2021-12-15 10:00:00', 3500.00, 'Full-time', 'Culinary Arts', '4 stars'),
  (3, 3, 'Catherine Brown', 30, '555-3333', 'catherine@example.com', 'Bartender', '2023-01-20 16:00:00', 2800.00, 'Evening shifts', 'Mixology Certification', '4.2 stars'),
  (4, 4, 'David White', 32, '555-4444', 'david@example.com', 'Manager', '2020-08-05 09:00:00', 4000.00, 'Flexible', 'Business Administration', '4.8 stars'),
  (5, 5, 'Emma Green', 27, '555-5555', 'emma@example.com', 'Server', '2022-03-10 11:00:00', 2300.00, 'Weekend shifts', 'Hospitality Management', '4.3 stars'),
  (6, 6, 'Frank Black', 40, '555-6666', 'frank@example.com', 'Sous Chef', '2021-06-25 12:00:00', 3200.00, 'Full-time', 'Culinary Arts', '4.6 stars'),
  (7, 7, 'Grace Young', 29, '555-7777', 'grace@example.com', 'Hostess', '2023-02-28 14:00:00', 2200.00, 'Evening shifts', 'Hospitality Management', '4.1 stars'),
  (8, 8, 'Henry Davis', 33, '555-8888', 'henry@example.com', 'Kitchen Manager', '2019-11-10 07:00:00', 3800.00, 'Full-time', 'Culinary Arts', '4.7 stars'),
  (9, 9, 'Ivy Wilson', 31, '555-9999', 'ivy@example.com', 'Waitress', '2022-09-15 08:30:00', 2400.00, 'Shift work', 'Hospitality Management', '4.4 stars'),
  (10, 10, 'Jack Roberts', 36, '555-1010', 'jack@example.com', 'Head Chef', '2018-07-20 10:30:00', 4500.00, 'Full-time', 'Culinary Arts', '4.9 stars');

INSERT INTO ncd.money (transaction_ID, provider_ID, date_, cost)
VALUES
  (1, 1, '2023-04-15 09:30:00', 500.00),
  (2, 2, '2023-04-16 10:15:00', 750.00),
  (3, 3, '2023-04-17 11:00:00', 600.00),
  (4, 4, '2023-04-18 13:45:00', 900.00),
  (5, 5, '2023-04-19 14:20:00', 400.00),
  (6, 6, '2023-04-20 15:00:00', 550.00),
  (7, 7, '2023-04-21 16:30:00', 700.00),
  (8, 8, '2023-04-22 17:45:00', 800.00),
  (9, 9, '2023-04-23 09:00:00', 650.00),
  (10, 10, '2023-04-24 10:45:00', 850.00);