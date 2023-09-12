## Google Data Analytics Capstone Project SQL Code
## Data Processed in SQLite
## SQLite Data-Cleaning History below:

# Creating A Table for Cyclistic Data from Jan to Mar 2021

CREATE TABLE JanToMar AS

SELECT *
FROM January
UNION
SELECT *
FROM February
UNION
SELECT *
FROM March

# Creating A Table for Cyclistic Data from Apr to Jun 2021

CREATE TABLE AprToJun AS

SELECT *
FROM April
UNION
SELECT *
FROM May
UNION
SELECT *
FROM June

# Creating a Combined Table for Cyclistic Data from Jan to June 2021

CREATE TABLE JanToJun AS

SELECT *
FROM JanToMar
UNION
SELECT *
FROM AprToJun

# Calculating the Total Amount of Rides taken by each Type of Rider: Casual and Member During the 6-Month Period

SELECT
member_casual AS Casual_Or_Member,
count(ride_id) AS Amount_of_Rides_Taken

FROM JanToJun

GROUP BY
member_casual

# Calculating the Total Amount of Rides Taken per Day - 1=Sunday, 7=Saturday

SELECT
count(ride_id) AS Total_Rides_Taken_on_Day

FROM
JanToJun

GROUP BY
day_of_week

# Ordering Days by Amount of Bikes Ridden 

SELECT
CASE
WHEN day_of_week = 1 THEN "Sunday"
WHEN day_of_week = 2 THEN "Monday"
WHEN day_of_week = 3 THEN "Tuesday"
WHEN day_of_week = 4 THEN "Wednesday"
WHEN day_of_week = 5 THEN "Thursday"
WHEN day_of_week = 6 THEN "Friday"
ELSE "Saturday"
END AS Day,
count(ride_id) AS Total_Trips

FROM
JanToJun

GROUP BY
Day

ORDER BY
Total_Trips DESC

# Categorizing Each Day by Amount of Rides and by Type of Rider

SELECT
CASE
WHEN day_of_week = 1 THEN "Sunday"
WHEN day_of_week = 2 THEN "Monday"
WHEN day_of_week = 3 THEN "Tuesday"
WHEN day_of_week = 4 THEN "Wednesday"
WHEN day_of_week = 5 THEN "Thursday"
WHEN day_of_week = 6 THEN "Friday"
ELSE "Saturday"
END AS Day,
member_casual AS Type_of_Rider,
count(ride_id) AS Total_Trips

FROM JanToJun

GROUP BY
day_of_week,
Type_of_Rider

# Calculating Average Ride Length by Day

SELECT
CASE
WHEN day_of_week = 1 THEN "Sunday"
WHEN day_of_week = 2 THEN "Monday"
WHEN day_of_week = 3 THEN "Tuesday"
WHEN day_of_week = 4 THEN "Wednesday"
WHEN day_of_week = 5 THEN "Thursday"
WHEN day_of_week = 6 THEN "Friday"
ELSE "Saturday"
END AS Day,
avg(ride_length) AS average_ride_length

FROM 
JanToJun

GROUP BY
Day

# Determining the Day with the highest Average Bike Ride Length

SELECT
CASE
WHEN day_of_week = 1 THEN "Sunday"
WHEN day_of_week = 2 THEN "Monday"
WHEN day_of_week = 3 THEN "Tuesday"
WHEN day_of_week = 4 THEN "Wednesday"
WHEN day_of_week = 5 THEN "Thursday"
WHEN day_of_week = 6 THEN "Friday"
ELSE "Saturday"
END AS Day,
avg(ride_length) AS average_ride_length

FROM 
JanToJun

GROUP BY
Day

ORDER BY
average_ride_length DESC

# Ordering Days of the Week by Total Bike Length Time per Day 

SELECT
CASE
WHEN day_of_week = 1 THEN "Sunday"
WHEN day_of_week = 2 THEN "Monday"
WHEN day_of_week = 3 THEN "Tuesday"
WHEN day_of_week = 4 THEN "Wednesday"
WHEN day_of_week = 5 THEN "Thursday"
WHEN day_of_week = 6 THEN "Friday"
ELSE "Saturday"
END AS Day,
count(ride_length) AS Total_Ride_length

FROM 
JanToJun

GROUP BY
Day

ORDER BY
Total_Ride_Length DESC

# Ordering Days of the Week by Number of Trips Taken by Riders

SELECT
CASE
WHEN day_of_week = 1 THEN "Sunday"
WHEN day_of_week = 2 THEN "Monday"
WHEN day_of_week = 3 THEN "Tuesday"
WHEN day_of_week = 4 THEN "Wednesday"
WHEN day_of_week = 5 THEN "Thursday"
WHEN day_of_week = 6 THEN "Friday"
ELSE "Saturday"
END AS Day,
count(ride_id) AS Total_Trips

