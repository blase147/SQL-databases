/*Queries that provide answers to the questions from all projects.*/
/*updating species column*/
BEGIN;
UPDATE animals.animals
SET species = 'unspecified'
ROLLBACK;
COMMIT;

/* updating species column*/
BEGIN;
UPDATE animals.animals
SET species = 'digmon'
WHERE name LIKE '%mon%'
COMMIT;

/* updating species column */
BEGIN;
UPDATE animals.animals
SET species = 'pokemon'
WHERE species = null
COMMIT;

/* deleting all records in the animals table*/
BEGIN;
DELETE FROM animals.animals
ROLLBACK;
COMMIT

/* deleting all animals born after 2020-01-01*/
BEGIN;
DELETE FROM animals.animals
WHERE date_of_birth > '2020-01-01';
COMMIT;

/* savepoint*/
BEGIN;
SAVEPOINT save1
COMMIT;

/*updating animals weight*/
BEGIN;
UPDATE animals.animals
SET weight_kg = weight_kg*(-1)
ROLLBACK TO save1
COMMIT;

/*How many animals are there?*/
SELECT COUNT(*)
FROM animals.animals

/*How many animals have never tried to escape?*/
SELECT COUNT(escape_attempts)
FROM animals.animals
WHERE escape_attempts = '0'

/*What is the average weight of animals?*/
SELECT AVG(weight_kg)
FROM animals.animals

/*Who escapes the most, neutered or not neutered animals?*/
SELECT name FROM animals.animals
ORDER BY escape_attempts DESC LIMIT 1;

/*What is the minimum and maximum weight of each type of animal?*/
SELECT MIN(weight_kg), MAX(weight_kg) FROM animals.animals GROUP BY(species);

/*What is the average number of escape attempts per animal type of those born between 1990 and 2000?*/
SELECT ROUND(AVG(escape_attempts),2) AS average FROM animals.animals
WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN '1990' AND '2000'
GROUP BY(species) ORDER BY average;

-- query questions: join multiple tables
SELECT A.name,A.date_of_birth, A.escape_attempts, A.neutered, A.weight_kg
FROM animals.animals  A 
JOIN owners OW ON A.owner_id = OW.id
WHERE OW.full_name = 'Melody Pond';

SELECT A.name,A.date_of_birth, A.escape_attempts, A.neutered, A.weight_kg
FROM animals.animals  A 
JOIN species S ON A.species_id = S.id
WHERE S.name = 'Pokemon';

SELECT OW.full_name , A.name FROM animals.animals  A 
RIGHT JOIN owners OW ON A.owner_id = OW.id;


SELECT S.name AS species, COUNT(*) AS total_animals FROM animals.animals A
JOIN species S ON A.species_id = S.id
GROUP BY (S.name);

SELECT A.name AS animals_name , S.name AS species_name, OW.full_name AS owner_name FROM animals A
JOIN species S ON A.species_id = S.id
JOIN owners OW ON  A.owner_id = OW.id
WHERE S.name = 'Digimon' AND OW.full_name = 'Jennifer Orwell';

SELECT A.name, A.escape_attempts, OW.full_name FROM animals  A 
JOIN owners OW ON A.owner_id = OW.id
WHERE A.escape_attempts = 0 AND OW.full_name = 'Dean Winchester';

SELECT OW.full_name AS owner_name, COUNT(A.name) AS total_animals FROM animals  A 
JOIN owners OW ON A.owner_id = OW.id
GROUP BY (OW.full_name) ORDER BY total_animals DESC
LIMIT 1;


-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT A.name FROM animals A
JOIN visits V ON V.animal_id = A.id
GROUP BY A.name
ORDER BY COUNT(*) DESC LIMIT 1;