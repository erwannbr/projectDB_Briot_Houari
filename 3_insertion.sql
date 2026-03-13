USE Mini_Project;

-- 1. TABLES WITHOUT FOREIGN KEYS --

-- Filling Artistes (Collaborators & RAYE) - 15 rows
INSERT INTO Artistes (artiste_id, artiste_name) VALUES
(1, 'RAYE'), (2, '070 Shake'), (3, 'Mahalia'),
(4, 'Stormzy'), (5, 'Jax Jones'), (6, 'David Guetta'),
(7, 'Regard'), (8, 'Cassö'), (9, 'D-Block Europe'),
(10, 'Hans Zimmer'), (11, 'Khalid'), (12, 'Rudimental'),
(13, 'Joel Corry'), (14, 'Major Lazer'), (15, 'Sacha Skarbek');

-- Filling Country
INSERT INTO Country (country_iso, country_total_listeners, country_name) VALUES
('UK', 67000000, 'United Kingdom'), ('US', 330000000, 'USA'), 
('FR', 68000000, 'France'), ('AU', 26000000, 'Australia'), ('NG', 218000000, 'Nigeria');

-- Filling Platform
INSERT INTO Platform (platform_id, platform_name) VALUES
(1, 'Spotify'), (2, 'Apple Music'), (3, 'Tidal'), (4, 'Deezer');

-- Filling Demographics (Fans by Region/Age) - 30 rows
INSERT INTO Démographics (demographic_id, demographic_age_range) VALUES
(1, 'Gen Z'), (2, 'Millennial'), (3, 'Gen X'), (4, 'London'), (5, 'New York'),
(6, 'Paris'), (7, 'Tokyo'), (8, 'Sydney'), (9, 'Lagos'), (10, 'Berlin'),
(11, 'Madrid'), (12, 'Rome'), (13, 'Toronto'), (14, 'Dublin'), (15, 'Seoul'),
(16, 'Mumbai'), (17, 'Sao Paulo'), (18, 'Mexico'), (19, 'Chicago'), (20, 'LA'),
(21, 'Miami'), (22, 'Atlanta'), (23, 'Houston'), (24, 'Manchester'), (25, 'Glasgow'),
(26, 'Brussels'), (27, 'Amsterdam'), (28, 'Oslo'), (29, 'Lisbon'), (30, 'Vienna');

-- Filling Venue (Real Tour Stops)
INSERT INTO Venue (venue_name, venue_city, venue_country, venue_maximum_capacity) VALUES
('The O2 Arena', 'London', 'UK', 20000),
('Royal Albert Hall', 'London', 'UK', 5272),
('Terminal 5', 'New York', 'USA', 3000),
('La Cigale', 'Paris', 'France', 1400);

-- Filling World_Tour
INSERT INTO World_Tour (tour_id, tour_name) VALUES
(1, 'My 21st Century Blues Tour');

-- 2. TABLES WITH FOREIGN KEYS --

-- Filling Release_ (Projects & Singles) - 15 rows
INSERT INTO Release_ (release_upc, release_type, release_title, release_date) VALUES
('UPC001', 'Album', 'My 21st Century Blues', '2023-02-03'),
('UPC002', 'EP', 'Euphoric Sad Songs', '2020-11-20'),
('UPC003', 'EP', 'Side Tape', '2018-05-04'),
('UPC004', 'EP', 'Second', '2016-08-11'),
('UPC005', 'Single', 'Escapism.', '2022-10-12'),
('UPC006', 'Single', 'Prada', '2023-08-11'),
('UPC007', 'Single', 'Bed', '2021-02-26'),
('UPC008', 'Single', 'Secrets', '2020-04-24'),
('UPC009', 'Single', 'You Don’t Know Me', '2016-12-09'),
('UPC010', 'Single', 'Black Mascara.', '2022-08-24'),
('UPC011', 'Single', 'Hard Out Here.', '2022-06-30'),
('UPC012', 'Single', 'The Thrill is Gone.', '2023-01-23'),
('UPC013', 'Single', 'Ice Cream Man.', '2023-02-03'),
('UPC014', 'Single', 'Genesis.', '2024-06-07'),
('UPC015', 'Album', 'Live at Royal Albert Hall', '2023-09-29');

