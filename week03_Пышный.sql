SELECT * FROM staff s 
WHERE s."role"  IN ('Горничная','Охранник', 'Администратор') OR  s.staff_id > 15;

SELECT * FROM staff s   
ORDER BY last_name ASC;

SELECT * FROM guests g 
WHERE email LIKE '%@mail.ru';

SELECT * FROM booking_services bs 
WHERE bs.booking_service_id BETWEEN 1 AND 10 AND  bs.service_id  = 5;

SELECT DISTINCT role FROM staff rt ; 

SELECT first_name  || ' ' || last_name AS full_name FROM STAFF; 

SELECT * FROM payments p WHERE p.paid_at IS NULL;
