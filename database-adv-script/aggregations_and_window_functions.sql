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
SELECT 
    p.property_id,
    p.name,
    p.location,
    p.pricepernight,
    COALESCE(bc.total_bookings, 0) AS total_bookings,
    RANK() OVER (ORDER BY COALESCE(bc.total_bookings, 0) DESC) AS booking_rank
FROM Property p
LEFT JOIN (
    SELECT 
        property_id,
        COUNT(*) AS total_bookings
    FROM Booking
    GROUP BY property_id
) AS bc ON p.property_id = bc.property_id
ORDER BY booking_rank;
