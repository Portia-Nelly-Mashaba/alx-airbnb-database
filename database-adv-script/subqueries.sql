-- Non-correlated subquery: Find properties with average rating > 4.0
SELECT 
    p.property_id,
    p.name,
    p.location,
    p.pricepernight,
    avg_rating.average_rating
FROM 
    Property p
JOIN (
    SELECT 
        property_id,
        AVG(rating) AS average_rating
    FROM 
        Review
    GROUP BY 
        property_id
    HAVING 
        AVG(rating) > 4.0
) AS avg_rating ON p.property_id = avg_rating.property_id
ORDER BY 
    avg_rating.average_rating DESC;

-- Correlated subquery: Find users with more than 3 bookings
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM 
    User u
WHERE (
    SELECT COUNT(*)
    FROM Booking b
    WHERE b.user_id = u.user_id
) > 3;