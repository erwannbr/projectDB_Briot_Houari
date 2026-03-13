-- Creating the database -- 
create database Mini_Project;

use Mini_Project;

-- Creating differents tables --
CREATE TABLE Platform (
    platform_id INT,
    platform_name VARCHAR(20) NOT NULL,
    platform_monthly_active_listeners INT,
    PRIMARY KEY (platform_id)
);

CREATE TABLE Release_ (
    release_upc VARCHAR(13),
    release_type VARCHAR(10) NOT NULL,
    release_title VARCHAR(100),
    release_date DATE,
    release_upc_Parents_album VARCHAR(13),
    PRIMARY KEY (release_upc),
    FOREIGN KEY (release_upc_Parents_album)
        REFERENCES Release_ (release_upc)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Track (
    tracks_ISRC VARCHAR(12),
    tracks_title VARCHAR(100),
    tracks_duration SMALLINT,
    release_upc VARCHAR(13) NOT NULL,
    PRIMARY KEY (tracks_ISRC),
    FOREIGN KEY (release_upc)
        REFERENCES Release_ (release_upc)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Artistes (
    artiste_id INT,
    artiste_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (artiste_id)
);

CREATE TABLE Country (
    country_iso VARCHAR(2),
    country_total_listeners INT NOT NULL,
    country_name VARCHAR(50),
    PRIMARY KEY (country_iso)
);

CREATE TABLE Venue (
    venue_name VARCHAR(100),
    venue_city VARCHAR(50),
    venue_country VARCHAR(50),
    venue_maximum_capacity INT,
    PRIMARY KEY (venue_name)
);

CREATE TABLE Merch (
    merch_SKU VARCHAR(20),
    merch_item_name VARCHAR(50),
    merch_product_category VARCHAR(20),
    merch_unit_sell_price INT,
    merch_total_per_product INT,
    merch_total_unit_sold INT,
    merch_initial_quantity_produced SMALLINT,
    PRIMARY KEY (merch_SKU)
);

CREATE TABLE Démographics (
    demographic_id INT,
    demographic_age_range VARCHAR(10),
    PRIMARY KEY (demographic_id)
)

CREATE TABLE World_Tour (
    tour_id INT,
    tour_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (tour_id)
)

CREATE TABLE Concerts (
    tour_id INT,
    concert_id INT,
    concert_date DATE,
    concert_ticket_sold INT,
    concert_ticket_price INT,
    venue_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (tour_id , concert_id),
    FOREIGN KEY (tour_id)
        REFERENCES World_Tour (tour_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (venue_name)
        REFERENCES Venue (venue_name)
        ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE Part_of (
    tracks_ISRC VARCHAR(12),
    artiste_id INT,
    part_role VARCHAR(15),
    PRIMARY KEY (tracks_ISRC , artiste_id),
    FOREIGN KEY (tracks_ISRC)
        REFERENCES Track (tracks_ISRC)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (artiste_id)
        REFERENCES Artistes (artiste_id)
        ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE Streamed_on (
    platform_id INT,
    tracks_ISRC VARCHAR(12),
    country_iso VARCHAR(2),
    streamed_number_of_stream BIGINT,
    PRIMARY KEY (platform_id , tracks_ISRC , country_iso),
    FOREIGN KEY (platform_id)
        REFERENCES Platform (platform_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (tracks_ISRC)
        REFERENCES Track (tracks_ISRC)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (country_iso)
        REFERENCES Country (country_iso)
        ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE Sells (
    merch_SKU VARCHAR(20),
    tour_id INT,
    PRIMARY KEY (merch_SKU , tour_id),
    FOREIGN KEY (merch_SKU)
        REFERENCES Merch (merch_SKU)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (tour_id)
        REFERENCES World_Tour (tour_id)
        ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE are_invited (
    artiste_id INT,
    tour_id INT,
    concert_id INT,
    PRIMARY KEY (artiste_id , tour_id , concert_id),
    FOREIGN KEY (artiste_id)
        REFERENCES Artistes (artiste_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (tour_id , concert_id)
        REFERENCES Concerts (tour_id , concert_id)
        ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE Analysed_by (
    tour_id INT,
    concert_id INT,
    demographic_id INT,
    analysed_percentage_audience_age VARCHAR(50),
    PRIMARY KEY (tour_id , concert_id , demographic_id),
    FOREIGN KEY (tour_id , concert_id)
        REFERENCES Concerts (tour_id , concert_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (demographic_id)
        REFERENCES Démographics (demographic_id)
        ON DELETE CASCADE ON UPDATE CASCADE
)





