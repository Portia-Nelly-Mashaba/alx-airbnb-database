# Database Schema for Airbnb-like Application

## Overview
This directory contains the SQL Data Definition Language (DDL) script to create the database schema for an Airbnb-like application. The schema includes tables for users, properties, bookings, payments, reviews, and messages, with appropriate constraints and indexes for performance and data integrity.

## Files
- `schema.sql`: Contains the `CREATE TABLE` statements and index definitions for the database schema.

## Schema Details
- **Tables**: User, Property, Booking, Payment, Review, Message.
- **Constraints**: Primary keys, foreign keys, NOT NULL, UNIQUE (on User.email), and ENUM constraints.
- **Indexes**: Additional indexes on `email` (User), `property_id` (Property, Booking), and `booking_id` (Booking, Payment) for optimized query performance.
- **Notes**:
  - UUIDs are represented as `CHAR(36)` due to MySQL’s lack of a native UUID type.
  - The `CHECK (rating >= 1 AND rating <= 5)` constraint on Review.rating is not enforced in MySQL versions before 8.0.16 and should be handled via application logic or a trigger.
  - `total_price` in Booking is stored as a precomputed value for performance, as justified in the normalization process.

## Usage
1. Run the `schema.sql` script in a MySQL environment (e.g., MySQL Workbench) to create the database schema.
2. Ensure the database engine supports the specified data types and constraints.

