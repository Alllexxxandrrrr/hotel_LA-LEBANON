-- Посчитать среднюю стоимость оплат по способу и статусу
SELECT method, status, AVG(amount) AS avg_amount
FROM payments
GROUP BY method, status
ORDER BY method, status;

-- Посчитать общую стоимость всех бронирований
SELECT SUM(total_price) AS total_booking_value
FROM bookings;

-- Найти минимальный этаж для каждого типа комнаты
SELECT room_type_id, MIN(floor) AS min_floor
FROM rooms
GROUP BY room_type_id
HAVING MIN(floor) >= 1
ORDER BY room_type_id;

-- Подсчитать количество комнат на втором этаже по статусам
SELECT status, COUNT(*) AS room_count
FROM rooms
WHERE floor = 2
GROUP BY status
ORDER BY status;

-- Посчитать количество комнат по типу комнаты
SELECT room_type_id, COUNT(*) AS rooms_count
FROM rooms
GROUP BY room_type_id
ORDER BY room_type_id;
