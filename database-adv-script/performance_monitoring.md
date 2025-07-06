# Database Performance Monitoring Report

## Monitored Queries

### 1. Booking Search Query
```sql
-- Query being monitored
EXPLAIN ANALYZE
SELECT b.*, p.name, u.first_name 
FROM Booking b
JOIN Property p ON b.property_id = p.property_id
JOIN User u ON b.user_id = u.user_id
WHERE b.start_date BETWEEN '2025-01-01' AND '2025-06-30'
AND b.status = 'confirmed';