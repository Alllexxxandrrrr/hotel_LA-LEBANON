DROP TABLE IF EXISTS PAYMENTS CASCADE;
DROP TABLE IF EXISTS BOOKING_SERVICES CASCADE;
DROP TABLE IF EXISTS BOOKINGS CASCADE;
DROP TABLE IF EXISTS SERVICES CASCADE;
DROP TABLE IF EXISTS HOUSEKEEPING CASCADE;
DROP TABLE IF EXISTS GUESTS CASCADE;
DROP TABLE IF EXISTS ROOMS CASCADE;
DROP TABLE IF EXISTS ROOM_TYPES CASCADE;
DROP TABLE IF EXISTS STAFF CASCADE;

create table STAFF (
staff_id serial PRIMARY key,
first_name varchar(150) NOT NULL,
last_name varchar(150) NOT NULL,
role varchar(150) NOT NULL,
phone varchar(30)
);

create table ROOM_TYPES (
room_type_id serial PRIMARY key,
name varchar(150) NOT NULL,
capacity int NOT NULL,
base_price decimal(10,2) NOT NULL
);

create table ROOMS (
room_id serial PRIMARY key,
room_type_id int NOT NULL,
room_number varchar(50) NOT NULL,
floor int,
status varchar(50) NOT NULL,
foreign key (room_type_id) references ROOM_TYPES(room_type_id)
);

create table HOUSEKEEPING (
task_id serial PRIMARY key,
room_id int NOT NULL,
staff_id int,
task_type varchar(50) NOT NULL,
status varchar(50) NOT NULL,
scheduled_at timestamp,
completed_at timestamp,
foreign key (room_id) references ROOMS(room_id),
foreign key (staff_id) references STAFF(staff_id)
);

create table GUESTS (
guest_id serial PRIMARY key,
first_name varchar(150) NOT NULL,
last_name varchar(150) NOT NULL,
email varchar(150),
phone varchar(30)
);

create table BOOKINGS (
booking_id serial PRIMARY key,
room_id int NOT NULL,
guest_id int NOT NULL,
check_in date NOT NULL,
check_out date,
total_price decimal(10,2),
status varchar(50) NOT NULL,
foreign key (room_id) references ROOMS(room_id),
foreign key (guest_id) references GUESTS(guest_id) 
);

create table SERVICES (
service_id serial PRIMARY key,
name varchar(150) NOT NULL,
price decimal(10,2) NOT NULL,
description text
);

create table BOOKING_SERVICES (
booking_service_id serial PRIMARY key,
booking_id int NOT NULL,
service_id int NOT NULL,
quantity int NOT NULL,
service_date date,
foreign key (booking_id) references BOOKINGS(booking_id),
foreign key (service_id) references SERVICES(service_id) 
);

create table PAYMENTS (
payment_id serial PRIMARY key,
booking_id int NOT NULL,
amount decimal(10,2) NOT NULL,
method varchar(50),
status varchar(50) NOT NULL,
paid_at timestamp,
foreign key (booking_id) references BOOKINGS(booking_id) 
);
