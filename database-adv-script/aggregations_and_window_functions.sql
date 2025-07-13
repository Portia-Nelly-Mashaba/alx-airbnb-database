-- Query to find total bookings per user
SELECT 
    u.user_id,
    COUNT(b.booking_id) AS total_bookings
FROM 
    User u
LEFT JOIN 
    Booking b ON u.user_id = b.user_id
GROUP BY 
    u.user_id
ORDER BY 
    total_bookings DESC;

-- Subquery aggregates total bookings per property
SELECT 
    pb.property_id,
    pb.name,
    pb.location,
    pb.pricepernight,
    pb.total_bookings,
    RANK() OVER (ORDER BY pb.total_bookings DESC) AS booking_rank
FROM (
    SELECT 
        p.property_id,
        p.name,
        p.location,
        p.pricepernight,
        COUNT(b.booking_id) AS total_bookings
    FROM Property p
    LEFT JOIN Booking b ON p.property_id = b.property_id
    GROUP BY p.property_id, p.name, p.location, p.pricepernight
) AS pb
ORDER BY booking_rank;
