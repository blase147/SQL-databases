/* Database schema to keep the structure of entire database.*/

-- Table: animals.animals

-- DROP TABLE IF EXISTS animals.animals;

CREATE TABLE IF NOT EXISTS animals.animals
(
    id integer,
    name text COLLATE pg_catalog."default",
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg point
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS animals.animals
    OWNER to postgres;
