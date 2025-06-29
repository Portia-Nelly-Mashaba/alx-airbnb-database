# Normalization of Airbnb Database Design

## Overview
This document outlines the normalization process applied to the Airbnb-like database schema to ensure it adheres to the Third Normal Form (3NF). Normalization eliminates redundancies and ensures data integrity by addressing violations of 1NF, 2NF, and 3NF principles.

## Normalization Steps

### 1NF (First Normal Form)
- **Requirement**: All attributes must be atomic (no repeating groups or arrays), and each table must have a primary key.
- **Analysis**:
  - All tables (User, Property, Booking, Payment, Review, Message) have a single-column primary key (e.g., `user_id`, `property_id`).
  - Attributes are atomic: no multi-valued fields (e.g., `location` is a single VARCHAR, not a list of addresses).
- **Result**: The schema satisfies 1NF.

### 2NF (Second Normal Form)
- **Requirement**: 1NF plus no partial dependencies (non-key attributes must depend on the entire primary key).
- **Analysis**:
  - No table uses a composite primary key, so there are no partial dependencies.
  - All non-key attributes (e.g., `first_name` in User, `pricepernight` in Property) depend fully on their respective primary keys.
- **Result**: The schema satisfies 2NF.

### 3NF (Third Normal Form)
- **Requirement**: 2NF plus no transitive dependencies (non-key attributes must depend only on the primary key, not other non-key attributes).
- **Analysis**:
  - **User**: No transitive dependencies (e.g., `email` is unique but tied to `user_id`).
  - **Property**: No transitive dependencies (e.g., `pricepernight` depends on `property_id`).
  - **Booking**: Potential transitive dependency with `total_price`, which could be derived from `pricepernight` (from Property) and the date range (`end_date` - `start_date`). However, storing `total_price` as a precomputed value is a design choice for performance optimization, avoiding frequent joins and calculations in a high-traffic system like Airbnb.
  - **Payment**: No transitive dependencies.
  - **Review**: No transitive dependencies.
  - **Message**: No transitive dependencies.
- **Adjustments**: No structural changes are necessary. The decision to store `total_price` is justified as a practical optimization rather than a normalization violation, aligning with real-world database design practices.
- **Result**: The schema is in 3NF, with the noted exception of `total_price` handled as an intentional design choice.

## Conclusion
The Airbnb database schema is already optimized to 3NF, with all tables satisfying atomicity, full dependency on primary keys, and minimal transitive dependencies. The precomputed `total_price` in the Booking table is retained for performance reasons, a common practice in production systems. No further normalization is required based on the project specifications and the goal of simulating a scalable, efficient database.