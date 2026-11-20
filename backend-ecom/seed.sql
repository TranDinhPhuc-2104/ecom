-- Seed data for projectHK. Run after projectHK_mysql.sql.
-- All accounts use password: 123456 (BCrypt, strength 10)
USE projectHK;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE cart_items;
TRUNCATE TABLE cart;
TRUNCATE TABLE order_details;
TRUNCATE TABLE orders;
TRUNCATE TABLE ui;
TRUNCATE TABLE products;
TRUNCATE TABLE category;
TRUNCATE TABLE invalidated_token;
TRUNCATE TABLE account;
SET FOREIGN_KEY_CHECKS = 1;

-- account
INSERT INTO account (idAccount, gmail, password, role) VALUES
(1, 'admin@shop.com', '$2a$10$Af5zDpA/NCXw.I7TAsHWFOrpxj9kwVJBbY0b3E8uxIGFuxOJ5bEoi', 'admin'),
(2, 'nguyenvana@gmail.com', '$2a$10$Af5zDpA/NCXw.I7TAsHWFOrpxj9kwVJBbY0b3E8uxIGFuxOJ5bEoi', 'user'),
(3, 'tranthib@gmail.com', '$2a$10$Af5zDpA/NCXw.I7TAsHWFOrpxj9kwVJBbY0b3E8uxIGFuxOJ5bEoi', 'user'),
(4, 'levanc@gmail.com', '$2a$10$Af5zDpA/NCXw.I7TAsHWFOrpxj9kwVJBbY0b3E8uxIGFuxOJ5bEoi', 'user');

-- ui (user profile)
INSERT INTO ui (id, firstName, lastName, dob, address, idAccount, phone) VALUES
(1, 'Admin', 'Shop', '1995-01-01', '1 Le Loi, Quan 1, TP.HCM', 1, '0900000001'),
(2, 'Van A', 'Nguyen', '2000-03-15', '12 Nguyen Hue, Quan 1, TP.HCM', 2, '0912345678'),
(3, 'Thi B', 'Tran', '1998-07-22', '45 Tran Phu, Ha Dong, Ha Noi', 3, '0987654321'),
(4, 'Van C', 'Le', '2001-11-09', '78 Bach Dang, Hai Chau, Da Nang', 4, '0935123456');

-- category
INSERT INTO category (idCate, nameCate) VALUES
(1, 'Dien thoai'),
(2, 'Laptop'),
(3, 'May tinh bang'),
(4, 'Tai nghe'),
(5, 'Dong ho thong minh'),
(6, 'Phu kien');

-- products
INSERT INTO products (id, namePro, quantity, idCate, description, image, price, nameCate) VALUES
(1,  'iPhone 15 Pro 128GB',     25, 1, 'Chip A17 Pro, khung titan, camera 48MP',          'https://placehold.co/600x600?text=iPhone+15+Pro',   27990000, 'Dien thoai'),
(2,  'Samsung Galaxy S24',      30, 1, 'Snapdragon 8 Gen 3, man hinh 6.2 inch 120Hz',     'https://placehold.co/600x600?text=Galaxy+S24',      20990000, 'Dien thoai'),
(3,  'Xiaomi 14',               20, 1, 'Camera Leica, sac nhanh 90W',                     'https://placehold.co/600x600?text=Xiaomi+14',       17990000, 'Dien thoai'),
(4,  'MacBook Air M3 13 inch',  15, 2, 'Chip M3, 8GB RAM, 256GB SSD',                     'https://placehold.co/600x600?text=MacBook+Air+M3',  27490000, 'Laptop'),
(5,  'Dell XPS 13',             10, 2, 'Intel Core Ultra 7, 16GB RAM, 512GB SSD',         'https://placehold.co/600x600?text=Dell+XPS+13',     32990000, 'Laptop'),
(6,  'ASUS ROG Strix G16',       8, 2, 'Core i7, RTX 4060, man hinh 165Hz',               'https://placehold.co/600x600?text=ROG+Strix+G16',   35990000, 'Laptop'),
(7,  'iPad Air M2 11 inch',     18, 3, 'Chip M2, ho tro Apple Pencil Pro',                'https://placehold.co/600x600?text=iPad+Air+M2',     16990000, 'May tinh bang'),
(8,  'Samsung Galaxy Tab S9',   12, 3, 'Man hinh AMOLED 11 inch, kem but S Pen',          'https://placehold.co/600x600?text=Galaxy+Tab+S9',   18990000, 'May tinh bang'),
(9,  'AirPods Pro 2',           40, 4, 'Chong on chu dong, cong USB-C',                   'https://placehold.co/600x600?text=AirPods+Pro+2',    5990000, 'Tai nghe'),
(10, 'Sony WH-1000XM5',         22, 4, 'Tai nghe chup tai chong on hang dau',             'https://placehold.co/600x600?text=Sony+XM5',         7490000, 'Tai nghe'),
(11, 'Apple Watch Series 9',    20, 5, 'GPS 45mm, chip S9',                               'https://placehold.co/600x600?text=Apple+Watch+S9',   9990000, 'Dong ho thong minh'),
(12, 'Garmin Forerunner 265',   14, 5, 'Dong ho chay bo, man hinh AMOLED',                'https://placehold.co/600x600?text=Garmin+FR265',    10490000, 'Dong ho thong minh'),
(13, 'Sac Anker 65W GaN',       60, 6, 'Sac nhanh 3 cong, nho gon',                       'https://placehold.co/600x600?text=Anker+65W',         890000, 'Phu kien'),
(14, 'Cap USB-C Belkin 1m',    100, 6, 'Cap sac USB-C to USB-C 60W',                      'https://placehold.co/600x600?text=Belkin+Cable',      290000, 'Phu kien'),
(15, 'Logitech MX Master 3S',   35, 6, 'Chuot khong day cong thai hoc, click em',         'https://placehold.co/600x600?text=MX+Master+3S',     2290000, 'Phu kien');

