-- Table: public.animals

-- DROP TABLE IF EXISTS public.animals;

CREATE TABLE IF NOT EXISTS animals.animals
(
    animals_id integer NOT NULL,
    name text COLLATE pg_catalog."default",
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg numeric,
    PRIMARY KEY (animals_id),
)

-- Create a table named owners
BEGIN;
CREATE TABLE animals.owners (
    id serial PRIMARY KEY,
    full_name text,
    age text
)
COMMIT;

-- Create a table named species
BEGIN;
CREATE TABLE animals.species (
    species_id serial PRIMARY KEY,
    name text,
)
COMMIT;

-- Modify animals table
-- id is set as autoincremented PRIMARY KEY
BEGIN;

ALTER TABLE animals.animals
ADD serial PRIMARY KEY (animals_id)

-- Remove column species
ALTER TABLE animals.animals 
DROP species

-- Add column species_id which is a foreign key referencing species table
ALTER TABLE animals.animals 
ADD species_id

-- Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals.animals 
ADD owner_id integer;

COMMIT;

-- Create a table named vets
BEGIN;

CREATE TABLE animals.vets (
    id serial PRIMARY KEY,
    name text,
    age integer,
    date_of_graduation date
);

-- many-many relationship: create table to connects two table together
CREATE TABLE animals.specializations(
    species_id INT REFERENCES animals.species(id) ON DELETE CASCADE,
    vets_id INT REFERENCES animals.vets(id) ON DELETE CASCADE
);

CREATE TABLE animals.visits(
	animals_id integer,
	vets_id integer,
	date_of_visit date
);

ALTER TABLE animals.visits 
ADD CONSTRAINT visits1 FOREIGN KEY (animals_id) REFERENCES animals.animals(id);

ALTER TABLE animals.visits 
ADD CONSTRAINT visits2 FOREIGN KEY (vets_id) REFERENCES animals.vets(id);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);


