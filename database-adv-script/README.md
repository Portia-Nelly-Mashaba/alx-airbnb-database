# Database Advanced Script - Joins Queries

## Overview
This directory contains SQL queries that demonstrate the use of different types of SQL joins for an Airbnb-like database. The queries are stored in `joins_queries.sql` and are designed to work with a database schema that includes tables for `User`, `Booking`, `Property`, and `Review`.

## File
**joins_queries.sql**: Contains three SQL queries using `INNER JOIN`, `LEFT JOIN`, and a simulated `FULL OUTER JOIN` to retrieve data from the database.

## Queries Description

### INNER JOIN Query
Retrieves all bookings along with the details of the users who made those bookings. It joins the `Booking` and `User` tables on `user_id`, returning:
- Booking details: `booking_id`, `start_date`, `end_date`, `total_price`, `status`, `property_id`
- User details: `user_id`, `first_name`, `last_name`, `email`

### LEFT JOIN Query
Retrieves all properties and their associated reviews, including properties that have no reviews. It joins the `Property` and `Review` tables on `property_id`, returning:
- Property details: `property_id`, `name`, `location`, `pricepernight`
- Review details: `review_id`, `rating`, `comment` (NULL values for properties with no reviews)

### FULL OUTER JOIN Query
Retrieves all users and all bookings, including users without bookings and bookings not linked to any user. It joins the `User` and `Booking` tables on `user_id`. Since MySQL does not support `FULL OUTER JOIN`, it is simulated using a combination of `LEFT JOIN` and `RIGHT JOIN` with `UNION`.

## Usage
1. Ensure your database is set up with the required tables (`User`, `Booking`, `Property`, `Review`) as defined in the provided schema.
2. Run the queries in `joins_queries.sql` using a MySQL client connected to your database:
   ```bash
   mysql -u your_username -p your_database_name < joins_queries.sql