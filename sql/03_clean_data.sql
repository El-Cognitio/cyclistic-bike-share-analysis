-- ================================================
-- CYCLISTIC BIKE SHARE ANALYSIS
-- Script 3: Data Cleaning
-- Author: Oluwatimilehin Owoeye
-- Date: 2026
-- Description: Clean raw data and create a cleaned
-- table ready for analysis. Original table is kept
-- intact as a backup.
-- ================================================

-- Step 1: Create cleaned table
-- Removes the following:
-- 1. Rides with zero duration
-- 2. Rides under 60 seconds (accidental unlocks)
-- 3. Rows with missing end coordinates

CREATE TABLE cyclistic_cleaned AS
SELECT *
FROM cyclistic_trips
WHERE ended_at > started_at
AND (ended_at - started_at) > INTERVAL '1 minute'
AND end_lat IS NOT NULL
AND end_lng IS NOT NULL;

-- Verify rows after cleaning
SELECT COUNT(*) FROM cyclistic_cleaned;

-- Step 2: Add ride_length column
-- Calculates duration of each trip

ALTER TABLE cyclistic_cleaned
ADD COLUMN ride_length INTERVAL;

UPDATE cyclistic_cleaned
SET ride_length = ended_at - started_at;

-- Step 3: Add day_of_week column
-- 1 = Sunday, 7 = Saturday

ALTER TABLE cyclistic_cleaned
ADD COLUMN day_of_week INTEGER;

UPDATE cyclistic_cleaned
SET day_of_week = EXTRACT(DOW FROM started_at) + 1;

-- Step 4: Verify cleaning results

-- Check shortest and longest rides
SELECT 
    MIN(ride_length) AS shortest_ride,
    MAX(ride_length) AS longest_ride,
    AVG(ride_length) AS average_ride
FROM cyclistic_cleaned;

-- Check day of week range
SELECT 
    MIN(day_of_week) AS min_day,
    MAX(day_of_week) AS max_day
FROM cyclistic_cleaned;

-- Check no sub-minute rides remain
SELECT COUNT(*) 
FROM cyclistic_cleaned
WHERE (ended_at - started_at) <= INTERVAL '1 minute';

-- Cleaning Notes:
-- Original rows: 5,697,455
-- Rows removed: 161,803 (2.8% of data)
-- Final cleaned rows: 5,535,652
-- Blank station names were RETAINED because they
-- belong to electric bike trips that do not require
-- fixed docking stations and are not relevant to
-- the core analysis.
