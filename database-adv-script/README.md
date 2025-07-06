# Database Advanced Script - SQL Queries

## Overview
This directory contains SQL queries demonstrating different types of joins and subqueries for an Airbnb-like database. The queries work with a database schema that includes tables for `User`, `Booking`, `Property`, and `Review`.

## Files
- `joins_queries.sql`: Contains join queries (INNER, LEFT, and FULL OUTER JOIN simulation)
- `subqueries.sql`: Contains correlated and non-correlated subqueries
- `README.md`: This documentation file

## Joins Queries

### INNER JOIN Query
Retrieves all bookings along with user details:
- **Tables**: `Booking` and `User`
- **Join Condition**: `user_id`
- **Output**: 
  - Booking details: `booking_id`, `start_date`, `end_date`, `total_price`, `status`, `property_id`
  - User details: `user_id`, `first_name`, `last_name`, `email`

### LEFT JOIN Query 
Retrieves all properties with their reviews (including properties without reviews):
- **Tables**: `Property` and `Review`
- **Join Condition**: `property_id`
- **Output**:
  - Property details: `property_id`, `name`, `location`, `pricepernight`
  - Review details: `review_id`, `rating`, `comment` (NULL if no reviews)

### FULL OUTER JOIN Simulation
Retrieves all users and all bookings (including unmatched records):
- **Implementation**: `LEFT JOIN` + `RIGHT JOIN` with `UNION`
- **Tables**: `User` and `Booking`
- **Join Condition**: `user_id`

## Subqueries

### Non-correlated Subquery
Finds properties with average rating > 4.0:
- **Inner Query**: Calculates average rating per property
- **Outer Query**: Joins with Property table
- **Output**: `property_id`, `name`, `location`, `pricepernight`, `average_rating`

### Correlated Subquery
Finds users with more than 3 bookings:
- **Outer Query**: Selects from User table
- **Inner Query**: Counts bookings per user
- **Output**: `user_id`, `first_name`, `last_name`, `email`

## Usage
1. Ensure your database contains the required tables.
2. Run the queries using MySQL client:
   ```bash
   # For joins
   mysql -u your_username -p your_database_name < joins_queries.sql
   
   # For subqueries
   mysql -u your_username -p your_database_name < subqueries.sql