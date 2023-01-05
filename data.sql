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

-- Insert data into the animals.animals.species table
BEGIN;
INSERT INTO animals.species(name)
VALUES ('Pokemon'),
        ('Digimon');
COMMIT;

-- Modify your inserted animals.animals so it includes the species_id value:
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

-- Modify your inserted animals.animals to include owner information (owner_id)
-- Sam Smith owns Agumon.
BEGIN;

UPDATE animals.animals
SET owner_id = 'Sam Smith'
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
SET owner_id = 'Dean Winchester'
WHERE name IN ('Angemon', 'Boamon');
COMMIT;

-- insert records into animals.animals.vets table
INSERT INTO animals.vets(name, age, date_of_graduation) VALUES('William Tatcher',45,'2000-04-23');
INSERT INTO animals.vets(name, age, date_of_graduation) VALUES('Maisy Smith',26,'2019-01-17');
INSERT INTO animals.vets(name, age, date_of_graduation) VALUES('Stephanie Mendez',64,'1981-04-05');
INSERT INTO animals.vets(name, age, date_of_graduation) VALUES('Jack Harkness',38,'2008-06-08');

-- insert records into specialization table based on conditions
INSERT INTO animals.specializations(vets_id, species_id) VALUES(
    (SELECT animals_id FROM animals.vets WHERE name = 'William Tatcher'),
    (SELECT animals_id FROM animals.species WHERE name = 'Pokemon')
);

INSERT INTO animals.specializations(vets_id, species_id) VALUES(
    (SELECT animals_id FROM animals.vets WHERE name = 'Stephanie Mendez'),
    (SELECT animals_id FROM animals.species WHERE name = 'Digimon')
);

INSERT INTO animals.specializations(vets_id, species_id) VALUES(
    (SELECT animals_id FROM animals.vets WHERE name = 'Jack Harkness'),
    (SELECT animals_id FROM animals.species WHERE name = 'Digimon')
);

-- insert records into animals.animals.vets table

INSERT INTO animals.visits(animals_id, vets_id , visit_date) VALUES(
    (SELECT animals_id FROM animals.animals WHERE name = 'Agumon'),
    (SELECT animals_id FROM animals.vets WHERE name = 'William Tatcher'),'2020-05-24'
);

INSERT INTO animals.animals.animals.animals.visits(animals_id, vets_id , visit_date) VALUES(
    (SELECT animals_id FROM animals.animals WHERE name = 'Agumon'),
    (SELECT animals_id FROM animals.vets WHERE name = 'Stephanie Mendez'),'2020-07-22'
);

INSERT INTO animals..visits(animals_id, vets_id , visit_date) VALUES(
    (SELECT animals_id FROM animals.animals WHERE name = 'Gabumon'),
    (SELECT animals_id FROM animals.vets WHERE name = 'Jack Harkness'),'2021-02-02'
);

INSERT INTO animals.visits(animals_id, vets_id , visit_date) VALUES(
    (SELECT animals_id FROM animals.animals WHERE name = 'Pikachu'),
    (SELECT animals_id FROM animals.vets WHERE name = 'Maisy Smith'),'2020-01-05'
);

INSERT INTO animals.visits(animals_id, vets_id , visit_date) VALUES(
    (SELECT animals_id FROM animals.animals WHERE name = 'Pikachu'),
    (SELECT id FROM animals.vets WHERE name = 'Maisy Smith'),'2020-03-08'
);

INSERT INTO animals.visits(animals_id, vets_id , visit_date) VALUES(
    (SELECT animals_id FROM animals.animals WHERE name = 'Pikachu'),
    (SELECT id FROM animals.vets WHERE name = 'Maisy Smith'),'2020-05-14'
);

INSERT INTO animals.visits(animals_id, vets_id , visit_date) VALUES(
    (SELECT animals_id FROM animals.animals WHERE name = 'Devimon'),
    (SELECT id FROM animals.vets WHERE name = 'Stephanie Mendez'),'2021-05-04'
);

