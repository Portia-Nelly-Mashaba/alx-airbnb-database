-- Query 1: INNER JOIN to retrieve all bookings and the respective users who made those bookings
-- This query joins the Booking and User tables to show only bookings linked to a user
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    b.property_id,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM 
    Booking b
INNER JOIN 
    User u ON b.user_id = u.user_id;

-- Query 2: LEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews
-- This query includes all properties, even those without reviews (where review fields will be NULL)
-- Adds a check to ensure non-NULL ratings are between 1 and 5
SELECT 
    p.property_id,
    p.name AS property_name,
    p.location,
    p.pricepernight,
    r.review_id,
    r.rating,
    r.comment,
    CASE 
        WHEN r.rating IS NULL THEN 'No Review'
        WHEN r.rating BETWEEN 1 AND 5 THEN 'Valid Rating'
        ELSE 'Invalid Rating'
    END AS rating_status
FROM 
    Property p
LEFT JOIN 
    Review r ON p.property_id = r.property_id
WHERE 
    r.rating IS NULL OR r.rating BETWEEN 1 AND 5;

-- Query 3: FULL OUTER JOIN to retrieve all users and all bookings, even if a user has no booking or a booking is not linked to a user
-- This query includes all users and bookings, showing NULLs where there’s no match
-- Note: MySQL does not support FULL OUTER JOIN, so we simulate it using LEFT JOIN and RIGHT JOIN with UNION
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status
FROM 
    User u
LEFT JOIN 
    Booking b ON u.user_id = b.user_id
UNION
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status
FROM 
    User u
RIGHT JOIN 
    Booking b ON u.user_id = b.user_id
WHERE 
    u.user_id IS NULL;