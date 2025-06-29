-- Insert data into User
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('550e8400-e29b-41d4-a716-446655440000', 'Lerato', 'Mokoena', 'lerato.mokoena@za.com', 'hashedpassword1', '+27123456789', 'guest', '2025-06-01 10:00:00'),
('550e8400-e29b-41d4-a716-446655440001', 'Thabo', 'Ngwenya', 'thabo.ngwenya@za.com', 'hashedpassword2', '+27129876543', 'guest', '2025-06-02 12:00:00'),
('550e8400-e29b-41d4-a716-446655440002', 'Zanele', 'Khumalo', 'zanele.khumalo@za.com', 'hashedpassword3', '+27111234567', 'host', '2025-06-03 14:00:00'),
('550e8400-e29b-41d4-a716-446655440003', 'Amina', 'Onyango', 'amina.onyango@ke.com', 'hashedpassword4', '+254712345678', 'host', '2025-06-04 16:00:00'),
('550e8400-e29b-41d4-a716-446655440004', 'Chinedu', 'Okonkwo', 'chinedu.okonkwo@ng.com', 'hashedpassword5', '+2348034567890', 'admin', '2025-06-05 18:00:00');

-- Insert data into Property
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
('550e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440002', 'Cape Town Villa', 'Spacious villa with mountain views.', 'Cape Town, South Africa', 200.00, '2025-06-06 09:00:00', '2025-06-29 18:10:00'),
('550e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440002', 'Durban Beach Cottage', 'Cozy cottage near the beach.', 'Durban, South Africa', 180.00, '2025-06-07 11:00:00', '2025-06-29 18:10:00'),
('550e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440003', 'Nairobi Safari Lodge', 'Luxury lodge with wildlife views.', 'Nairobi, Kenya', 300.00, '2025-06-08 13:00:00', '2025-06-29 18:10:00'),
('550e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440003', 'Lagos Penthouse', 'Modern penthouse in the city center.', 'Lagos, Nigeria', 250.00, '2025-06-09 15:00:00', '2025-06-29 18:10:00');

-- Insert data into Booking
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
('550e8400-e29b-41d4-a716-446655440009', '550e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440000', '2025-07-01', '2025-07-03', 400.00, 'confirmed', '2025-06-29 16:00:00'),
('550e8400-e29b-41d4-a716-44665544000a', '550e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440001', '2025-08-01', '2025-08-02', 180.00, 'pending', '2025-06-29 16:30:00'),
('550e8400-e29b-41d4-a716-44665544000b', '550e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440000', '2025-09-01', '2025-09-04', 900.00, 'confirmed', '2025-06-29 17:00:00'),
('550e8400-e29b-41d4-a716-44665544000c', '550e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440001', '2025-10-01', '2025-10-02', 250.00, 'pending', '2025-06-29 17:30:00'),
('550e8400-e29b-41d4-a716-44665544000d', '550e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440000', '2025-07-10', '2025-07-11', 200.00, 'canceled', '2025-06-29 18:00:00');

-- Insert data into Payment
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('550e8400-e29b-41d4-a716-44665544000e', '550e8400-e29b-41d4-a716-446655440009', 400.00, '2025-06-29 18:05:00', 'credit_card'),
('550e8400-e29b-41d4-a716-44665544000f', '550e8400-e29b-41d4-a716-44665544000b', 900.00, '2025-06-29 18:07:00', 'mobile_money'),
('550e8400-e29b-41d4-a716-446655440010', '550e8400-e29b-41d4-a716-44665544000c', 250.00, '2025-06-29 18:09:00', 'paypal');

-- Insert data into Review
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at) VALUES
('550e8400-e29b-41d4-a716-446655440011', '550e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440000', 4, 'Lovely stay with Table Mountain views!', '2025-07-04 10:00:00'),
('550e8400-e29b-41d4-a716-446655440012', '550e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440001', 5, 'Perfect beach getaway in Durban!', '2025-08-03 12:00:00'),
('550e8400-e29b-41d4-a716-446655440013', '550e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440000', 3, 'Good lodge, but wildlife sightings were limited.', '2025-09-05 14:00:00');

-- Insert data into Message
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('550e8400-e29b-41d4-a716-446655440014', '550e8400-e29b-41d4-a716-446655440000', '550e8400-e29b-41d4-a716-446655440002', 'Can we check in early for the Cape Town villa?', '2025-06-29 17:40:00'),
('550e8400-e29b-41d4-a716-446655440015', '550e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440000', 'Yes, 1 PM is fine. Welcome!', '2025-06-29 17:45:00'),
('550e8400-e29b-41d4-a716-446655440016', '550e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440003', 'Is the Nairobi lodge available next month?', '2025-06-29 17:50:00');