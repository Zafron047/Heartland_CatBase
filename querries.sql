-- Day 1 ---------- Begin -------------

-- Find all animals whose name ends in "mon".
SELECT * from animals
WHERE name LIKE '%mon';

-- List the name of all animals born between 2016 and 2019.
SELECT * FROM animals
WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

-- List the name of all animals that are neutered and have less than 3 escape attempts.
SELECT * FROM animals
WHERE neutered = TRUE AND escape_attempts < 3;

-- List the date of birth of all animals named either "Agumon" or "Pikachu".
SELECT date_of_birth FROM animals
WHERE name IN ('Agumon', 'Pikachu');

-- List name and escape attempts of animals that weigh more than 10.5kg
SELECT name, escape_attempts FROM animals
WHERE weight_kg > 10.5;

-- Find all animals that are neutered.
SELECT * FROM animals
WHERE neutered = TRUE;

-- Find all animals not named Gabumon.
SELECT * FROM animals
WHERE name <> 'Gabumon';

-- Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
SELECT * FROM animals
WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- Day 1 --------- XXxxXX ------------

-- Day 2 ---------- Begin -------------

-- Task 1 =======>>
-- Inside a transaction update the animals table by setting the species column to unspecified. Verify 
-- that change was made. Then roll back the change and verify that the species columns went back to the 
-- state before the transaction.

-- Inside a Transaction:
BEGIN;

-- Update animals table by setting Species Column to unspecified.
UPDATE animals
SET species = 'unspecified';

-- Verify that change was made.
SELECT species FROM animals;

-- Roll Back the Transaction
ROLLBACK;

-- Verify the Rollback
SELECT species FROM animals;

-- Task 2 =======>>
-- Start a transaction
BEGIN;

-- Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';

-- Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;

-- Verify that changes were made.
SELECT species FROM animals;

-- Commit the transaction.
COMMIT;

-- Verify that changes persist after commit.
SELECT species FROM animals;

-- Task 3 =======>>
-- Inside a transaction delete all records in the animals table, then roll back the transaction.

-- Inside a transaction
BEGIN;

-- delete all records
DELETE FROM animals;

-- then roll back the transaction
ROLLBACK;

-- After the rollback verify if all records in the animals table still exists.
SELECT COUNT(*) FROM animals;

-- Task 4 =======>>
-- Inside a transaction:
BEGIN;

-- 1# Delete all animals born after Jan 1st, 2022
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';

-- 2# Create a savepoint for the transaction
SAVEPOINT save_01;

-- 3# Update all animals' weight to be their weight multiplied by -1
UPDATE animals
SET weight_kg = weight_kg * -1;

-- 4# Rollback to the savepoint
ROLLBACK TO save_01;

-- 5# Update all animals' weights that are negative to be their weight multiplied by -1
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;

-- 6# Commit transaction
COMMIT;

-- Task 5 =======>>
-- Write queries to answer the following questions:
-- 1# How many animals are there?
SELECT COUNT(*) AS nums_of_animals FROM animals;

-- 2# How many animals have never tried to escape?
SELECT COUNT(*) AS zero_escape FROM animals
WHERE escape_attempts = 0;

-- 3# What is the average weight of animals?
SELECT AVG(weight_kg) AS avg_weight FROM animals;

-- 4# Who escapes the most, neutered or not neutered animals?
SELECT neutered FROM animals
GROUP BY neutered
ORDER BY SUM(escape_attempts) DESC
LIMIT 1;

-- 5# What is the minimum and maximum weight of each type of animal?
SELECT Species, MIN(weight_kg), MAX(weight_kg) FROM animals
GROUP BY Species;

-- 6# What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT Species, AVG(escape_attempts) FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY Species;

-- Day 3
-- Write queries (using JOIN) to answer the following questions:
--   What animals belong to Melody Pond?
--   List of all animals that are pokemon (their type is Pokemon).
--   List all owners and their animals, remember to include those that don't own any animal.
--   How many animals are there per species?
--   List all Digimon owned by Jennifer Orwell.
--   List all animals owned by Dean Winchester that haven't tried to escape.
--   Who owns the most animals?
-- Remember all these should be written in queries.sql file.
