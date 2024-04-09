DROP DATABASE IF EXISTS cinema_tickets_booking_system;
CREATE DATABASE cinema_tickets_booking_system;
USE cinema_tickets_booking_system;

-- CREATING CUSTOMERS TABLE
create table customers (
           id int primary key,
          first_name varchar(45),
          last_name varchar(45) not null,
          email varchar(45) not null unique,
          phone_number varchar(15),
          place varchar(25),
          interests_language varchar(15),
          interests_place varchar(25),
          interests_seattype varchar(20),
          social_media_linked varchar(25),
          customer_review decimal(3,2)
 );

-- CREATING FILMS TABLE
    create table films (
            id int primary key ,
	name varchar(45) not null unique,
	length_min int not null,
            genre varchar(20) not null,
             rating decimal(3,2),
             director varchar(25),
             type char(3),
             language varchar(15),
	dubbed boolean,
            dubbed_language varchar(15)
     );
    
    -- CREATING ROOMS TABLE
create table rooms (
	id int primary key,
	name varchar(45) not null,
	total_seats int not null,
            leg_space boolean,
            seat_royal_cost decimal(5,2),
            seat_normal_cost decimal(5,2),
            seat_budget_cost decimal(5,2),
            room_vip boolean,
            vip_cost decimal(5,2),
            audio_type varchar(20)
         );
         
-- CREATING SCREENINGS TABLE
create table screenings (
	id int primary key ,
	film_id int not null,
	room_id int not null, 
	start_date date not null,
            start_time time,
            screening_type varchar(50),
            seat_reserve_option boolean,
            seat_reserved int,
            box_seats boolean,
            screening_rating decimal(3,2),
   	foreign key (film_id) references films(id),
	foreign key (room_id) references rooms(id)
        );
        
-- CREATING BOOKINGS TABLE
create table bookings (
	id int primary key ,
	screening_id int not null, 
	customer_id int not null,
           booking_date date,
           no_seats_booked int,
           payment_method varchar(20),
            transaction_id varchar(15),
           satisfied_booking boolean,
           booking_food boolean,
           food_cost decimal(5,2),
           foreign key (customer_id) references customers(id),
           foreign key (screening_id) references screenings(id)
       );
       
-- CREATING SEATS TABLE
create table seats (
	id int primary key auto_increment, 
            seat_row varchar(2) not null,
	seat_number int not null,
	room_id int not null, 
	foreign key (room_id) references rooms(id)
         );
         
-- CREATING RESERVED_SEAT TABLE
create table reserved_seat (
	id int primary key auto_increment,
	booking_id int not null,
	seat_id int not null,
	foreign key (booking_id) references bookings(id),
	foreign key (seat_id) references seats(id)
         );

-- INSERTING VALUES INTO CUSTOMERS
insert into customers values(1,'Micheal','Dixy','michdix@gmail.com','9586589215','Sarjapura','Hindi','Bellandur','vip seating','facebook',4.2);
insert into customers values(2,'Rahul','raj','rahraj@gmail.com','9586888215','Marathahalli','Telugu','JP nagar','full rocker','facebook',4.1);
insert into customers values(3,'Ram','Charan','ramcharan@gmail.com','7886589215','Whitefield','English','Bellandur','recliner','twitter',3.5);
insert into customers values(4,'John','Abhraham','johabra@gmail.com','8886589215','Koramangala','Hindi','Sarjapura','glider','instagram',3.0);
insert into customers values(5,'Rakhi','Singh','rakhsing@gmail.com','9458729215','Whitefield','Hindi','Madiwala','vip seating','instagram',4.8);
insert into customers values(6,'Mitchell','mMgesh','michmag@gmail.com','8752236415','Ashok nagar','English','MG road','glider','facebook',5.0);
insert into customers values(7,'Meghana','Ganesh','meghganeg@gmail.com','8778524115','Begum nagar','English','Brookfield','glider','twitter',5.0);
insert into customers values(8,'Ramya','sri','ramsri@gmail.com','7894561230','ITI gate','Tamil','MG road','vip seating','twitter',5.0);
insert into customers values(9,'Tanya','sai','tanyasri@gmail.com','9875632140','Bommanahalli','Kannada','Bellandur','full rocker','instagram',5.0);
insert into customers values(10,'Prasanna','krishna','prasakrishna@gmail.com','6587412390','Begum nagar','Kannada','Sarjapura','recliners','twitter',5.0);

