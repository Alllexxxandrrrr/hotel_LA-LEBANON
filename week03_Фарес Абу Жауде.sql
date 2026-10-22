-- Найти подтверждённые бронирования в диапазоне цены
SELECT * FROM bookings WHERE status = 'confirmed' AND total_price BETWEEN 20000 AND 40000;

-- Найти оплаты наличными или картой
SELECT * FROM payments WHERE method IN ('Карта', 'Наличные');

-- Найти подтверждённые бронирования или дорогие
SELECT * FROM bookings WHERE status = 'confirmed' OR total_price > 30000;

-- Найти гостей с номером в мобильном формате
SELECT * FROM guests WHERE phone LIKE '+7900%' ORDER BY last_name;

-- Показать все способы оплаты без повторов
SELECT DISTINCT method FROM payments ORDER BY method;

-- Рассчитать депозит для подтверждённых бронирований
SELECT booking_id, total_price * 0.10 AS deposit FROM bookings WHERE status = 'confirmed';

-- Найти задачи, которые ещё не завершены
SELECT * FROM housekeeping WHERE completed_at IS NULL;
