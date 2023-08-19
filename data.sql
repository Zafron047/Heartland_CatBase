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
INSERT INTO owners(full_name, age)
VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);
-- DONE

-- Insert the following data into the species table:
--   Pokemon
--   Digimon
INSERT INTO species(name)
VALUES
('Pokemon'),
('Digimon');
-- DONE

-- Modify your inserted animals so it includes the species_id value:
--   If the name ends in "mon" it will be Digimon
UPDATE animals 
SET species_id = (SELECT id FROM species WHERE name = 'Digimon') 
WHERE name LIKE '%mon';
-- DONE

--   All other animals are Pokemon
UPDATE animals 
SET species_id = (SELECT id FROM species WHERE name = 'Pokemon') 
WHERE species_id IS NULL;
-- DONE

-- Modify your inserted animals to include owner information (owner_id):
--   Sam Smith owns Agumon.
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith')
WHERE name = 'Agumon';
-- DONE

--   Jennifer Orwell owns Gabumon and Pikachu.
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHERE name IN ('Gabumon', 'Pikachu');
-- DONE

--   Bob owns Devimon and Plantmon.
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
WHERE name IN ('Devimon', 'Plantmon');
-- DONE

--   Melody Pond owns Charmander, Squirtle, and Blossom.
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
-- DONE

--   Dean Winchester owns Angemon and Boarmon.
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
WHERE name IN ('Angemon', 'Boarmon');
-- DONE
