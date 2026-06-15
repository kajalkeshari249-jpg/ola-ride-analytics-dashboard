CREATE DATABASE Ola;
USE Ola;

USE Ola;
SHOW TABLES;

SELECT* FROM Bengaluru_Ola_Booking_Data;


#1. Retrive all success bookings:
CREATE VIEW successful_booking as
SELECT*
FROM Bengaluru_Ola_Booking_Data
WHERE TRIM(`Booking Status`) = 'Success';


#1. Retrive all success bookings:
select * from successful_booking;

#2. Find the average ride distance for each vehicle type:
CREATE VIEW average_ride_distance_for_each_vehicle AS
SELECT  `Vehicle type`,
AVG(`Ride Distance`) AS AVG_RIDE_DISTANCE
FROM Bengaluru_Ola_Booking_Data
GROUP BY `Vehicle type`;


#2. Find the average ride distance for each vehicle type:
select * from average_ride_distance_for_each_vehicle;

#3. Get the total numbers of cancelled rides from customer:
CREATE VIEW cancelled_rides_from_custome AS
SELECT count(*) AS Total_Cancelled_By_Customer
FROM Bengaluru_Ola_Booking_Data
WHERE `Booking status` = 'Cancelled by Customer';

#3. Get the total numbers of cancelled rides from customer:
SELECT* FROM cancelled_rides_from_custome;


#4. List the top 5 Customers who booked the highest number of rides:
CREATE VIEW Customers_booked_highest_number AS
SELECT `Customer ID`, COUNT(`Booking ID`) as Number_of_Rides
FROM Bengaluru_Ola_Booking_Data
group by `Customer ID`
ORDER BY COUNT(*) DESC
limit 5;

#4. List the top 5 Customers who booked the highest number of rides:
SELECT * FROM Customers_booked_highest_number;

#5. Get the number of rides cancelled by drivers due to personal and car-related issue:
CREATE VIEW rides_cancelled AS
SELECT COUNT(*) AS rides_cancelled_by_drivers
FROM Bengaluru_Ola_Booking_Data
WHERE `Reason for Cancelling by Driver` = 'personal & car related issues';

#5. Get the number of rides cancelled by drivers due to personal and car-related issue:
SELECT * FROM rides_cancelled;

#6. Find the maximum and minimum driver rating for prime sedan bookings:
CREATE VIEW Max_Min_driver_rating AS
SELECT
    MIN(CAST(`Driver Ratings` AS DECIMAL(3,1))) AS min_rating,
    MAX(CAST(`Driver Ratings` AS DECIMAL(3,1))) AS max_rating
FROM Bengaluru_Ola_Booking_Data
WHERE `Vehicle Type` = 'Prime Sedan'
AND `Driver Ratings` <> '';


#6. Find the maximum and minimum driver rating for prime sedan bookings:
SELECT * FROM Max_Min_driver_rating;

#7. Retrieve all rides where payment was made using UPI:
CREATE VIEW UPI_rides AS
SELECT *
FROM Bengaluru_Ola_Booking_Data
WHERE `Payment Method` = 'UPI';


#7. Retrieve all rides where payment was made using UPI:
SELECT * FROM UPI_rides;

#8. Find the average customer rating per vehicle type:
CREATE VIEW avg_customer_rating AS
SELECT AVG(`Customer Rating`) AS average_customer_rating , `Vehicle type`
FROM Bengaluru_Ola_Booking_Data
GROUP BY `Vehicle type`;

#8. Find the average customer rating per vehicle type:
SELECT * FROM avg_customer_rating;

#9. Calculate the total booking value of rides completed successfully:
CREATE VIEW total_booking AS
SELECT SUM(`Booking Value`) AS total_booking_value_of_rides
from Bengaluru_Ola_Booking_Data
where `Booking Status` = 'Success';

#9. Calculate the total booking value of rides completed successfully:
SELECT * FROM total_booking;


#10. List all incomplete rides along with the reason:
CREATE VIEW incomplete_rides AS
SELECT `Booking Status`, `Reason for Cancelling by Customer`, `Reason for Cancelling by Driver`
FROM Bengaluru_Ola_Booking_Data
WHERE `Booking Status` = 'Incomplete';

#10. List all incomplete rides along with the reason:
SELECT * FROM incomplete_rides;



#1. Retrive all success bookings:
select * from successful_booking;

#2. Find the average ride distance for each vehicle type:
select * from average_ride_distance_for_each_vehicle;

#3. Get the total numbers of cancelled rides from customer:
SELECT* FROM cancelled_rides_from_custome;

#4. List the top 5 Customers who booked the highest number of rides:
SELECT * FROM Customers_booked_highest_number;

#5. Get the number of rides cancelled by drivers due to personal and car-related issue:
SELECT * FROM rides_cancelled;

#6. Find the maximum and minimum driver rating for prime sedan bookings:
SELECT * FROM Max_Min_driver_rating;

#7. Retrieve all rides where payment was made using UPI:
SELECT * FROM UPI_rides;

#8. Find the average customer rating per vehicle type:
SELECT * FROM avg_customer_rating;

#9. Calculate the total booking value of rides completed successfully:
SELECT * FROM total_booking;

#10. List all incomplete rides along with the reason:
SELECT * FROM incomplete_rides;


