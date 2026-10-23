-- Найти суммы оплат по бронированиям
SELECT b.booking_id, b.total_price, p.amount, p.method
FROM bookings b
INNER JOIN payments p ON p.booking_id = b.booking_id
WHERE p.status = 'Проведен'
ORDER BY b.booking_id;

-- Показать всех сотрудников и задачи по уборке, даже без назначенного сотрудника
SELECT s.staff_id, s.first_name, h.task_id, h.task_type
FROM housekeeping h
RIGHT JOIN staff s ON s.staff_id = h.staff_id
ORDER BY s.staff_id;

-- Показать комнаты с типами и текущими задачами
SELECT r.room_id, r.room_number, rt.name AS room_type, h.task_type
FROM rooms r
INNER JOIN room_types rt ON rt.room_type_id = r.room_type_id
LEFT JOIN housekeeping h ON h.room_id = r.room_id
ORDER BY r.room_id;

-- Найти гостей с бронированием, но без оплаты
SELECT g.guest_id, g.first_name, g.last_name
FROM guests g
JOIN bookings b ON b.guest_id = g.guest_id
EXCEPT
SELECT g.guest_id, g.first_name, g.last_name
FROM guests g
JOIN bookings b ON b.guest_id = g.guest_id
JOIN payments p ON p.booking_id = b.booking_id
ORDER BY guest_id;

-- Показать количество задач по каждому сотруднику
SELECT s.staff_id, s.first_name, COUNT(h.task_id) AS task_count
FROM staff s
LEFT JOIN housekeeping h ON h.staff_id = s.staff_id
GROUP BY s.staff_id, s.first_name
ORDER BY s.staff_id;
