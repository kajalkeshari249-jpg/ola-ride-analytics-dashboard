# OLA Ride Analytics Dashboard

## Project Overview

This project analyzes OLA ride booking data using SQL and Power BI to uncover insights related to ride volume, booking success, cancellations, revenue generation, vehicle performance, and customer ratings.

The objective of this project is to transform raw ride booking data into meaningful business insights through data cleaning, SQL analysis, and interactive Power BI dashboards.

---

## Tools & Technologies

- SQL (MySQL)
- Power BI
- Microsoft Excel

---

## Dataset

The dataset contains ride booking information including:

- Booking ID
- Customer ID
- Vehicle Type
- Booking Status
- Ride Distance
- Booking Value
- Payment Method
- Driver Ratings
- Customer Ratings
- Cancellation Reasons

---

## SQL Analysis

The following business questions were solved using SQL:

1. Retrieve all successful bookings.
2. Find average ride distance for each vehicle type.
3. Count rides cancelled by customers.
4. Identify top 5 customers with highest bookings.
5. Count rides cancelled by drivers due to personal/car-related issues.
6. Find minimum and maximum driver ratings for Prime Sedan rides.
7. Retrieve all UPI payment rides.
8. Calculate average customer rating per vehicle type.
9. Calculate total booking value of successful rides.
10. Retrieve incomplete rides with cancellation reasons.

SQL queries are available in:

`ola_sql_queries.sql`
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


[ola_sql_queries.sql](https://github.com/user-attachments/files/28949652/ola_sql_queries.sql)


## Dashboard Pages

### 1. Overall Dashboard

Provides:

- Total Bookings
- Total Booking Value
- Booking Status Breakdown
- Ride Volume Trend

### Screenshot

<img width="1316" height="740" alt="overall_dashboard" src="https://github.com/user-attachments/assets/99d17a63-f695-4b6c-83a1-ad42cd6d959b" />

---

### 2. Vehicle Type Dashboard

Provides:

- Booking Value by Vehicle Type
- Successful Booking Value
- Average Distance Travelled
- Total Distance Travelled

### Screenshot
<img width="1321" height="743" alt="vehicle_type_dashboard" src="https://github.com/user-attachments/assets/be1df134-3f43-4543-b435-1672ce43928d" />


---

### 3. Revenue Dashboard

Provides:

- Revenue by Payment Method
- Ride Distance Analysis
- Customer Revenue Insights

### Screenshot
<img width="1331" height="741" alt="revenue_dashboard" src="https://github.com/user-attachments/assets/8ac37fd9-cab8-44e9-9fc6-ec2dc2e05111" />

---

### 4. Cancellation Dashboard

Provides:

- Customer Cancellation Reasons
- Driver Cancellation Reasons
- Cancellation Metrics

### Screenshot
<img width="1325" height="747" alt="cancellation_dashboard" src="https://github.com/user-attachments/assets/f3625704-800c-4aab-805b-acbde2e56ca5" />

---

### 5. Ratings Dashboard

Provides:

- Driver Ratings by Vehicle Type
- Customer Ratings by Vehicle Type

### Screenshot
<img width="1347" height="737" alt="ratings_dashboard" src="https://github.com/user-attachments/assets/780fb0ee-fc3e-4e53-b764-ccfd83585396" />

---

## Key Insights

- More than 60% of bookings were successfully completed.
- Prime Sedan generated the highest booking value.
- Cash and UPI were the most preferred payment methods.
- Customer and Driver ratings remained close to 4.0 across all vehicle categories.
- Customer and Driver cancellations significantly impacted booking completion rates.

---

## Author

**Kajal Keshari**

Business Analyst | SQL | Power BI | Excel | Data Analytics
