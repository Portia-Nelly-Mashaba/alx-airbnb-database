-- Query 1: Total number of bookings per user
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

-- Query 2: Rank properties by number of bookings (Window Function)
SELECT 
    Booking.property_id,
    Property.name,
    Property.location,
    Property.pricepernight,
    COUNT(*) OVER (PARTITION BY Booking.property_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(*) OVER (PARTITION BY Booking.property_id) DESC) AS booking_rank
FROM Booking
JOIN Property ON Booking.property_id = Property.property_id;
