-- Найти имя гостя и даты бронирования
SELECT b.booking_id, g.first_name, g.last_name, b.check_in, b.check_out
FROM bookings b
INNER JOIN guests g ON b.guest_id = g.guest_id
ORDER BY b.booking_id;

-- Найти комнаты без назначенных задач по уборке
SELECT r.room_id, r.room_number, h.task_id
FROM rooms r
LEFT JOIN housekeeping h ON r.room_id = h.room_id
WHERE h.task_id IS NULL
ORDER BY r.room_number;

-- Показать бронирования с именами гостей и оплатами
SELECT b.booking_id, g.first_name, g.last_name, p.amount, p.status
FROM bookings b
INNER JOIN guests g ON b.guest_id = g.guest_id
INNER JOIN payments p ON p.booking_id = b.booking_id
ORDER BY b.booking_id;

-- Объединить имена гостей и сотрудников
SELECT first_name FROM guests
UNION
SELECT first_name FROM staff
ORDER BY first_name;

-- Показать услуги, которые были заказаны в бронированиях
SELECT b.booking_id, s.name, bs.quantity
FROM booking_services bs
INNER JOIN services s ON s.service_id = bs.service_id
INNER JOIN bookings b ON b.booking_id = bs.booking_id
ORDER BY b.booking_id;
