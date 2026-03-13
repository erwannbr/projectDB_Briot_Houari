# projectDB\_Briot\_Houari
  <img width="1000" height="200" alt="image" src="https://github.com/user-attachments/assets/7c6cc0cb-e7df-4812-bd18-76fa7ea2ac99" />

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


You work in the field of MUSIC. Your COMPANY "Raye band" is involved in the domain of the management of the artist(raye). It is a label such as Lioness records, 32 Jazz. number of sales,nmbr of listeners((albums, singles(number of listeners per music)),concerts(stadiums,nmb of people,date) merch,vinyls,CDs), number of listeners per month,age of the listeners,places they are listening in (countries)and featuring with other artists . Take inspiration from the following sites: spotify,https://rayeofficial.com/,wikipedia, apple music, deezer, universal music.



Your company wants to apply MERISE to design an information system. You are responsible for the analysis part, i.e., gathering the company's requirements. It has called on a computer engineering student to carry out this project, and you must provide him with the necessary information so that he can then apply the following steps of database design and development himself.



First, establish the data business rules for your company in the form of a bulleted list. It must correspond to the information provided by someone who knows how the company works, but not how an information system is built.



Next, based on these rules, provide a raw data dictionary with the following columns, grouped in a table: meaning of the data, type, size in number of characters or digits. There should be between 25 and 35 data items. It is used to provide additional information about each data item (size and type) but without any assumptions about how the data will be modeled later.



Provide the business rules and the data dictionary.As the analysis lead for \*\*Raye Band\*\*, I have compiled the operational requirements for our artist management information system. This documentation is designed to provide a computer engineering student with the raw business logic needed to begin the \*\*MERISE\*\* modeling process (MCD, MLD, MPD).



---




## I. Data Business Rules

The following rules describe how our label operates daily. They define the relationships between our artist, her music, her fans, and her commercial ventures:

* **Artist & Collaborations:** We manage the main artist (**RAYE**). However, many tracks involve other performers. We must distinguish between the "Primary Artist" and "Featured Artists" for every recording to ensure correct billing and royalty distribution.
* **Product Hierarchy:** A "Release" is our top-level product, which can be an **Album**, an **EP**, or a **Single**. Each Release is identified by a unique 13-digit Universal Product Code (UPC).
* **Track Composition:** A Release consists of one or more "Tracks." Each individual track is identified globally by a 12-character International Standard Recording Code (ISRC).
* **Digital Distribution:** We monitor performance across multiple "Platforms" (Spotify, Apple Music, Deezer). We need to track total "Lifetime Streams" per track and per platform.
* **Monthly Analytics:** Beyond lifetime totals, we must record the "Monthly Listeners" for the artist as a whole to track popularity trends over time.
* **Global Geography:** We identify where our fans are located by tracking the number of listeners per "Country." We use standard 2-letter ISO codes for these locations.
* **Fan Demographics:** To refine our marketing, we categorize our audience into "Age Brackets" (e.g., 18-24, 25-34). We need to know the specific percentage of our total listenership that falls into each bracket.
* **Touring & Live Events:** Every "Concert" is a specific event tied to a "World Tour" name. A concert occurs on a specific "Date" at a specific "Venue."
* **Venue Logistics:** We must track the location of the venue (City and Country) and its "Maximum Capacity" to compare against the "Actual Tickets Sold."
* **Commerce & Merchandising:** We sell physical goods categorized as "Media" (Vinyls, CDs) or "Apparel" (T-shirts, hoodies).
* **Inventory Control:** Each physical product has a unique "SKU" (Stock Keeping Unit). We must maintain data on the "Unit Price," the "Initial Stock" produced, and the "Current Units Sold" to monitor real-time revenue.

## II. Raw Data Dictionary

This dictionary defines the "atoms" of information the system must store. It provides the technical constraints for size and type without assuming how the tables will eventually be linked.

| Meaning of the Data | Type | Size (Chars/Digits) |
| --- | --- | --- |
| Unique Song Identification Code (ISRC) | Alphanumeric | 12 |
| Global Product Barcode (UPC) | Alphanumeric | 13 |
| Title of the Track | Alphanumeric | 100 |
| Title of the Album/Release | Alphanumeric | 100 |
| Release Category (Album, EP, Single) | Alphabetic | 10 |
| Official Release Date | Date | 10 |
| Duration of the Track (in seconds) | Numeric | 4 |
| Artist or Collaborator Name | Alphanumeric | 50 |
| Artist Role (Primary/Featured) | Alphabetic | 15 |
| Digital Platform Name (Spotify, etc.) | Alphabetic | 20 |
| Total Lifetime Streams per Track | Numeric | 15 |
| Monthly Active Listeners (Artist Level) | Numeric | 12 |
| Country Name | Alphabetic | 50 |
| Country ISO Code (e.g., UK, US) | Alphabetic | 2 |
| Total Listeners per Country | Numeric | 12 |
| Age Group Range (e.g., 18-24) | Alphanumeric | 10 |
| Percentage of Audience in Age Group | Numeric | 5 |
| World Tour Name | Alphanumeric | 100 |
| Date of the Concert | Date | 10 |
| Venue Name (Stadium/Arena) | Alphanumeric | 100 |
| Venue City | Alphabetic | 50 |
| Venue Country | Alphabetic | 50 |
| Maximum Venue Capacity | Numeric | 7 |
| Actual Tickets Sold | Numeric | 7 |
| Standard Ticket Price | Numeric | 8 |
| Merchandise Item Name | Alphanumeric | 50 |
| Product SKU (Stock Keeping Unit) | Alphanumeric | 20 |
| Product Category (Vinyl, CD, Merch) | Alphabetic | 20 |
| Unit Sale Price (Retail) | Numeric | 8 |
| Initial Quantity Produced (Stock) | Numeric | 10 |
| Total Units Sold (Physical) | Numeric | 10 |
| Total Revenue per Product | Numeric | 15 |

