# Database Seed Data for Airbnb-like Application

## Overview
This directory contains an SQL script to seed the database with sample data for an Airbnb-like application, focusing on African and South African contexts. The data populates the User, Property, Booking, Payment, Review, and Message tables to simulate real-world usage.

## Files
- `seed.sql`: Contains `INSERT` statements to add sample data to the database schema.

## Sample Data Details
- **Users**: 5 users (2 South African guests, 1 South African host, 1 Kenyan host, 1 Nigerian admin).
- **Properties**: 4 properties across African cities (Cape Town, Durban, Nairobi, Lagos).
- **Bookings**: 5 bookings with different statuses (confirmed, pending, canceled).
- **Payments**: 3 payments using methods like credit_card, mobile_money, and paypal.
- **Reviews**: 3 reviews with local comments (e.g., Table Mountain, Durban beach).
- **Messages**: 3 messages between guests and hosts.
- **Notes**:
  - UUIDs are placeholder values (e.g., `550e8400-e29b-41d4-a716-446655440000`). Use `UUID()` in MySQL for real generation.
  - Dates are set around June 2025, reflecting current and future usage.

## Usage
1. Ensure the database schema (from `database-script-0x01/schema.sql`) is created in a MySQL environment (e.g., MySQL Workbench).
2. Run the `seed.sql` script to insert the sample data:
   - In MySQL Workbench: Open the script and execute it.
   - Via command line: `mysql -u username -p database_name < seed.sql`.
3. Verify the data using `SELECT` queries (e.g., `SELECT * FROM User;`).

