-- INNER JOIN: Retrieve all bookings with user details (MISSING IN YOUR COMMIT)
    SELECT 
    Booking.booking_id,
    Booking.property_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price,
    Booking.status,
    User.user_id,
    User.first_name,
    User.last_name,
    User.email
FROM Booking
INNER JOIN User ON Booking.user_id = User.user_id;


-- LEFT JOIN: Retrieve all properties with their reviews (ALREADY EXISTS IN YOUR COMMIT)
SELECT 
    Property.property_id,
    Property.name AS property_name,
    Property.description,
    Review.review_id,
    Review.rating,
    Review.comment,
    Review.created_at
FROM Property
LEFT JOIN Review ON Property.property_id = Review.property_id;


-- FULL OUTER JOIN simulation: Retrieve all users and all bookings (MISSING IN YOUR COMMIT)
-- Simulate FULL OUTER JOIN using UNION
SELECT 
    User.user_id,
    User.first_name,
    User.last_name,
    Booking.booking_id,
    Booking.property_id,
    Booking.start_date,
    Booking.end_date
FROM User
LEFT JOIN Booking ON User.user_id = Booking.user_id

UNION

SELECT 
    User.user_id,
    User.first_name,
    User.last_name,
    Booking.booking_id,
    Booking.property_id,
    Booking.start_date,
    Booking.end_date
FROM Booking
LEFT JOIN User ON Booking.user_id = User.user_id;
