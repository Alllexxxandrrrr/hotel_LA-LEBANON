-- Найти бронирования в диапазоне суммы
SELECT * FROM bookings WHERE total_price BETWEEN 10000 AND 30000 ORDER BY total_price;

-- Найти комнаты со статусом доступна или занята
SELECT * FROM rooms WHERE status IN ('available', 'occupied');

-- Найти комнаты, номера которых начинаются с 2
SELECT * FROM rooms WHERE room_number LIKE '2%' ORDER BY room_number;

-- Показать статусы задач без повторов
SELECT DISTINCT status FROM housekeeping ORDER BY status;

-- Рассчитать комиссию для оплат картой
SELECT payment_id, amount * 0.05 AS commission FROM payments WHERE method = 'Карта';

-- Найти гостей без email
SELECT * FROM guests WHERE email IS NULL;

-- Найти отменённые бронирования или недорогие
SELECT * FROM bookings WHERE status = 'cancelled' OR total_price < 15000;
