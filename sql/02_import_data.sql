-- ================================================
-- CYCLISTIC BIKE SHARE ANALYSIS
-- Script 2: Import Data
-- Author: Oluwatimilehin Owoeye
-- Date: 2026
-- Description: Import all 12 months of trip data
-- into the cyclistic_trips table using PostgreSQL
-- COPY command. Files stored locally at C:/cyclistic/
-- ================================================

COPY cyclistic_trips
FROM 'C:/cyclistic/202505-divvy-tripdata.csv'
DELIMITER ',' CSV HEADER ENCODING 'UTF8';

COPY cyclistic_trips
FROM 'C:/cyclistic/202506-divvy-tripdata.csv'
DELIMITER ',' CSV HEADER ENCODING 'UTF8';

COPY cyclistic_trips
FROM 'C:/cyclistic/202507-divvy-tripdata.csv'
DELIMITER ',' CSV HEADER ENCODING 'UTF8';

COPY cyclistic_trips
FROM 'C:/cyclistic/202508-divvy-tripdata.csv'
DELIMITER ',' CSV HEADER ENCODING 'UTF8';

COPY cyclistic_trips
FROM 'C:/cyclistic/202509-divvy-tripdata.csv'
DELIMITER ',' CSV HEADER ENCODING 'UTF8';

COPY cyclistic_trips
FROM 'C:/cyclistic/202510-divvy-tripdata.csv'
DELIMITER ',' CSV HEADER ENCODING 'UTF8';

COPY cyclistic_trips
FROM 'C:/cyclistic/202511-divvy-tripdata.csv'
DELIMITER ',' CSV HEADER ENCODING 'UTF8';

COPY cyclistic_trips
FROM 'C:/cyclistic/202512-divvy-tripdata.csv'
DELIMITER ',' CSV HEADER ENCODING 'UTF8';

COPY cyclistic_trips
FROM 'C:/cyclistic/202601-divvy-tripdata.csv'
DELIMITER ',' CSV HEADER ENCODING 'UTF8';

COPY cyclistic_trips
FROM 'C:/cyclistic/202602-divvy-tripdata.csv'
DELIMITER ',' CSV HEADER ENCODING 'UTF8';

COPY cyclistic_trips
FROM 'C:/cyclistic/202603-divvy-tripdata.csv'
DELIMITER ',' CSV HEADER ENCODING 'UTF8';

COPY cyclistic_trips
FROM 'C:/cyclistic/202604-divvy-tripdata.csv'
DELIMITER ',' CSV HEADER ENCODING 'UTF8';

-- Verify total rows imported
SELECT COUNT(*) FROM cyclistic_trips;

-- Verify date range
SELECT 
    MIN(started_at) AS earliest_ride,
    MAX(started_at) AS latest_ride
FROM cyclistic_trips;
