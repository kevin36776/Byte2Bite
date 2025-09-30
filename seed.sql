INSERT INTO Restaurants (Name, Address, PhoneNumber) VALUES 
('The Downtown Diner', '123 Main St, Anytown, USA', '555-1234');

INSERT INTO MenuItems (RestaurantID, Name, Description, Price, Category, IsAvailable) VALUES
(1, 'Classic Burger', 'A juicy beef patty with lettuce, tomato, and onion on a sesame seed bun.', 10.99, 'Entrees', TRUE),
(1, 'Caesar Salad', 'Crisp romaine lettuce, parmesan cheese, and croutons with a creamy Caesar dressing.', 8.50, 'Salads', TRUE),
(1, 'French Fries', 'Golden brown and perfectly salted.', 3.99, 'Sides', TRUE),
(1, 'Chocolate Shake', 'Thick and creamy chocolate milkshake.', 5.50, 'Drinks', FALSE);