FROM 
JanToJun

GROUP BY
Day

ORDER BY
Total_Trips DESC

# Determining the most-used Type of Bike for the past 6 Months

SELECT 
rideable_type AS Type_of_Bike,
count(ride_id) AS Total_Bike_Usage

FROM JanToJun

GROUP BY
rideable_type 

ORDER BY
Total_Bike_Usage DESC

# Arranging Type of Bike Used by Type of Member

SELECT
rideable_type AS Type_of_Bike,
member_casual AS Type_of_User,
count(ride_id) AS Total_Bike_Usage

FROM
JanToJun

GROUP BY
rideable_type,
member_casual

ORDER BY
Total_Bike_Usage DESC

# Determining the most Popular Starting Locations for Each Bike Type for Annual Members

SELECT
start_station_name AS starting_location,
rideable_type AS type_of_bike,
member_casual AS type_of_rider,
count(ride_id) AS total_rides_started

FROM
JanToJun

WHERE
rideable_type = "electric_bike"
AND member_casual = "member"

GROUP BY
start_station_name

ORDER BY
total_rides_started DESC 

LIMIT 10


SELECT
start_station_name AS starting_location,
rideable_type AS type_of_bike,
member_casual AS type_of_rider,
count(ride_id) AS total_rides_started

FROM
JanToJun

WHERE
rideable_type = "classic_bike"
AND member_casual = "member"

GROUP BY
start_station_name

ORDER BY
total_rides_started DESC 

LIMIT 3


SELECT
start_station_name AS starting_location,
rideable_type AS type_of_bike,
member_casual AS type_of_rider,
count(ride_id) AS total_rides_started

FROM
JanToJun

WHERE
rideable_type = "docked_bike"
AND member_casual = "member"

GROUP BY
start_station_name

ORDER BY
total_rides_started DESC 

LIMIT 3

# Determining the most Popular Starting Locations for Each Bike Type for Casual Members

SELECT
start_station_name AS starting_location,
rideable_type AS type_of_bike,
member_casual AS type_of_rider,
count(ride_id) AS total_rides_started

FROM
JanToJun

WHERE
rideable_type = "electric_bike"
AND member_casual = "casual"

GROUP BY
start_station_name

ORDER BY
total_rides_started DESC 

LIMIT 10


SELECT
start_station_name AS starting_location,
rideable_type AS type_of_bike,
member_casual AS type_of_rider,
count(ride_id) AS total_rides_started

FROM
JanToJun

WHERE
rideable_type = "classic_bike"
AND member_casual = "casual"

GROUP BY
start_station_name

ORDER BY
total_rides_started DESC 

LIMIT 3


SELECT
start_station_name AS starting_location,
rideable_type AS type_of_bike,
member_casual AS type_of_rider,
count(ride_id) AS total_rides_started

FROM
JanToJun

WHERE
rideable_type = "docked_bike"
AND member_casual = "casual"

GROUP BY
start_station_name

ORDER BY
total_rides_started DESC 

LIMIT 3

# Determining the most Popular Ending Locations for Each Bike Type for Annual Members

SELECT
end_station_name AS ending_location,
rideable_type AS type_of_bike,
member_casual AS type_of_rider,
count(ride_id) AS total_rides_ended

FROM
JanToJun

WHERE
rideable_type = "electric_bike"
AND member_casual = "member"

GROUP BY
end_station_name

ORDER BY
total_rides_ended DESC 

LIMIT 5


SELECT
end_station_name AS ending_location,
rideable_type AS type_of_bike,
member_casual AS type_of_rider,
count(ride_id) AS total_rides_ended

FROM
JanToJun

WHERE
rideable_type = "classic_bike"
AND member_casual = "member"

GROUP BY
end_station_name

ORDER BY
total_rides_ended DESC 

LIMIT 5


SELECT
end_station_name AS ending_location,
rideable_type AS type_of_bike,
member_casual AS type_of_rider,
count(ride_id) AS total_rides_ended

FROM
JanToJun

WHERE
rideable_type = "docked_bike"
AND member_casual = "member"

GROUP BY
end_station_name

ORDER BY
total_rides_ended DESC 

LIMIT 5

# Determining the most Popular Ending Locations for Each Bike Type for Casual Members

SELECT
end_station_name AS ending_location,
rideable_type AS type_of_bike,
member_casual AS type_of_rider,
count(ride_id) AS total_rides_ended

FROM
JanToJun

WHERE
rideable_type = "electric_bike"
AND member_casual = "casual"

GROUP BY
end_station_name

ORDER BY
total_rides_ended DESC 
