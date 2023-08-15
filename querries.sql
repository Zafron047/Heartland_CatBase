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
