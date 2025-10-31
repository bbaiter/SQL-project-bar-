# bible for connection to database

import psycopg2
from config import host, user,password, db_name
import pandas as pd
import matplotlib.pyplot as plt

try:
  # connect to exist database
  connection = psycopg2.connect(
    host = host,
    user = user,
    password = password,
    database = db_name
  )
  connection.autocommit = True
  # the cursor for performing database operations
  # cursor = connection.cursor()

  with connection.cursor() as cursor:
    cursor.execute(
      "Select version();"
    )
    print(f"Server version: {cursor.fetchone()}")
    
  # already inserted

  with connection.cursor() as cursor:
    cursor.execute(
      """
      INSERT INTO ncd.menu (drink_ID, drink_title, price, category, ingredients, availability_)
      VALUES
      (11, 'Whiskey', 50.00, 'Liquor', 'Malted barley, corn, rye', TRUE),
      (12, 'Vodka', 30.00, 'Liquor', 'Potatoes, grains', TRUE),
      (13, 'Rum', 40.00, 'Liquor', 'Sugarcane, molasses', TRUE),
      (14, 'Gin', 35.00, 'Liquor', 'Juniper berries, botanicals', TRUE),
      (15, 'Tequila', 45.00, 'Liquor', 'Blue agave', TRUE),
      (16, 'Champagne', 60.00, 'Wine', 'Chardonnay, Pinot Noir, Pinot Meunier', TRUE),
      (17, 'Cognac', 70.00, 'Brandy', 'Grapes', TRUE),
      (18, 'Bourbon', 55.00, 'Whiskey', 'Corn, malted barley, rye', TRUE),
      (19, 'Scotch', 65.00, 'Whisky', 'Malted barley', TRUE),
      (20, 'Absinthe', 75.00, 'Liquor', 'Wormwood, anise, fennel', TRUE);
      """
    )
    print("[INFO] Insert successfully completed")

   # already inserted

  with connection.cursor() as cursor:
    cursor.execute(
      """
      INSERT INTO ncd.clients (client_ID, drink_ID, client_name, client_phone, client_email, attendance_dates, expenses)
      VALUES
      (11, 11, 'Alice', '1234567890', 'alice@example.com', '2024-05-01 08:00:00', 50.00),
      (12, 12, 'Bob', '9876543210', 'bob@example.com', '2024-05-02 09:00:00', 40.00),
      (13, 13, 'Charlie', '4567890123', 'charlie@example.com', '2024-05-03 10:00:00', 60.00),
      (14, 14, 'David', '7890123456', 'david@example.com', '2024-05-04 11:00:00', 45.00),
      (15, 15, 'Eve', '2345678901', 'eve@example.com', '2024-05-05 12:00:00', 55.00),
      (16, 16, 'Frank', '8901234567', 'frank@example.com', '2024-05-06 13:00:00', 70.00),
      (17, 17, 'Grace', '3456789012', 'grace@example.com', '2024-05-07 14:00:00', 65.00),
      (18, 18, 'Henry', '9012345678', 'henry@example.com', '2024-05-08 15:00:00', 75.00),
      (19, 19, 'Ivy', '4567890123', 'ivy@example.com', '2024-05-09 16:00:00', 80.00),
      (20, 20, 'Jack', '9876543210', 'jack@example.com', '2024-05-10 17:00:00', 90.00);
      """
    )
    print("[INFO] Insert successfully completed")

    columns=["client_ID", "drink_ID", "client_name", "client_phone", "client_email", "attendance_dates", "expenses"]
    df = pd.DataFrame(columns=columns)
    cursor.execute(f"SELECT {', '.join(columns)} FROM ncd.clients")
    print("[INFO] Select successfully completed")
    rows = cursor.fetchall()
    
except Exception as _ex:
  print("[INFO] ERROR while working with PostgreSQL", _ex)
finally:

  # close connection

  if connection:
    connection.close()
    print("[INFO] PostgreSQL connection closed")

# data analysis
# Creating DataFrame from selected data
df = pd.DataFrame(rows, columns=columns)

# attendance_dates -> datetime
df['attendance_dates'] = pd.to_datetime(df['attendance_dates'])

# СCreating graph "expenses" by "client_ID"
plt.figure(figsize=(10, 6))
plt.scatter(df['client_ID'], df['expenses'])
plt.xlabel('Client ID')
plt.ylabel('Expenses $')
plt.title('Expenses by Client ID')
plt.grid()

# adding points with min and max expenses
min_expenses = df['expenses'].min()
max_expenses = df['expenses'].max()

plt.scatter(df['client_ID'][df['expenses'].idxmin()], min_expenses, color='red', label=f'Min: {min_expenses}')
plt.scatter(df['client_ID'][df['expenses'].idxmax()], max_expenses, color='green', label=f'Max: {max_expenses}')

plt.legend()
plt.show()