-- ================================================
-- CYCLISTIC BIKE SHARE ANALYSIS
-- Script 1: Create Table
-- Author: Oluwatimilehin Owoeye
-- Date: 2026
-- ================================================

CREATE TABLE cyclistic_trips (
    ride_id VARCHAR,
    rideable_type VARCHAR,
    started_at TIMESTAMP,
    ended_at TIMESTAMP,
    start_station_name VARCHAR,
    start_station_id VARCHAR,
    end_station_name VARCHAR,
    end_station_id VARCHAR,
    start_lat FLOAT,
    start_lng FLOAT,
    end_lat FLOAT,
    end_lng FLOAT,
    member_casual VARCHAR
);