-- orders (totalPrice = sum of quantity * priceAtOrder)
-- 'Hoan thanh' orders are counted by the revenue queries in OrdersRepo
INSERT INTO orders (idOrder, idAccount, fullName, phone, address, payment, totalPrice, orderDate, status) VALUES
(1, 2, 'Nguyen Van A', '0912345678', '12 Nguyen Hue, Quan 1, TP.HCM',   'COD',     28570000, '2026-09-05 10:15:00', 'Hoan thanh'),
(2, 3, 'Tran Thi B',   '0987654321', '45 Tran Phu, Ha Dong, Ha Noi',    'BANKING', 29780000, '2026-09-18 14:30:00', 'Hoan thanh'),
(3, 2, 'Nguyen Van A', '0912345678', '12 Nguyen Hue, Quan 1, TP.HCM',   'COD',     11980000, '2026-10-02 09:00:00', 'Hoan thanh'),
(4, 4, 'Le Van C',     '0935123456', '78 Bach Dang, Hai Chau, Da Nang', 'BANKING', 10880000, '2026-10-21 19:45:00', 'Hoan thanh'),
(5, 3, 'Tran Thi B',   '0987654321', '45 Tran Phu, Ha Dong, Ha Noi',    'COD',      7490000, '2026-11-03 11:20:00', 'Dang giao'),
(6, 4, 'Le Van C',     '0935123456', '78 Bach Dang, Hai Chau, Da Nang', 'COD',     17990000, '2026-11-10 16:05:00', 'Da Huy'),
(7, 2, 'Nguyen Van A', '0912345678', '12 Nguyen Hue, Quan 1, TP.HCM',   'BANKING', 17280000, '2026-11-15 08:40:00', 'Dang xu ly');

-- order_details
INSERT INTO order_details (idOD, idOrder, idProduct, quantity, priceAtOrder) VALUES
(1,  1, 1,  1, 27990000),
(2,  1, 14, 2,   290000),
(3,  2, 4,  1, 27490000),
(4,  2, 15, 1,  2290000),
(5,  3, 9,  2,  5990000),
(6,  4, 11, 1,  9990000),
(7,  4, 13, 1,   890000),
(8,  5, 10, 1,  7490000),
(9,  6, 3,  1, 17990000),
(10, 7, 7,  1, 16990000),
(11, 7, 14, 1,   290000);

-- cart (one per user account)
INSERT INTO cart (idCart, idAccount) VALUES
(1, 2),
(2, 3),
(3, 4);

-- cart_items (price = unit price, same as CartService)
INSERT INTO cart_items (idCI, idCart, idProduct, quantity, price) VALUES
(1, 1, 5,  1, 32990000),
(2, 2, 9,  1,  5990000),
(3, 2, 13, 2,   890000),
(4, 3, 2,  1, 20990000),
(5, 3, 15, 1,  2290000);

-- invalidated_token is left empty on purpose (it only holds logged-out JWT ids)
