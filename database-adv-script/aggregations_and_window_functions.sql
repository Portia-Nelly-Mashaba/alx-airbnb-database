-- Step 1: Bookings count per user
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

-- Step 2: Rank properties using total bookings
WITH booking_counts AS (
    SELECT 
        property_id,
        COUNT(booking_id) AS total_bookings
    FROM Booking
    GROUP BY property_id
)

SELECT 
    Property.property_id,
    Property.name,
    Property.location,
    Property.pricepernight,
    COALESCE(booking_counts.total_bookings, 0) AS total_bookings,
    RANK() OVER (ORDER BY COALESCE(booking_counts.total_bookings, 0) DESC) AS booking_rank
FROM Property
LEFT JOIN booking_counts ON Property.property_id = booking_counts.property_id;
