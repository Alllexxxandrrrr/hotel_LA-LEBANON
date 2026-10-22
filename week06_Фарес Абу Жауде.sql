-- Найти гостей, бронировавших номера типа Люкс
SELECT DISTINCT g.guest_id, g.first_name, g.last_name
FROM guests g
JOIN bookings b ON b.guest_id = g.guest_id
JOIN rooms r ON r.room_id = b.room_id
WHERE r.room_type_id IN (
  SELECT room_type_id
  FROM room_types
  WHERE name = 'Люкс'
)
ORDER BY g.guest_id;

-- Найти гостей, у которых есть хотя бы одно бронирование
SELECT g.guest_id, g.first_name, g.last_name
FROM guests g
WHERE EXISTS (
  SELECT 1
  FROM bookings b
  WHERE b.guest_id = g.guest_id
)
ORDER BY g.guest_id;

-- Посчитать, сколько услуг заказано на каждом бронировании
SELECT *
FROM (
  SELECT booking_id, COUNT(*) AS service_count
  FROM booking_services
  GROUP BY booking_id
) AS sub
WHERE service_count > 1
ORDER BY service_count DESC;

-- Посчитать общую выручку с каждого гостя
WITH GuestRevenue AS (
  SELECT guest_id, SUM(total_price) AS total_spent
  FROM bookings
  GROUP BY guest_id
)
SELECT g.guest_id, g.first_name, g.last_name, gr.total_spent
FROM guests g
JOIN GuestRevenue gr ON gr.guest_id = g.guest_id
ORDER BY gr.total_spent DESC;

-- Найти гостей, чьи расходы выше среднего по всем бронированиям
SELECT g.guest_id, g.first_name, g.last_name, SUM(b.total_price) AS total_spent
FROM guests g
JOIN bookings b ON b.guest_id = g.guest_id
WHERE b.total_price > (
  SELECT AVG(total_price)
  FROM bookings
)
GROUP BY g.guest_id, g.first_name, g.last_name
ORDER BY total_spent DESC;
