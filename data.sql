-- Day 1

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES
('Agumon', '2020-02-03', 10.23, TRUE, 0),
('Gabumon', '2018-11-15', 8, TRUE, 2),
('Pikachu', '2021-01-07', 15.04, FALSE, 1),
('Devimon', '2017-05-12', 11, TRUE, 5);

-- Day 2
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES
('Charmander', '2020-02-08', -11, FALSE, 0),
('Plantmon', '2021-11-15', -5.7, TRUE, 2),
('Squirtle', '1993-04-02', -12.13, FALSE, 3),
('Angemon', '2005-06-12', -45, TRUE, 1),
('Boarmon', '2005-06-07', 20.4, TRUE, 7),
('Blossom', '1998-10-13', 17, TRUE, 3),
('Ditto', '2022-05-14', 22, TRUE, 4);

-- Day 3
-- Insert the following data into the owners table:
--   Sam Smith 34 years old.
--   Jennifer Orwell 19 years old.
--   Bob 45 years old.
--   Melody Pond 77 years old.
--   Dean Winchester 14 years old.
--   Jodie Whittaker 38 years old.
-- Insert the following data into the species table:
--   Pokemon
--   Digimon
-- Modify your inserted animals so it includes the species_id value:
--   If the name ends in "mon" it will be Digimon
--   All other animals are Pokemon
-- Modify your inserted animals to include owner information (owner_id):
--   Sam Smith owns Agumon.
--   Jennifer Orwell owns Gabumon and Pikachu.
--   Bob owns Devimon and Plantmon.
--   Melody Pond owns Charmander, Squirtle, and Blossom.
--   Dean Winchester owns Angemon and Boarmon.
-- Remember these insertions and modifications happen in data.sql file.
