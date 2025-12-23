CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    fullName VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    role VARCHAR(20) CHECK (role IN ('admin', 'customer')) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE vehicles (
    id SERIAL PRIMARY KEY,
    vehicle_name VARCHAR(100) NOT NULL,
    vehicleType VARCHAR(50) NOT NULL,
    vehicleModel VARCHAR(50) NOT NULL,
    rental_price_per_day INT NOT NULL,
    is_available BOOLEAN DEFAULT true,
    registration_number VARCHAR(50) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price INT NOT NULL,
    status VARCHAR(20) CHECK (status IN ('confirmed', 'cancelled', 'completed')),

    CONSTRAINT fk_user
        FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_vehicle
        FOREIGN KEY (vehicle_id) REFERENCES vehicles(id)
        ON DELETE CASCADE
);


INSERT INTO users (fullName, email, role) VALUES
('Rifat Islam', 'rifat@gmail.com', 'customer'),
('Hasan Ali', 'hasan@gmail.com', 'customer'),
('Nusrat Jahan', 'nusrat@gmail.com', 'customer'),
('Tanvir Ahmed', 'tanvir@gmail.com', 'customer'),
('Admin One', 'admin1@gmail.com', 'admin'),
('Admin Two', 'admin2@gmail.com', 'admin'),
('Sabbir Hossain', 'sabbir@gmail.com', 'customer'),
('Mim Akter', 'mim@gmail.com', 'customer');


INSERT INTO vehicles (vehicle_name, vehicleType, rental_price_per_day, is_available) VALUES
('Toyota Corolla', 'Car', 3000, true),
('Honda Civic', 'Car', 3500, true),
('Yamaha R15', 'Bike', 1200, true),
('Suzuki Gixxer', 'Bike', 1000, false),
('Toyota Hiace', 'Microbus', 5000, true),
('Nissan X-Trail', 'SUV', 4500, true),
('Hyundai Creta', 'SUV', 4000, false),
('Bajaj Pulsar', 'Bike', 900, true);


INSERT INTO bookings 
(user_id, vehicle_id, start_date, end_date, total_price, status)
VALUES
(1, 1, '2025-01-01', '2025-01-03', 6000, 'completed'),
(2, 2, '2025-01-05', '2025-01-07', 7000, 'completed'),
(3, 3, '2025-01-10', '2025-01-12', 2400, 'completed'),
(4, 4, '2025-01-15', '2025-01-16', 1000, 'cancelled'),
(1, 5, '2025-02-01', '2025-02-03', 10000, 'confirmed'),
(6, 6, '2025-02-05', '2025-02-08', 13500, 'confirmed'),
(7, 8, '2025-02-10', '2025-02-12', 1800, 'confirmed'),
(8, 1, '2025-02-15', '2025-02-17', 6000, 'confirmed');





-- Queyry-1

SELECT 
    u.fullName AS customer_name,
    v.vehicle_name AS vehicle_name,
    b.start_date,
    b.end_date,
    b.status
FROM bookings b
INNER JOIN users u ON b.user_id = u.id
INNER JOIN vehicles v ON b.vehicle_id = v.id;



-- Query-2

SELECT *
FROM vehicles v
WHERE NOT EXISTS (
    SELECT 1
    FROM bookings b
    WHERE b.vehicle_id = v.id
);


-- Query-3

SELECT *
FROM vehicles
WHERE type = 'Car'
AND is_available = true;


-- Query-4

SELECT 
    v.vehicle_name AS vehicle_name,
    COUNT(b.id) AS total_bookings
FROM bookings b
JOIN vehicles v ON b.vehicle_id = v.id
GROUP BY v.vehicle_name
HAVING COUNT(b.id) > 2;










