# Database Advanced Script - SQL Queries

## Overview
This directory contains SQL queries demonstrating joins, subqueries, aggregations, and window functions for an Airbnb-like database.

## Files
- `joins_queries.sql`: Join operations (INNER, LEFT, FULL OUTER simulation)
- `subqueries.sql`: Correlated and non-correlated subqueries
- `aggregations_and_window_functions.sql`: Aggregations and window functions
- `README.md`: This documentation file

## Aggregations and Window Functions

### Bookings Count per User
**Objective**: Calculate total bookings made by each user.

**Implementation**:
- Uses `COUNT()` aggregation with `GROUP BY`
- Includes `LEFT JOIN` to include users with no bookings
- Orders by booking count (descending)

**Output**:
- User details: `user_id`, `first_name`, `last_name`, `email`
- `total_bookings`: Count of bookings per user

### Property Ranking by Bookings
**Objective**: Rank properties based on booking popularity.

**Implementation**:
- Uses `RANK()` window function
- `COUNT()` aggregation with `GROUP BY`
- `LEFT JOIN` to include properties with no bookings
- Orders by rank (most booked first)

**Output**:
- Property details: `property_id`, `name`, `location`, `pricepernight`
- `total_bookings`: Count of bookings per property
- `booking_rank`: Ranking position

## Usage
```bash
# Run aggregations and window functions
mysql -u your_username -p your_database_name < aggregations_and_window_functions.sql