-- Filling Track (Song Titles) - 15 rows
INSERT INTO Track (tracks_ISRC, tracks_title, tracks_duration, release_upc) VALUES
('ISRC001', 'Escapism.', 272, 'UPC001'),
('ISRC002', 'Worth It.', 248, 'UPC001'),
('ISRC003', 'Black Mascara.', 239, 'UPC010'),
('ISRC004', 'Prada', 132, 'UPC006'),
('ISRC005', 'Secrets', 177, 'UPC008'),
('ISRC006', 'Bed', 178, 'UPC007'),
('ISRC007', 'You Don’t Know Me', 213, 'UPC009'),
('ISRC008', 'Ice Cream Man.', 256, 'UPC013'),
('ISRC009', 'Hard Out Here.', 191, 'UPC011'),
('ISRC010', 'The Thrill is Gone.', 182, 'UPC012'),
('ISRC011', 'Oscar Winning Tears.', 215, 'UPC001'),
('ISRC012', 'Environmental Anxiety.', 194, 'UPC001'),
('ISRC013', 'Buss It Down.', 156, 'UPC001'),
('ISRC014', 'Genesis.', 420, 'UPC014'),
('ISRC015', 'Mary Jane.', 232, 'UPC001');

-- Filling Part_of (Credits)
INSERT INTO Part_of (tracks_ISRC, artiste_id, part_role) VALUES
('ISRC001', 1, 'Main'), ('ISRC001', 2, 'Feature'), -- Raye & 070 Shake
('ISRC004', 1, 'Main'), ('ISRC004', 8, 'Producer'), -- Raye & Cassö
('ISRC005', 1, 'Main'), ('ISRC005', 7, 'Main'), -- Raye & Regard
('ISRC006', 1, 'Main'), ('ISRC006', 13, 'Main'), -- Raye & Joel Corry
('ISRC007', 1, 'Main'), ('ISRC007', 5, 'Main'), -- Raye & Jax Jones
('ISRC014', 1, 'Main'), ('ISRC014', 10, 'Producer'), -- Raye & Hans Zimmer
('ISRC008', 1, 'Main'), ('ISRC015', 1, 'Main');

-- Filling Concerts (Actual Tour Dates)
INSERT INTO Concerts (tour_id, concert_id, concert_date, concert_ticket_sold, concert_ticket_price, venue_name) VALUES
(1, 101, '2023-09-26', 5272, 85, 'Royal Albert Hall'),
(1, 102, '2024-03-15', 20000, 120, 'The O2 Arena');

-- Filling Analysed_by (Engagement percentages)
INSERT INTO Analysed_by (tour_id, concert_id, demographic_id, analysed_percentage_audience_age) VALUES
(1, 101, 1, '45%'), (1, 101, 2, '35%'), (1, 101, 3, '20%'), (1, 101, 4, '60%'), (1, 101, 5, '10%'),
(1, 101, 6, '5%'), (1, 101, 7, '2%'), (1, 101, 8, '2%'), (1, 101, 9, '3%'), (1, 101, 10, '8%'),
(1, 101, 11, '4%'), (1, 101, 12, '4%'), (1, 101, 13, '3%'), (1, 101, 14, '5%'), (1, 101, 15, '2%'),
(1, 101, 16, '1%'), (1, 101, 17, '5%'), (1, 101, 18, '2%'), (1, 101, 19, '3%'), (1, 101, 20, '4%'),
(1, 101, 21, '2%'), (1, 101, 22, '1%'), (1, 101, 23, '1%'), (1, 101, 24, '15%'), (1, 101, 25, '10%'),
(1, 102, 1, '50%'), (1, 102, 2, '30%'), (1, 102, 3, '10%'), (1, 102, 4, '70%'), (1, 102, 5, '5%'),
(1, 102, 6, '10%'), (1, 102, 7, '1%'), (1, 102, 8, '1%'), (1, 102, 9, '2%'), (1, 102, 10, '5%'),
(1, 102, 11, '2%'), (1, 102, 12, '2%'), (1, 102, 13, '1%'), (1, 102, 14, '2%'), (1, 102, 15, '1%'),
(1, 102, 16, '1%'), (1, 102, 17, '3%'), (1, 102, 18, '2%'), (1, 102, 19, '2%'), (1, 102, 20, '3%'),
(1, 102, 21, '1%'), (1, 102, 22, '1%'), (1, 102, 23, '1%'), (1, 102, 24, '10%'), (1, 102, 25, '5%');