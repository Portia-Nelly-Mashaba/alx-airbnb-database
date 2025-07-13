-- Query 1: Bookings count per user (GROUP BY aggregation)
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    COUNT(b.booking_id) AS total_bookings
FROM 
    User u
LEFT JOIN 
    Booking b ON u.user_id = b.user_id
GROUP BY 
    u.user_id, u.first_name, u.last_name, u.email
ORDER BY 
    total_bookings DESC;

-- Subquery aggregates total bookings per property
-- Step 1: Aggregate booking counts per property
WITH PropertyBookingCounts AS (
    SELECT 
        property_id,
        COUNT(*) AS total_bookings
    FROM Booking
    GROUP BY property_id
)

-- Step 2: Rank properties using RANK over aggregated results
SELECT 
    p.property_id,
    p.name,
    p.location,
    p.pricepernight,
    COALESCE(pbc.total_bookings, 0) AS total_bookings,
    RANK() OVER (ORDER BY COALESCE(pbc.total_bookings, 0) DESC) AS booking_rank
FROM Property p
LEFT JOIN PropertyBookingCounts pbc ON p.property_id = pbc.property_id;
