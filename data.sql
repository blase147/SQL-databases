/* Populate database with sample data. */

INSERT INTO animals.animals VALUES (1, 'Agumon', '2020-02-03', 0, true, 10.23)
INSERT INTO animals.animals VALUES (2, 'Gabumon', '2018-11-15', 2, true, 8)
INSERT INTO animals.animals VALUES (3, 'Pikachu', '2021-01-07', 1, false, 15.04)
INSERT INTO animals.animals VALUES (4, 'Devimon', '2017-05-12', 5, true, 11)
INSERT INTO animals.animals VALUES (5, 'Charmander', '2017-05-12', 0, false, 11)
INSERT INTO animals.animals VALUES (6, 'Plantmon', '2021-11-15', 2, true, 5.7)
INSERT INTO animals.animals VALUES (7, 'Squirtle', '1993-04-02', 3, false, 12.13)
INSERT INTO animals.animals VALUES (8, 'Angemon', '2005-06-12', 1, true, 45)
INSERT INTO animals.animals VALUES (9, 'Boamon', '2005-06-07', 7, true, 20.4)
INSERT INTO animals.animals VALUES (10, 'Blossom', '1998-10-13', 3, true, 17)
INSERT INTO animals.animals VALUES (11, 'Ditto', '2022-05-14', 4, true, 22)

-- data into the owners table
BEGIN;
INSERT INTO animals.owners(full_name, age)
VALUES  ('Sam Smith', 34),
        ('Jennifer Orwell', 19),
        ('Bob', 45),
        ('Melody Pond', 77)
        ('Dean Winchester', 14),
        ('Jodie Whittaker', 38)
COMMIT;

-- Insert data into the species table
BEGIN;
INSERT INTO animals.species(name)
VALUES ('Pokemon'),
        ('Digimon');
COMMIT;

-- Modify your inserted animals so it includes the species_id value:
BEGIN;

UPDATE animals.animals
SET species_id = 'Digimon'
WHERE name LIKE '%mon%';
COMMIT;

BEGIN;

UPDATE animals.animals
SET species_id = 'Pokemon'
WHERE name NOT LIKE '%mon%';
COMMIT;

-- Modify your inserted animals to include owner information (owner_id)
-- Sam Smith owns Agumon.
BEGIN;

UPDATE animals.animals
SET owners_id = 'Sam Smith'
WHERE name = 'Agumon';
COMMIT;

-- Jennifer Orwell owns Gabumon and Pikachu.
BEGIN;

UPDATE animals.animals
SET owner_id = 'Jennifer Orwell'
WHERE name  IN ('Gabumon','Pikachu');
COMMIT;

-- Bob owns Devimon and Plantmon.
BEGIN;

UPDATE animals.animals
SET owner_id = 'Bob'
WHERE name IN ('Devimon', 'Plantmon');
COMMIT;

-- Melody Pond owns Charmander, Squirtle, and Blossom.
BEGIN;

UPDATE animals.animals
SET owner_id = 'Melody Pond'
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
COMMIT;

-- Dean Winchester owns Angemon and Boarmon.
BEGIN;

UPDATE animals.animals
SET owners_id = 'Dean Winchester'
WHERE name IN ('Angemon', 'Boamon');
COMMIT;