-- INSERTING VALUES INTO FILMS
insert into films values(1,'The Mist',120,'Horror',3.5,'Frank','2D','English',0,'null');
insert into films values(2,'Brahmotsavam',150,'Drama',3.8,'srikanth addala','2D','Telugu',0,'null');
insert into films values(3,'Tevar',100,'Drama',3.3,'Gunasekhar','2D','Telugu',1,'Hindi');
insert into films values(4,'Happy days',180,'Horror',3.2,'sekhar kammula','2D','telugu',0,'null');
insert into films values(5,'The walk',140,'Adventure',4.0,'Robert','3D','English',1,'Korean');
insert into films values(6,'Pyaar',140,'Romance',3.1,'oberoi khan','2D','Hindi',1,'Tamil');
insert into films values(7,'Banogi',220,'Horror',2.9,'sam khan','3D','Hindi',0,'null');
insert into films values(8,'Devagiri',150,'Mystery',4.5,'sulaiman','2D','Hindi',1,'French');
insert into films values(9,'lovsy',120,'Fantasy',4.5,'samaira','3D','English',0,'null');

-- INSERTING VALUES INTO SCREENINGS
insert into screenings values(1,1,3,'2023-07-30','12:00:00','70mm',1,100,1,3.5);
insert into screenings values(2,4,1,'2023-07-01','12:00:00','35mm',0,null,1,3.9);
insert into screenings values(3,6,5,'2023-07-05','13:00:00','4k',1,350,1,4.5);
insert into screenings values(4,2,6,'2023-07-05','12:00:00','4k',0,null,1,4.5);
insert into screenings values(5,1,1,'2023-07-05','12:00:00','35mm',1,200,1,2.5);
insert into screenings values(6,6,1,'2023-07-05','16:00:00','70mm',0,null,1,1.5);
insert into screenings values(7,3,2,'2023-07-06','18:00:00','4k',1,200,1,3.6);
insert into screenings values(8,3,5,'2023-07-07','12:00:00','35mm',1,300,1,3.7);
insert into screenings values(9,7,3,'2023-07-31','15:00:00','4kmm',0,null,1,3.8);
insert into screenings values(10,9,5,'2023-07-28','21:00:00','8k',1,400,1,4.9);

-- INSERTING VALUES INTO ROOMS
insert into rooms values(1,'den',72,1,300.00,250.00,150.00,1,500.00,'dolby atmos');
insert into rooms values(2,'radha',36,0,350.00,250.00,100.00,1,500.00,'dolby digital');
insert into rooms values(3,'mahesha',36,0,500.00,350.00,170.00,0,null,'dolby atmos');
insert into rooms values(4,'raj',400,72,320.00,200.00,170.00,1,600.00,'dts');
insert into rooms values(5,'meerai',36,1,300.00,250.00,180.00,0,null,'dts');
insert into rooms values(6,'rati',36,1,500.00,350.00,250.00,1,700.00,'dolby digital');

-- INSERTING VALUES INTO BOOKINGS
insert into bookings values(1,1,4,'2023-07-01',4,'credit',1211425456,1,1,500.00);
insert into bookings values(2,3,6,'2023-07-07',3,'debit',1211424578,0,1,425.00);
insert into bookings values(3,5,7,'2023-07-08',1,'credit',1211424578,0,0,null);
insert into bookings values(4,6,7,'2023-07-09',8,'debit',1211455456,1,0,null);
insert into bookings values(5,8,7,'2023-07-08',7,'debit',1211963456,1,1,375.00);
insert into bookings values(6,9,5,'2023-07-06',2,'credit',1211255856,1,1,800.50);
insert into bookings values(7,1,1,'2023-07-07',5,'debit',3561425456,0,1,567.00);
insert into bookings values(8,4,1,'2023-07-05',7,'credit',2141425456,0,0,null);
insert into bookings values(9,4,4,'2023-07-04',8,'credit',2361425456,1,0,null);
insert into bookings values(10,5,6,'2023-07-03',3,'debit',1211569456,1,1,345.00);
insert into bookings values(11,6,6,'2023-07-06',4,'debit',1211425586,0,0,null);

