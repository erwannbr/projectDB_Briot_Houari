-- Projection and selections --
-- list all track titles from the 'My 21st Century Blues' album in order (alphabetical) --
SELECT 
    tracks_title
FROM
    Track
WHERE
    release_upc = 'UPC001'
ORDER BY tracks_title ASC;

-- Find all track with titles containing a period --
SELECT 
    tracks_title, tracks_ISRC
FROM
    Track
WHERE
    tracks_title LIKE '%.%';

-- find concert dates where the ticket price is between 80 and 150 --
SELECT 
    concert_id, venue_name, concert_ticket_price
FROM
    Concerts
WHERE
    concert_ticket_price BETWEEN 80 AND 150;

-- list priority countries for the marketing department (UK and USA) --
SELECT 
    country_name, country_total_listeners
FROM
    Country
WHERE
    country_iso IN ('UK' , 'US');

-- identify unique release formats --
SELECT DISTINCT
    release_type
FROM
    Release_;


-- CALCULATING STATS --
-- calculate total gross revenue generated from concert ticket sales --
SELECT 
    SUM(concert_ticket_sold * concert_ticket_price) AS total_tour_revenue
FROM
    Concerts;

-- Calculate the average duration of tracks on the main album --
SELECT 
    AVG(tracks_duration) AS average_track_length
FROM
    Track
WHERE
    release_upc = 'UPC001';

-- count the number of concerts per venue, for venues with at least one show --
SELECT 
    venue_name, COUNT(concert_id) AS number_of_shows
FROM
    Concerts
GROUP BY venue_name
HAVING COUNT(concert_id) >= 1;

-- find the highest and lowest ticket price of the current world tour --
SELECT 
    MAX(concert_ticket_price) AS max_price,
    MIN(concert_ticket_price) AS min_price
FROM
    Concerts;

-- Calculate the total number of streams for the hit single 'Escapism.' per country --
SELECT 
    country_iso, SUM(streamed_number_of_stream) AS total_streams
FROM
    Streamed_on
WHERE
    tracks_ISRC = 'ISRC001'
GROUP BY country_iso;



-- JOINS --
-- with a simple join, to see all the albums and title --
SELECT 
    Track.tracks_title, Release_.release_title
FROM
    Track
        JOIN
    Release_ ON Track.release_upc = Release_.release_upc;

-- With multiples joins: to know who perform where --
SELECT 
    Artistes.artiste_name,
    Concerts.concert_date,
    Concerts.venue_name
FROM
    Artistes
        JOIN
    are_invited ON Artistes.artiste_id = are_invited.artiste_id
        JOIN
    Concerts ON are_invited.tour_id = Concerts.tour_id
        AND are_invited.concert_id = Concerts.concert_id;
        
-- with multiple join to know where the merch is sold --
SELECT 
    World_Tour.tour_name, Merch.merch_item_name
FROM
    World_Tour
        JOIN
    Sells ON World_Tour.tour_id = Sells.tour_id
        JOIN
    Merch ON Sells.merch_SKU = Merch.merch_SKU;

-- With a left join to find solo songs vs collaborations -- 
SELECT 
    Track.tracks_title, Artistes.artiste_name
FROM
    Track
        LEFT JOIN
    Part_of ON Track.tracks_ISRC = Part_of.tracks_ISRC
        LEFT JOIN
    Artistes ON Part_of.artiste_id = Artistes.artiste_id;


-- with multiple joins to have the global streaming data --
SELECT 
    Platform.platform_name,
    Country.country_name,
    Streamed_on.streamed_number_of_stream
FROM
    Platform
        JOIN
    Streamed_on ON Platform.platform_id = Streamed_on.platform_id
        JOIN
    Country ON Streamed_on.country_iso = Country.country_iso;



-- NESTED QUERIES --
-- With IN to only show tracks from actual Albums --
SELECT 
    tracks_title
FROM
    Track
WHERE
    release_upc IN (SELECT 
            release_upc
        FROM
            Release_
        WHERE
            release_type = 'Album');

-- wiht NOT EXIST to find venues with no shows booked --
SELECT 
    venue_name
FROM
    Venue
WHERE
    NOT EXISTS( SELECT 
            1
        FROM
            Concerts
        WHERE
            Concerts.venue_name = Venue.venue_name);

-- With ANY to find songs longer than anything on the 'Intro' EP --
SELECT 
    tracks_title, tracks_duration
FROM
    Track
WHERE
    tracks_duration > ANY (SELECT 
            tracks_duration
        FROM
            Track
        WHERE
            release_upc = 'UPC015');

-- with ALL to find the "Most Expensive" ticket --
SELECT 
    concert_id, concert_ticket_price
FROM
    Concerts
WHERE
    concert_ticket_price >= ALL (SELECT 
            concert_ticket_price
        FROM
            Concerts);

-- with NOT IN to hvae countries with no listeners yet --
SELECT 
    country_name
FROM
    Country
WHERE
    country_iso NOT IN (SELECT DISTINCT
            country_iso
        FROM
            Streamed_on);