INSERT INTO animals.visits(animals_id, vets_id , visit_date) VALUES(
    (SELECT animals_id FROM animals.animals WHERE name = 'Charmander'),
    (SELECT id FROM animals.vets WHERE name = 'Jack Harkness'),'2021-02-24'
);

INSERT INTO animals.visits(animals_id, vets_id , visit_date) VALUES(
    (SELECT animals_id FROM animals.animals WHERE name = 'Plantmon'),
    (SELECT id FROM animals.vets WHERE name = 'Maisy Smith'),'2019-12-21'
);

INSERT INTO animals.visits(animals_id, vets_id , visit_date) VALUES(
    (SELECT animals_id FROM animals.animals WHERE name = 'Plantmon'),
    (SELECT id FROM animals.vets WHERE name = 'William Tatcher'),'2020-08-10'
);

INSERT INTO animals.visits(animals_id, vets_id , visit_date) VALUES(
    (SELECT animals_id FROM animals.animals WHERE name = 'Plantmon'),
    (SELECT id FROM animals.vets WHERE name = 'Maisy Smith'),'2021-04-07'
);

INSERT INTO animals.visits(animals_id, vets_id , visit_date) VALUES(
    (SELECT animals_id FROM animals.animals WHERE name = 'Squirtle'),
    (SELECT id FROM animals.vets WHERE name = 'Stephanie Mendez'),'2019-09-29'
);

INSERT INTO animals.visits(animals_id, vets_id , visit_date) VALUES(
    (SELECT animals_id FROM animals.animals WHERE name = 'Angemon'),
    (SELECT id FROM animals.vets WHERE name = 'Jack Harkness'),'2020-10-03'
);

INSERT INTO animals.visits(animals_id, vets_id , visit_date) VALUES(
    (SELECT animals_id FROM animals.animals WHERE name = 'Angemon'),
    (SELECT id FROM animals.vets WHERE name = 'Jack Harkness'),'2020-11-04'
);

INSERT INTO animals.visits(animals_id, vets_id , visit_date) VALUES(
    (SELECT animals_id FROM animals.animals WHERE name = 'Boarmon'),
    (SELECT id FROM animals.vets WHERE name = 'Maisy Smith'),'2019-01-24'
);

INSERT INTO animals.visits(animals_id, vets_id , visit_date) VALUES(
    (SELECT animals_id FROM animals.animals WHERE name = 'Boarmon'),
    (SELECT id FROM animals.vets WHERE name = 'Maisy Smith'),'2020-05-15'
);

INSERT INTO animals.visits(animals_id, vets_id , visit_date) VALUES(
    (SELECT animals_id FROM animals.animals WHERE name = 'Boarmon'),
    (SELECT id FROM animals.vets WHERE name = 'Maisy Smith'),'2020-02-27'
);

INSERT INTO animals.visits(animals_id, vets_id , visit_date) VALUES(
    (SELECT animals_id FROM animals.animals WHERE name = 'Boarmon'),
    (SELECT id FROM animals.vets WHERE name = 'Maisy Smith'),'2020-08-03'
);

INSERT INTO animals.visits(animals_id, vets_id , visit_date) VALUES(
    (SELECT animals_id FROM animals.animals WHERE name = 'Blossom'),
    (SELECT id FROM animals.vets WHERE name = 'Stephanie Mendez'),'2020-05-24'
);

INSERT INTO animals.visits(animals_id, vets_id , visit_date) VALUES(
    (SELECT animals_id FROM animals.animals WHERE name = 'Blossom'),
    (SELECT id FROM animals.vets WHERE name = 'William Tatcher'),'2021-01-11'
);

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO animals.visits (animals_id, vets_id, visit_date) SELECT * FROM (SELECT animals_id FROM animals.animals) animal_ids, (SELECT id FROM animals.vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
INSERT INTO animals.owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

EXPLAIN ANALYZE 
SELECT COUNT(*) FROM animals.visits where animals_id = 4
SELECT * FROM animals.visits where vets_id = 2;