---
<img width="1438" height="755" alt="image" src="https://github.com/user-attachments/assets/ea9fd427-c5fc-478b-a324-8ca72c1df61e" />

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## III. A. The resulting LDM

Platform = (platform_id BYTE, platform_name VARCHAR(20), platform_monthly_active_listeners INT);
Release_ = (release_upc VARCHAR(13), release_type VARCHAR(10), release_title VARCHAR(100), release_date DATE, #release_upc_Parents_album*);
Track = (tracks_ISRC VARCHAR(12), tracks_title VARCHAR(100), tracks_duration SMALLINT, #release_upc);
Artistes = (artiste_id INT, artiste_name VARCHAR(50));
Country = (country_iso VARCHAR(2), country_total_listeners INT, country_name VARCHAR(50));
Venue = (venue_name VARCHAR(100), venue_city VARCHAR(50), venue_country VARCHAR(50), venue_maximum_capacity INT);
Merch = (merch_SKU VARCHAR(20), merch_item_name VARCHAR(50), merch_product_category VARCHAR(20), merch_unit_sell_price INT, merch_total_per_product INT, merch_total_unit_sold INT, merch_initial_quantity_produced SMALLINT);
Démographics = (demographic_id INT, demographic_age_range VARCHAR(10));
World_Tour = (tour_id INT, tour_name VARCHAR(100));
Concerts = (#tour_id, concert_id INT, concert_date DATE, concert_ticket_sold INT, concert_ticket_price INT, #venue_name);
Part_of = (#tracks_ISRC, #artiste_id, part_role VARCHAR(15));
Streamed_on = (#platform_id, #tracks_ISRC, #country_iso, streamed_number_of_stream BIGINT);
Sells = (#merch_SKU, #tour_id);
are_invited = (#artiste_id, #(#tour_id, concert_id));
Analysed_by = (#(#tour_id, concert_id), #demographic_id, analysed_percentage_audience_age VARCHAR(50));

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## IV. Insertion 

We used the following prompt: 
Provide the insertion queries used to populate the database, whose relational model is as follows:

Platform = (platform_id BYTE, platform_name VARCHAR(20), platform_monthly_active_listeners INT);
Release_ = (release_upc VARCHAR(13), release_type VARCHAR(10), release_title VARCHAR(100), release_date DATE, #release_upc_Parents_album*);
Track = (tracks_ISRC VARCHAR(12), tracks_title VARCHAR(100), tracks_duration SMALLINT, #release_upc);
Artistes = (artiste_id INT, artiste_name VARCHAR(50));
Country = (country_iso VARCHAR(2), country_total_listeners INT, country_name VARCHAR(50));
Venue = (venue_name VARCHAR(100), venue_city VARCHAR(50), venue_country VARCHAR(50), venue_maximum_capacity INT);
Merch = (merch_SKU VARCHAR(20), merch_item_name VARCHAR(50), merch_product_category VARCHAR(20), merch_unit_sell_price INT, merch_total_per_product INT, merch_total_unit_sold INT, merch_initial_quantity_produced SMALLINT);
Démographics = (demographic_id INT, demographic_age_range VARCHAR(10));
World_Tour = (tour_id INT, tour_name VARCHAR(100));
Concerts = (#tour_id, concert_id INT, concert_date DATE, concert_ticket_sold INT, concert_ticket_price INT, #venue_name);
Part_of = (#tracks_ISRC, #artiste_id, part_role VARCHAR(15));
Streamed_on = (#platform_id, #tracks_ISRC, #country_iso, streamed_number_of_stream BIGINT);
Sells = (#merch_SKU, #tour_id);
are_invited = (#artiste_id, #(#tour_id, concert_id));
Analysed_by = (#(#tour_id, concert_id), #demographic_id, analysed_percentage_audience_age VARCHAR(50));

or simply find the model in the file 1_creation


Primary keys correspond to IDs, unless otherwise specified (when it is a composite attribute). Foreign keys are identified by # and have the same name as the primary keys to which they refer.
You must: provide enough data to be able to use the databse 
          use the songs of raye (the artist)

Foreign keys must refer to existing primary keys: provide the lines starting with filling in the tables in which there are no foreign keys, then the tables in which the foreign keys refer to primary keys in tables that have already been filled in. 

The data must comply with the following validation constraints:

find the constraint in the file 2_constraint

Make sure that the students' first and last names refer to various origins and are mixed. 

Provide the set in the form of an SQL script ready to be executed.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## V. The scenario 

Usage Scenario: Independent Artist Management (RAYE - My 21st Century Blues)
Since RAYE transitioned to being a fully independent artist under her own label (Human Re Sources/The Orchard), her team has taken on the full administrative and logistical responsibility previously handled by a major label. To manage this complexity, we have designed this database to serve as the operational backbone for the "My 21st Century Blues" era and its corresponding World Tour.

Our Role
In this project, we take on the role of Data Analysts for RAYE’s independent management team. Our goal is to transform raw tour, streaming, and sales data into actionable insights that allow the team to make informed decisions without the safety net of a major corporation.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
