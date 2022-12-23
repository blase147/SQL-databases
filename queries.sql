/*Queries that provide answers to the questions from all projects.*/

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

SELECT * FROM animals.animals
