🚗 Vehicle Rental System – Database Design & SQL Queries
📌 Project Overview

This project represents the database design and SQL implementation of a Vehicle Rental System.
The main objective is to demonstrate a clear understanding of:

Relational database design

Entity Relationship Diagram (ERD)

SQL queries using JOIN, EXISTS, WHERE, GROUP BY, and HAVING

This database allows users to rent vehicles, manage bookings, and track vehicle availability efficiently.



🗂️ Database Structure

The database consists of three core tables:

1.Users

2.Vehicles

3.Bookings

These tables are connected using primary keys and foreign keys to maintain relational integrity.




🧩 Entity Relationship Diagram (ERD)
📘 Entities & Attributes
1️⃣ Users

id (Primary Key)

name

email

role (admin / customer)

created_at

2️⃣ Vehicles

id (Primary Key)

name

type (Car, Bike, SUV, etc.)

price_per_day

is_available

created_at

3️⃣ Bookings

id (Primary Key)

user_id (Foreign Key → Users)

vehicle_id (Foreign Key → Vehicles)

start_date

end_date

total_price

status (confirmed, cancelled, completed)


🔗 Relationships

One User → Many Bookings

One Vehicle → Many Bookings

Each booking is associated with:

exactly one user

exactly one vehicle

This ensures a normalized and scalable database design.


🧪 Sample Data

The database contains demo data (6–10 rows per table) for testing purposes.
This includes:

Multiple users (customers & admins)

Different vehicle types

Bookings with different statuses

The demo data enables proper testing of JOIN, GROUP BY, and EXISTS queries.



🧠 SQL Queries Implemented
🔹 Query 1: INNER JOIN

Retrieve booking information with customer and vehicle details

SELECT 
    u.name AS customer_name,
    v.name AS vehicle_name,
    b.start_date,
    b.end_date,
    b.status
FROM bookings b
INNER JOIN users u ON b.user_id = u.id
INNER JOIN vehicles v ON b.vehicle_id = v.id;

📌 Purpose:
Combines data from multiple tables to show complete booking information.


🔹 Query 2: NOT EXISTS

Find vehicles that have never been booked

SELECT *
FROM vehicles v
WHERE NOT EXISTS (
    SELECT 1
    FROM bookings b
    WHERE b.vehicle_id = v.id
);


📌 Purpose:
Identifies unused vehicles by checking the absence of related booking records.



🔹 Query 3: WHERE

Retrieve all available vehicles of a specific type (Car)

SELECT *
FROM vehicles
WHERE type = 'Car'
AND is_available = true;


📌 Purpose:
Filters vehicles based on type and availability.



🔹 Query 4: GROUP BY & HAVING

Find vehicles with more than 2 bookings

SELECT 
    v.name AS vehicle_name,
    COUNT(b.id) AS total_bookings
FROM bookings b
JOIN vehicles v ON b.vehicle_id = v.id
GROUP BY v.name
HAVING COUNT(b.id) > 2;


📌 Purpose:
Analyzes booking frequency and displays only high-demand vehicles.




✅ Key Concepts Demonstrated

Relational Database Design

Primary Key & Foreign Key relationships

INNER JOIN

NOT EXISTS

WHERE clause filtering

GROUP BY and HAVING with aggregate functions

Clean and normalized schema

🎯 Conclusion

This project demonstrates a well-structured relational database system for a Vehicle Rental Service.
It effectively showcases database modeling skills, SQL query writing, and data relationship management — essential for backend and full-stack development.



