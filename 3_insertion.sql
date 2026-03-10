USE Mini_Project;

-- 1. TABLES WITHOUT FOREIGN KEYS --

-- Filling Artistes (Teachers) - 15 rows
INSERT INTO Artistes (artiste_id, artiste_name) VALUES
(1, 'Prof. Alan Turing'), (2, 'Ada Lovelace'), (3, 'Grace Hopper'),
(4, 'Linus Torvalds'), (5, 'Margaret Hamilton'), (6, 'Guido van Rossum'),
(7, 'James Gosling'), (8, 'Barbara Liskov'), (9, 'Ken Thompson'),
(10, 'Donald Knuth'), (11, 'Shafi Goldwasser'), (12, 'Tim Berners-Lee'),
(13, 'Vint Cerf'), (14, 'Yann LeCun'), (15, 'Fei-Fei Li');

-- Filling Country
INSERT INTO Country (country_iso, country_total_listeners, country_name) VALUES
('US', 300000000, 'USA'), ('FR', 67000000, 'France'), ('JP', 125000000, 'Japan'), 
('NG', 200000000, 'Nigeria'), ('BR', 214000000, 'Brazil');

-- Filling Platform
INSERT INTO Platform (platform_id, platform_name) VALUES
(1, 'Algorindor'), (2, 'Cyberclaw'), (3, 'Forgepuff'), (4, 'Syntherin');

-- Filling Demographics (Representing Students/Age Groups) - 30 rows
INSERT INTO Démographics (demographic_id, demographic_age_range) VALUES
(1, 'Amara'), (2, 'Chen'), (3, 'Schmidt'), (4, 'Garcia'), (5, 'Ivanov'),
(6, 'Tanaka'), (7, 'Kalu'), (8, 'Müller'), (9, 'Yilmaz'), (10, 'Singh'),
(11, 'Dubois'), (12, 'Ricci'), (13, 'Santos'), (14, 'Nielsen'), (15, 'Kowalski'),
(16, 'Ahmed'), (17, 'Lee'), (18, 'Kim'), (19, 'O Connor'), (20, 'Hernandez'),
(21, 'Silva'), (22, 'Popov'), (23, 'Haddad'), (24, 'Suzuki'), (25, 'Patel'),
(26, 'Lam'), (27, 'Gomez'), (28, 'Bakker'), (29, 'Petrov'), (30, 'Zeng');

-- Filling Venue
INSERT INTO Venue (venue_name, venue_city, venue_country, venue_maximum_capacity) VALUES
('The Logic Gate', 'Silicon Valley', 'USA', 5000),
('The Data Center', 'Tokyo', 'Japan', 10000);

-- Filling World_Tour
INSERT INTO World_Tour (tour_id, tour_name) VALUES
(1, 'The Great Code Symposium 2026');

-- 2. TABLES WITH FOREIGN KEYS --

-- Filling Release_ (The "Courses" Containers) - 15 rows
INSERT INTO Release_ (release_upc, release_type, release_title, release_date) VALUES
('UPC001', 'Album', 'Intro to Algorithms', '2026-01-01'),
('UPC002', 'Album', 'Cyber Security 101', '2026-01-01'),
('UPC003', 'Album', 'Database Systems', '2026-01-01'),
('UPC004', 'EP', 'Machine Learning Basics', '2026-01-01'),
('UPC005', 'Single', 'Quantum Logic', '2026-01-01'),
('UPC006', 'Album', 'Web Architecture', '2026-01-01'),
('UPC007', 'EP', 'Embedded Systems', '2026-01-01'),
('UPC008', 'Album', 'Compiler Design', '2026-01-01'),
('UPC009', 'Single', 'Neural Networks', '2026-01-01'),
('UPC010', 'Album', 'Cloud Computing', '2026-01-01'),
('UPC011', 'EP', 'Data Structures', '2026-01-01'),
('UPC012', 'Album', 'Operating Systems', '2026-01-01'),
('UPC013', 'Single', 'Cryptography', '2026-01-01'),
('UPC014', 'Album', 'Parallel Programming', '2026-01-01'),
('UPC015', 'EP', 'Human-Computer Interaction', '2026-01-01');

