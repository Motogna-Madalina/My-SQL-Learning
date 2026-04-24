-- Create main table
CREATE TABLE artikel (
    artikelid INT,
    bezeichnung_artikel VARCHAR(50),
    status VARCHAR(10),
    tiefe INT,
    preis DECIMAL(10,2)
);
-- Basic table with all required columns


-- Create second table
CREATE TABLE artikelinfo (
    artikelid INT PRIMARY KEY,
    info VARCHAR(100)
);
-- Table used later for foreign key


-- Create third table
CREATE TABLE positionsartikel (
    positionsid INT PRIMARY KEY,
    artikelid INT
);
-- Table for relationship (foreign key later)z



-- Punkt 1: Rename table
ALTER TABLE artikel
RENAME TO artikelaktuell;
-- Rename table from 'artikel' to 'artikelaktuell'


-- Punkt 2: Rename column
ALTER TABLE artikelaktuell
RENAME COLUMN bezeichnung_artikel TO bezeichnung;
-- Rename column to a shorter and cleaner name


-- Punkt 3: Modify data type
ALTER TABLE artikelaktuell
MODIFY status VARCHAR(300);
-- Change column size to allow more text


-- Punkt 4: Add primary key
ALTER TABLE artikelaktuell
ADD PRIMARY KEY (artikelid);
-- Set artikelid as primary key (must be unique and not null)


-- Punkt 5: Drop primary key
ALTER TABLE artikelinfo
DROP PRIMARY KEY;
-- Remove primary key from another table


-- Punkt 6: Add NOT NULL constraint
ALTER TABLE artikelaktuell
MODIFY tiefe INT NOT NULL;
-- Prevent NULL values in this column


-- Punkt 7: Remove NOT NULL constraint
ALTER TABLE artikelaktuell
MODIFY tiefe INT NULL;
-- Allow NULL values again


-- Punkt 8: Add default value
ALTER TABLE artikelaktuell
MODIFY preis DECIMAL(10,2) DEFAULT 0.00;
-- Set default price to 0.00


-- Punkt 9: Remove default value
ALTER TABLE artikelaktuell
ALTER preis DROP DEFAULT;
-- Remove default value from column


-- Punkt 10: Add UNIQUE constraint
ALTER TABLE artikelaktuell
ADD UNIQUE (bezeichnung);
-- Ensure that product names are unique


-- Punkt 11: Add CHECK constraint
ALTER TABLE artikelaktuell
ADD CONSTRAINT chk_preis CHECK (preis < 1000);
-- Ensure price is less than 1000


-- Punkt 12: Drop CHECK constraint
ALTER TABLE artikelaktuell
DROP CHECK chk_preis;
-- Remove the price restriction


-- Punkt 13: Add new column
ALTER TABLE artikelaktuell
ADD kommentar VARCHAR(300);
-- Add a new column for comments


-- Punkt 14: Drop column
ALTER TABLE artikelaktuell
DROP COLUMN kommentar;
-- Remove the comment column


-- Punkt 15: Add foreign key
ALTER TABLE positionsartikel
ADD CONSTRAINT fk_artikel
FOREIGN KEY (artikelid)
REFERENCES artikelinfo(artikelid);
-- Create relationship between tables


-- Punkt 16: Drop foreign key
ALTER TABLE positionsartikel
DROP FOREIGN KEY fk_artikel;
-- Remove the relationship