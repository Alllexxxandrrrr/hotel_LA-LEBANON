-- Подсчитать количество комнат по этажу и статусу
SELECT floor, status, COUNT(*) AS room_count
FROM rooms
GROUP BY floor, status
ORDER BY floor, status;

-- Посчитать общую сумму оплаченных бронирований
SELECT SUM(amount) AS total_paid
FROM payments
WHERE status = 'Проведен';

-- Найти максимальную оплату по способу оплаты
SELECT method, MAX(amount) AS max_payment
FROM payments
GROUP BY method
HAVING MAX(amount) > 30000
ORDER BY max_payment DESC;

-- Найти минимальную стоимость бронирования по статусу
SELECT status, MIN(total_price) AS min_total_price
FROM bookings
GROUP BY status
ORDER BY status;

-- Подсчитать количество бронирований после 2026-10-01 по статусам
SELECT status, COUNT(*) AS bookings_count
FROM bookings
WHERE check_in >= '2026-10-01'
GROUP BY status
ORDER BY status;
