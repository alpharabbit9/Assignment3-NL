

# 🚗 Vehicle Rental System – Database Design & SQL Queries

## 📌 Project Overview

This project presents the **database design and SQL implementation** of a **Vehicle Rental System**.
Its primary goal is to demonstrate a strong understanding of:

* Relational database design principles
* Entity Relationship Diagrams (ERD)
* SQL querying techniques using `JOIN`, `EXISTS`, `WHERE`, `GROUP BY`, and `HAVING`

The system enables users to rent vehicles, manage bookings, and track vehicle availability efficiently through a well-structured relational database.

---

## 🗂️ Database Structure

The database consists of **three core tables**:

1. **Users**
2. **Vehicles**
3. **Bookings**

These tables are linked using **primary keys** and **foreign keys** to ensure data integrity and maintain relational consistency.

---

## 🧩 Entity Relationship Diagram (ERD)

### 📘 Entities & Attributes

#### 1️⃣ Users

* `id` (Primary Key)
* `name`
* `email`
* `role` (admin / customer)
* `created_at`

#### 2️⃣ Vehicles

* `id` (Primary Key)
* `name`
* `type` (Car, Bike, SUV, etc.)
* `price_per_day`
* `is_available`
* `created_at`

#### 3️⃣ Bookings

* `id` (Primary Key)
* `user_id` (Foreign Key → Users)
* `vehicle_id` (Foreign Key → Vehicles)
* `start_date`
* `end_date`
* `total_price`
* `status` (confirmed, cancelled, completed)

---

## 🔗 Relationships

* **One User → Many Bookings**
* **One Vehicle → Many Bookings**

Each booking:

* Is linked to **exactly one user**
* Is linked to **exactly one vehicle**

This structure ensures a **normalized, scalable, and maintainable** database design.

---

## 🧪 Sample Data

The database includes **demo data (6–10 rows per table)** for testing and validation, featuring:

* Multiple users (customers and admins)
* Various vehicle types
* Bookings with different statuses

This sample data supports effective testing of `JOIN`, `GROUP BY`, and `EXISTS` queries.

---

## 🧠 SQL Queries Implemented

### 🔹 Query 1: INNER JOIN

**Retrieve booking details along with customer and vehicle information**

```sql
SELECT 
    u.name AS customer_name,
    v.name AS vehicle_name,
    b.start_date,
    b.end_date,
    b.status
FROM bookings b
INNER JOIN users u ON b.user_id = u.id
INNER JOIN vehicles v ON b.vehicle_id = v.id;
```

**📌 Purpose:**
Combines data from multiple tables to display complete booking information.

---

### 🔹 Query 2: NOT EXISTS

**Find vehicles that have never been booked**

```sql
SELECT *
FROM vehicles v
WHERE NOT EXISTS (
    SELECT 1
    FROM bookings b
    WHERE b.vehicle_id = v.id
);
```

**📌 Purpose:**
Identifies unused vehicles by checking for the absence of related booking records.

---

### 🔹 Query 3: WHERE

**Retrieve all available vehicles of a specific type (Car)**

```sql
SELECT *
FROM vehicles
WHERE type = 'Car'
AND is_available = true;
```

**📌 Purpose:**
Filters vehicles based on availability and category.

---

### 🔹 Query 4: GROUP BY & HAVING

**Find vehicles with more than two bookings**

```sql
SELECT 
    v.name AS vehicle_name,
    COUNT(b.id) AS total_bookings
FROM bookings b
JOIN vehicles v ON b.vehicle_id = v.id
GROUP BY v.name
HAVING COUNT(b.id) > 2;
```

**📌 Purpose:**
Analyzes booking frequency to identify high-demand vehicles.

---

## ✅ Key Concepts Demonstrated

* Relational database design
* Primary key and foreign key relationships
* `INNER JOIN` operations
* `NOT EXISTS` subqueries
* Filtering with `WHERE`
* Aggregation using `GROUP BY` and `HAVING`
* Clean, normalized schema design

---

## 🎯 Conclusion

This project demonstrates a **well-structured relational database system** for a Vehicle Rental Service.
It effectively showcases **database modeling**, **SQL query proficiency**, and **data relationship management**—key skills for backend and full-stack development.

---

