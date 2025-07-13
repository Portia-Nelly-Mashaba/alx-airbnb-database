-- Query 1: Bookings count per user (GROUP BY aggregation)
SELECT 
    u.user_id, 
    u.first_name, 
    u.last_name, 
    u.email, 
    COUNT(b.booking_id) AS total_bookings
FROM User u
LEFT JOIN Booking b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name, u.email
ORDER BY total_bookings DESC;


-- Query 2: Property ranking by bookings (Window function)
WITH PropertyBookings AS (
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
SELECT 
    property_id, 
    name, 
    location, 
    pricepernight, 
    total_bookings,
    RANK() OVER (ORDER BY total_bookings DESC) AS booking_rank
FROM PropertyBookings
ORDER BY booking_rank;