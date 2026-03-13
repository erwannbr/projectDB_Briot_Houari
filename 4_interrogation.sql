-- 1. Simple Join: See all songs and their albums
SELECT Track.tracks_title, Release_.release_title
FROM Track
JOIN Release_ ON Track.release_upc = Release_.release_upc;

-- 2. Multiple Join: Who is performing where?
SELECT Artistes.artiste_name, Concerts.concert_date, Concerts.venue_name
FROM Artistes
JOIN are_invited ON Artistes.artiste_id = are_invited.artiste_id
JOIN Concerts ON are_invited.tour_id = Concerts.tour_id 
             AND are_invited.concert_id = Concerts.concert_id;

-- 3. Left Join: Finding solo songs vs. collaborations
SELECT Track.tracks_title, Artistes.artiste_name
FROM Track
LEFT JOIN Part_of ON Track.tracks_ISRC = Part_of.tracks_ISRC
LEFT JOIN Artistes ON Part_of.artiste_id = Artistes.artiste_id;

-- 4. Multiple Join: Where is the merch being sold?
SELECT World_Tour.tour_name, Merch.merch_item_name
FROM World_Tour
JOIN Sells ON World_Tour.tour_id = Sells.tour_id
JOIN Merch ON Sells.merch_SKU = Merch.merch_SKU;

-- 5. Multiple Join: Global Streaming Data
SELECT Platform.platform_name, Country.country_name, Streamed_on.streamed_number_of_stream
FROM Platform
JOIN Streamed_on ON Platform.platform_id = Streamed_on.platform_id
JOIN Country ON Streamed_on.country_iso = Country.country_iso;

-- 1. Using IN: Only show tracks from actual Albums
SELECT tracks_title 
FROM Track 
WHERE release_upc IN (SELECT release_upc FROM Release_ WHERE release_type = 'Album');

-- 2. Using NOT EXISTS: Find venues with no shows booked
SELECT venue_name 
FROM Venue 
WHERE NOT EXISTS (SELECT 1 FROM Concerts WHERE Concerts.venue_name = Venue.venue_name);

-- 3. Using ANY: Songs longer than anything on the 'Intro' EP
SELECT tracks_title, tracks_duration 
FROM Track 
WHERE tracks_duration > ANY (SELECT tracks_duration FROM Track WHERE release_upc = 'UPC015');

-- 4. Using ALL: The "Most Expensive" ticket
SELECT concert_id, concert_ticket_price 
FROM Concerts 
WHERE concert_ticket_price >= ALL (SELECT concert_ticket_price FROM Concerts);

-- 5. Using NOT IN: Countries with no listeners yet
SELECT country_name 
FROM Country 
WHERE country_iso NOT IN (SELECT DISTINCT country_iso FROM Streamed_on);