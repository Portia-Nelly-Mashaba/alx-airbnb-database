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
    property_id,
    name,
    location,
    pricepernight,
    COUNT(*) OVER (PARTITION BY property_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(*) OVER (PARTITION BY property_id) DESC) AS booking_rank
FROM Property
JOIN Booking ON Property.property_id = Booking.property_id
ORDER BY booking_rank;

