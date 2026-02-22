# projectDB\_Briot\_Houari
                                           <img width="1536" height="768" alt="image" src="https://github.com/user-attachments/assets/f49d9f42-0f19-4dc0-bd3d-cc4bccd7a74d" />





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
