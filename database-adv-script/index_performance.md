# Database Index Performance Analysis

## Indexes Created
The following indexes were implemented in `database_index.sql`:
- User table: `user_id`, `email`, `created_at`
- Booking table: `user_id`, `property_id`, `(start_date, end_date)`, `status`
- Property table: `property_id`, `host_id`, `location`, `pricepernight`

## Performance Comparison

### Test Query 1: User Bookings Lookup
```sql
EXPLAIN ANALYZE
SELECT * FROM Booking WHERE user_id = 215;