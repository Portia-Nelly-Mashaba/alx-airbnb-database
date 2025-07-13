-- Step 1: Aggregate bookings per property
WITH PropertyBookingCounts AS (
    SELECT 
        p.property_id,
        p.name,
        p.location,
        p.pricepernight,
        COUNT(b.booking_id) AS total_bookings
    FROM Property p
    LEFT JOIN Booking b ON p.property_id = b.property_id
    GROUP BY p.property_id, p.name, p.location, p.pricepernight
)

-- Step 2: Apply RANK window function
SELECT 
    property_id,
    name,
    location,
    pricepernight,
    total_bookings,
    RANK() OVER (ORDER BY total_bookings DESC) AS booking_rank
FROM PropertyBookingCounts
ORDER BY booking_rank;