-- Filling Track (The "Courses") - 15 rows
-- Constraints: Duration between 1 and 3600
INSERT INTO Track (tracks_ISRC, tracks_title, tracks_duration, release_upc) VALUES
('ISRC001', 'Sorting Algorithms', 1800, 'UPC001'),
('ISRC002', 'Graph Theory', 2400, 'UPC001'),
('ISRC003', 'Encryption Standards', 1200, 'UPC002'),
('ISRC004', 'SQL Basics', 3000, 'UPC003'),
('ISRC005', 'Normalization', 3500, 'UPC003'),
('ISRC006', 'Linear Regression', 1500, 'UPC004'),
('ISRC007', 'HTTP Protocols', 900, 'UPC006'),
('ISRC008', 'C Basics', 2000, 'UPC007'),
('ISRC009', 'Syntax Trees', 2800, 'UPC008'),
('ISRC010', 'Backpropagation', 3200, 'UPC009'),
('ISRC011', 'Virtualization', 1100, 'UPC010'),
('ISRC012', 'Linked Lists', 600, 'UPC011'),
('ISRC013', 'Kernel Dev', 3600, 'UPC012'),
('ISRC014', 'RSA Algorithm', 1400, 'UPC013'),
('ISRC015', 'Threading', 2200, 'UPC014');

-- Filling Part_of (Assigning Teachers to Courses)
-- Constraints: Roles in ('Main', 'Feature', 'Producer', 'Composer')
INSERT INTO Part_of (tracks_ISRC, artiste_id, part_role) VALUES
('ISRC001', 1, 'Main'), ('ISRC002', 10, 'Main'), ('ISRC003', 11, 'Main'),
('ISRC004', 3, 'Main'), ('ISRC005', 8, 'Main'), ('ISRC006', 14, 'Main'),
('ISRC007', 12, 'Main'), ('ISRC008', 4, 'Main'), ('ISRC009', 10, 'Producer'),
('ISRC010', 15, 'Main'), ('ISRC011', 13, 'Main'), ('ISRC012', 6, 'Main'),
('ISRC013', 4, 'Main'), ('ISRC014', 11, 'Composer'), ('ISRC015', 5, 'Main');

-- Filling Concerts (Exams/Seminars)
-- Constraints: Price between 0 and 250, Sold >= 0
INSERT INTO Concerts (tour_id, concert_id, concert_date, concert_ticket_sold, concert_ticket_price, venue_name) VALUES
(1, 101, '2026-06-01', 50, 0, 'The Logic Gate'),
(1, 102, '2026-06-15', 100, 50, 'The Data Center');

-- Filling Analysed_by (Point Allocations / Students attending exams)
-- We need 50 allocations
INSERT INTO Analysed_by (tour_id, concert_id, demographic_id, analysed_percentage_audience_age) VALUES
(1, 101, 1, '85pts'), (1, 101, 2, '90pts'), (1, 101, 3, '78pts'), (1, 101, 4, '92pts'), (1, 101, 5, '88pts'),
(1, 101, 6, '74pts'), (1, 101, 7, '95pts'), (1, 101, 8, '81pts'), (1, 101, 9, '89pts'), (1, 101, 10, '70pts'),
(1, 101, 11, '99pts'), (1, 101, 12, '83pts'), (1, 101, 13, '77pts'), (1, 101, 14, '91pts'), (1, 101, 15, '86pts'),
(1, 101, 16, '80pts'), (1, 101, 17, '94pts'), (1, 101, 18, '82pts'), (1, 101, 19, '76pts'), (1, 101, 20, '93pts'),
(1, 101, 21, '87pts'), (1, 101, 22, '75pts'), (1, 101, 23, '98pts'), (1, 101, 24, '84pts'), (1, 101, 25, '79pts'),
(1, 102, 1, '82pts'), (1, 102, 2, '88pts'), (1, 102, 3, '91pts'), (1, 102, 4, '76pts'), (1, 102, 5, '84pts'),
(1, 102, 6, '90pts'), (1, 102, 7, '77pts'), (1, 102, 8, '95pts'), (1, 102, 9, '83pts'), (1, 102, 10, '89pts'),
(1, 102, 11, '72pts'), (1, 102, 12, '96pts'), (1, 102, 13, '81pts'), (1, 102, 14, '85pts'), (1, 102, 15, '79pts'),
(1, 102, 16, '93pts'), (1, 102, 17, '87pts'), (1, 102, 18, '74pts'), (1, 102, 19, '98pts'), (1, 102, 20, '80pts'),
(1, 102, 21, '92pts'), (1, 102, 22, '86pts'), (1, 102, 23, '75pts'), (1, 102, 24, '94pts'), (1, 102, 25, '81pts');