-- INSERTING VALUES INTO SEATS
insert into seats (seat_row, seat_number, room_id)
values ('A',1,1),('A',2,1),('A',3,1),('A',4,1),('A',5,1),('A',6,1),('A',7,1),('A',8,1),
('B',1,1),('B',2,1),('B',3,1),('B',4,1),('B',5,1),('B',6,1),('B',7,1),('B',8,1),
('C',1,1),('C',2,1),('C',3,1),('C',4,1),('C',5,1),('C',6,1),('C',7,1),('C',8,1),
('D',1,1),('D',2,1),('D',3,1),('D',4,1),('D',5,1),('D',6,1),('D',7,1),('D',8,1),
('E',1,1),('E',2,1),('E',3,1),('E',4,1),('E',5,1),('E',6,1),('E',7,1),('E',8,1),
('F',1,1),('F',2,1),('F',3,1),('F',4,1),('F',5,1),('F',6,1),('F',7,1),('F',8,1),
('G',1,1),('G',2,1),('G',3,1),('G',4,1),('G',5,1),('G',6,1),('G',7,1),('G',8,1),
('H',1,1),('H',2,1),('H',3,1),('H',4,1),('H',5,1),('H',6,1),('H',7,1),('H',8,1),
('I',1,1),('I',2,1),('I',3,1),('I',4,1),('I',5,1),('I',6,1),('I',7,1),('I',8,1),
('A',1,2),('A',2,2),('A',3,2),('A',4,2),('A',5,2),('A',6,2),
('B',1,2),('B',2,2),('B',3,2),('B',4,2),('B',5,2),('B',6,2),
('C',1,2),('C',2,2),('C',3,2),('C',4,2),('C',5,2),('C',6,2),
('D',1,2),('D',2,2),('D',3,2),('D',4,2),('D',5,2),('D',6,2),
('E',1,2),('E',2,2),('E',3,2),('E',4,2),('E',5,2),('E',6,2),
('F',1,2),('F',2,2),('F',3,2),('F',4,2),('F',5,2),('F',6,2),
('A',1,3),('A',2,3),('A',3,3),('A',4,3),('A',5,3),('A',6,3),
('B',1,3),('B',2,3),('B',3,3),('B',4,3),('B',5,3),('B',6,3),
('C',1,3),('C',2,3),('C',3,3),('C',4,3),('C',5,3),('C',6,3),
('D',1,3),('D',2,3),('D',3,3),('D',4,3),('D',5,3),('D',6,3),
('E',1,3),('E',2,3),('E',3,3),('E',4,3),('E',5,3),('E',6,3),
('F',1,3),('F',2,3),('F',3,3),('F',4,3),('F',5,3),('F',6,3),
('A',1,4),('A',2,4),('A',3,4),('A',4,4),('A',5,4),('A',6,4),('A',7,4),('A',8,4),
('B',1,4),('B',2,4),('B',3,4),('B',4,4),('B',5,4),('B',6,4),('B',7,4),('B',8,4),
('C',1,4),('C',2,4),('C',3,4),('C',4,4),('C',5,4),('C',6,4),('C',7,4),('C',8,4),
('D',1,4),('D',2,4),('D',3,4),('D',4,4),('D',5,4),('D',6,4),('D',7,4),('D',8,4),
('E',1,4),('E',2,4),('E',3,4),('E',4,4),('E',5,4),('E',6,4),('E',7,4),('E',8,4),
('F',1,4),('F',2,4),('F',3,4),('F',4,4),('F',5,4),('F',6,4),('F',7,4),('F',8,4),
('G',1,4),('G',2,4),('G',3,4),('G',4,4),('G',5,4),('G',6,4),('G',7,4),('G',8,4),
('H',1,4),('H',2,4),('H',3,4),('H',4,4),('H',5,4),('H',6,4),('H',7,4),('H',8,4),
('I',1,4),('I',2,4),('I',3,4),('I',4,4),('I',5,4),('I',6,4),('I',7,4),('I',8,4),
('A',1,5),('A',2,5),('A',3,5),('A',4,5),('A',5,5),('A',6,5),
('B',1,5),('B',2,5),('B',3,5),('B',4,5),('B',5,5),('B',6,5),
('C',1,5),('C',2,5),('C',3,5),('C',4,5),('C',5,5),('C',6,5),
('D',1,5),('D',2,5),('D',3,5),('D',4,5),('D',5,5),('D',6,5),
('E',1,5),('E',2,5),('E',3,5),('E',4,5),('E',5,5),('E',6,5),
('F',1,5),('F',2,5),('F',3,5),('F',4,5),('F',5,5),('F',6,5),
('A',1,6),('A',2,6),('A',3,6),('A',4,6),('A',5,6),('A',6,6),
('B',1,6),('B',2,6),('B',3,6),('B',4,6),('B',5,6),('B',6,6),
('C',1,6),('C',2,6),('C',3,6),('C',4,6),('C',5,6),('C',6,6),
('D',1,6),('D',2,6),('D',3,6),('D',4,6),('D',5,6),('D',6,6),
('E',1,6),('E',2,6),('E',3,6),('E',4,6),('E',5,6),('E',6,6),
('F',1,6),('F',2,6),('F',3,6),('F',4,6),('F',5,6),('F',6,6);

