-- ================================================
-- CYCLISTIC BIKE SHARE ANALYSIS
-- Script 4: Analysis Queries
-- Author: Oluwatimilehin Owoeye
-- Date: 2026
-- Description: All analysis queries used to answer
-- the business question: How do annual members and
-- casual riders use Cyclistic bikes differently?
-- ================================================

-- ================================================
-- QUERY 1: Total Rides by Membership Type
-- Finding: Members account for 64.7% of all rides
-- ================================================

SELECT 
    member_casual,
    COUNT(*) AS total_rides
FROM cyclistic_cleaned
GROUP BY member_casual;

-- ================================================
-- QUERY 2: Average Ride Length by Membership Type
-- Finding: Casual riders average 19 mins 46 secs
-- Members average 12 mins 16 secs
-- ================================================

SELECT 
    member_casual,
    AVG(ride_length) AS avg_ride_length,
    MAX(ride_length) AS max_ride_length,
    MIN(ride_length) AS min_ride_length
FROM cyclistic_cleaned
GROUP BY member_casual;

-- ================================================
-- QUERY 3: Rides by Day of Week
-- Finding: Members peak on weekdays (Thursday)
-- Casual riders peak on weekends (Saturday)
-- ================================================

SELECT 
    member_casual,
    day_of_week,
    COUNT(*) AS total_rides
FROM cyclistic_cleaned
GROUP BY member_casual, day_of_week
ORDER BY member_casual, day_of_week;

-- ================================================
-- QUERY 4: Rides by Hour of Day
-- Finding: Members show double peak at 8am and 5pm
-- Casual riders show single gradual afternoon peak
-- ================================================

SELECT 
    member_casual,
    EXTRACT(HOUR FROM started_at) AS hour_of_day,
    COUNT(*) AS total_rides
FROM cyclistic_cleaned
GROUP BY member_casual, hour_of_day
ORDER BY member_casual, hour_of_day;

-- ================================================
-- QUERY 5: Rides by Month
-- Finding: Both peak in August 2025
-- Casual riders drop 91.6% in winter vs 75.3% 
-- for members confirming leisure vs commute pattern
-- ================================================

SELECT 
    member_casual,
    EXTRACT(MONTH FROM started_at) AS month,
    EXTRACT(YEAR FROM started_at) AS year,
    COUNT(*) AS total_rides
FROM cyclistic_cleaned
GROUP BY member_casual, year, month
ORDER BY member_casual, year, month;

-- ================================================
-- QUERY 6: Bike Type Preferences
-- Finding: Both groups prefer electric bikes (~65%)
-- Members use classic bikes proportionally more
-- ================================================

SELECT 
    member_casual,
    rideable_type,
    COUNT(*) AS total_rides
FROM cyclistic_cleaned
GROUP BY member_casual, rideable_type
ORDER BY member_casual, rideable_type;

-- ================================================
-- QUERY 7: Weekend Ride Analysis
-- Finding: Both groups ride longer on weekends
-- Casual riders average 22 mins on weekends
-- Members average 13 mins on weekends
-- ================================================

SELECT 
    member_casual,
    AVG(ride_length) AS avg_ride_length,
    COUNT(*) AS total_rides
FROM cyclistic_cleaned
WHERE EXTRACT(DOW FROM started_at) IN (0,6)
GROUP BY member_casual;

-- ================================================
-- QUERY 8: Top 10 Casual Rider Stations
-- Finding: All top stations are tourist and leisure
-- locations concentrated along Chicago lakefront
-- Navy Pier leads with 32,173 casual rides
-- ================================================

SELECT 
    member_casual,
    start_station_name,
    COUNT(*) AS total_rides,
    AVG(ride_length) AS avg_ride_length
FROM cyclistic_cleaned
WHERE start_station_name IS NOT NULL
AND member_casual = 'casual'
GROUP BY member_casual, start_station_name
ORDER BY total_rides DESC
LIMIT 10;

-- ================================================
-- SUMMARY TABLES FOR TABLEAU PUBLIC DASHBOARD
-- Exported as CSV files for visualization
-- ================================================

-- Summary 1: Total Rides
SELECT member_casual, COUNT(*) AS total_rides
FROM cyclistic_cleaned
GROUP BY member_casual;

-- Summary 2: Average Ride Length in Minutes
SELECT member_casual, 
AVG(EXTRACT(EPOCH FROM ride_length)/60) AS avg_ride_minutes
FROM cyclistic_cleaned
GROUP BY member_casual;

-- Summary 3: Rides by Day of Week
SELECT member_casual, day_of_week, COUNT(*) AS total_rides
FROM cyclistic_cleaned
GROUP BY member_casual, day_of_week
ORDER BY member_casual, day_of_week;

-- Summary 4: Rides by Hour
SELECT member_casual, 
EXTRACT(HOUR FROM started_at) AS hour_of_day,
COUNT(*) AS total_rides
FROM cyclistic_cleaned
GROUP BY member_casual, hour_of_day
ORDER BY member_casual, hour_of_day;

-- Summary 5: Rides by Month
SELECT 
    member_casual,
    EXTRACT(YEAR FROM started_at) AS year,
    EXTRACT(MONTH FROM started_at) AS month,
    COUNT(*) AS total_rides
FROM cyclistic_cleaned
GROUP BY member_casual, year, month
ORDER BY member_casual, year, month;

-- Summary 6: Bike Type Preferences
SELECT member_casual, rideable_type, COUNT(*) AS total_rides
FROM cyclistic_cleaned
GROUP BY member_casual, rideable_type
ORDER BY member_casual, rideable_type;

-- Summary 7: Top 10 Casual Stations with Coordinates
SELECT start_station_name, COUNT(*) AS total_rides,
AVG(start_lat) AS avg_lat,
AVG(start_lng) AS avg_lng
FROM cyclistic_cleaned
WHERE member_casual = 'casual'
AND start_station_name IS NOT NULL
GROUP BY start_station_name
ORDER BY total_rides DESC
LIMIT 10;
