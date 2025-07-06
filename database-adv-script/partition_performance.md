# Partitioning Performance Report

## Implementation Details
- Partitioned `Booking` table by `start_date` year ranges
- Created 4 partitions:
  - p_2023: Bookings before 2024
  - p_2024: Bookings in 2024
  - p_2025: Bookings in 2025
  - p_future: All future bookings
- Maintained same column structure as original table
- Added composite primary key (booking_id + start_date)

## Performance Tests

### Test Query 1: Date Range Search
```sql
SELECT * FROM Booking_Partitioned
WHERE start_date BETWEEN '2025-01-01' AND '2025-06-30';