-- INSERTING VALUES INTO RESERVED_SEAT
insert into reserved_seat (booking_id, seat_id)
values
(1,74),(1,75),(1,76),(1,77),(1,78),(1,79),(1,80),(1,81),(1,82),(2,10),(2,11),(2,12),(2,13),(2,14),
(2,15),(2,16),(2,17),(3,100),(3,101),(4,66),(4,67),(4,68),(4,69),(4,70),
(4,71),(5,141),(5,142),(5,143),(5,144),(5,145),(5,146),
(6,33),(6,34),(6,35),(6,36),(6,37),(6,38),(6,39),(6,40),(6,41),(6,42),(7,102),(7,103),
(7,104),(7,105),(7,106),(7,107),(7,108),(7,109),(7,110),(7,111),
(8,2),(8,3),(8,4),(8,5),(9,200),(9,201),(9,203),(9,204),(9,205),(9,206),
(10,250),(10,251),(10,252),(10,253),(11,270),(11,271),(11,273);


-- Required SQL queries

# Customers from Whitefield sorted by their last name

SELECT first_name, last_name, email 
FROM customers 
WHERE place = 'Whitefield' 
ORDER BY last_name;

# Which film had the most screenings

select f.name, count(s.film_id) as showings from screenings s
join films f on f.id = s.film_id
group by film_id
order by showings desc;

# Changing the number of booked seats from 4 to 5 for id = 1
UPDATE bookings 
SET no_seats_booked = 5 
WHERE id = 1;

select * from bookings;

# Summary of the total screenings and average rating for each room in the cinema

SELECT rooms.name AS room_name, COUNT(screenings.id) AS total_screenings, AVG(screenings.screening_rating) AS average_rating
FROM rooms
LEFT JOIN screenings ON rooms.id = screenings.room_id
GROUP BY rooms.id;

# list of films that are scheduled to be screened in July 2023

SELECT id, name
FROM films
WHERE id IN (
  SELECT film_id
  FROM screenings
  WHERE start_date BETWEEN '2023-07-01' AND '2023-07-31'
);

-- Name and rating of the films along with the number of seats booked for each screening, ordered by the rating of the films.

SELECT f.name, f.rating, b.no_seats_booked
FROM films f
JOIN screenings s ON f.id = s.film_id
JOIN bookings b ON s.id = b.screening_id
ORDER BY f.rating;







