
USE Mini_Project;

-- 1. Range Constraints (BETWEEN)
ALTER TABLE Track 
ADD CONSTRAINT ck_track_duration CHECK (tracks_duration BETWEEN 1 AND 3600); 

ALTER TABLE Concerts 
ADD CONSTRAINT ck_ticket_price CHECK (concert_ticket_price BETWEEN 0 AND 250); 


-- 2. Value Set Constraints (IN)
ALTER TABLE Release_ 
ADD CONSTRAINT ck_release_type CHECK (release_type IN ('Single', 'EP', 'Album', 'Compilation')); 

ALTER TABLE Part_of 
ADD CONSTRAINT ck_part_role CHECK (part_role IN ('Main', 'Feature', 'Producer', 'Composer')); 


-- 3. Comparison Constraints 
ALTER TABLE Venue 
ADD CONSTRAINT ck_venue_capacity CHECK (venue_maximum_capacity >= 1); 

ALTER TABLE Concerts 
ADD CONSTRAINT ck_tickets_sold CHECK (concert_ticket_sold >= 0); 

ALTER TABLE Merch 
ADD CONSTRAINT ck_merch_price CHECK (merch_unit_sell_price > 0); 


-- 4. Uniqueness Constraints (Secondary Keys)
ALTER TABLE Artistes 
ADD CONSTRAINT uni_artiste_name UNIQUE (artiste_name);


-- 5. Default Values
ALTER TABLE Platform 
ALTER COLUMN platform_monthly_active_listeners SET DEFAULT 0;
