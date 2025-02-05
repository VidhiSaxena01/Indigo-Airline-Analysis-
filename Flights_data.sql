-- 1. Average flight duration between different city pairs
SELECT source_city, destinate_city, AVG(time_taken) AS avg_duration 
FROM flights_data
GROUP BY source_city, destinate_city;

-- 2. Average price for each route (source-destination) and flight class
SELECT source_city, destinate_city, `Flight Class`, AVG(price) AS avg_price 
FROM flights_data
GROUP BY source_city, destinate_city, `Flight Class`;

-- 3. Ticket price variation by departure time category
SELECT dep_time_category, AVG(price) AS avg_price 
FROM flights_data
GROUP BY dep_time_category
ORDER BY avg_price DESC;

-- 4. Flight routes with highest and lowest average prices
SELECT source_city, destinate_city, AVG(price) AS avg_price 
FROM flights_data
GROUP BY source_city, destinate_city
ORDER BY avg_price DESC 
LIMIT 1;  -- Highest priced route

SELECT source_city, destinate_city, AVG(price) AS avg_price 
FROM flights_data
GROUP BY source_city, destinate_city
ORDER BY avg_price ASC 
LIMIT 1;  -- Lowest priced route

-- 5. Trend of ticket prices as Days_Left decreases
SELECT Days_Left, AVG(price) AS avg_price 
FROM flights_data
GROUP BY Days_Left
ORDER BY Days_Left ASC;

-- 6. Most frequently occurring source and destination cities
SELECT source_city, COUNT(*) AS flight_count 
FROM flights_data
GROUP BY source_city
ORDER BY flight_count DESC 
LIMIT 1;

SELECT destinate_city, COUNT(*) AS flight_count 
FROM flights_data
GROUP BY destinate_city
ORDER BY flight_count DESC 
LIMIT 1;

-- 7. Average price comparison between non-stop and connecting flights
SELECT stop, AVG(price) AS avg_price 
FROM flights_data
GROUP BY stop;

-- 8. Distribution of flights across different flight classes
SELECT `Flight Class`, COUNT(*) AS flight_count 
FROM flights_data
GROUP BY `Flight Class`;

-- 9. Identifying peak booking periods based on Days_Left
SELECT Days_Left, COUNT(*) AS booking_count 
FROM flights_data
GROUP BY Days_Left
ORDER BY booking_count DESC 
LIMIT 5;

-- 10. Average time taken for flights grouped by departure time category
SELECT dep_time_category, AVG(time_taken) AS avg_duration 
FROM flights_data
GROUP BY dep_time_category
ORDER BY avg_duration DESC;
