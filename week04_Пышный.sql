
SELECT count(*) FROM guests g  WHERE g.email  LIKE '%mail.ru';

SELECT booking_id, sum(amount) AS total_paid FROM payments GROUP BY booking_id HAVING sum(amount) > 25000;

SELECT  rt.room_type_id, rt.capacity  FROM room_types rt ORDER BY capacity DESC;

SELECT h.staff_id, h.task_type, count(*)   FROM housekeeping h 
WHERE staff_id IN (SELECT staff_id FROM staff WHERE ROLE = 'Горничная') AND status = 'Завершено'
GROUP BY h.staff_id, h.task_type ORDER BY h.staff_id ASC, count(*) DESC;

SELECT * FROM bookings b WHERE b.total_price = (SELECT MIN(b.total_price )FROM bookings b 
WHERE b.total_price > (SELECT AVG(total_price) FROM bookings));
