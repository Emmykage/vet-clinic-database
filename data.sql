/* Populate database with sample data. */

INSERT INTO animals (name) VALUES ('Luna');
INSERT INTO animals (name) VALUES ('Daisy');
INSERT INTO animals (name) VALUES ('Charlie');


INSERT INTO animals (name, date_of_birth, escape_attempt, neutered, weight_kg) VALUES ('Agumon', '2020-02-03', 0, true, 10.23);                                                                                                    INSERT 0 1            

INSERT INTO animals (name, date_of_birth, escape_attempt, weight_kg, neutered) VALUES ('Gabumon', '2018-11-15', 2, 8, true); 
INSERT INTO animals (name, date_of_birth, escape_attempt, weight_kg, neutered) VALUES ('Pikachu', '2021-01-7', 1, 15.04, false);   

INSERT INTO animals (name, date_of_birth, escape_attempt, weight_kg, neutered) VALUES ('Devimon', '2017-05-12', 5, 11, true);   

-- query and update animals table
INSERT INTO animals (name, date_of_birth, escape_attempt, weight_kg, neutered) VALUES ('Charmander', '2020-2-8', 0, -11, false);
INSERT INTO animals (name, date_of_birth, escape_attempt, weight_kg, neutered) VALUES ('Plantmon', '2021-11-15', 2, 5.7, true);
INSERT INTO animals (name, date_of_birth, escape_attempt, weight_kg, neutered) VALUES ('Squirtle', '1993-04-02', 3, 12.13, false);
INSERT INTO animals (name, date_of_birth, escape_attempt, weight_kg, neutered) VALUES ('angemon', '2005-06-12', 1, 45, true);

INSERT INTO animals (name, date_of_birth, escape_attempt, weight_kg, neutered) VALUES('Boarmon','2005-06-12', 7, 20.4, true);       
 INSERT INTO animals (name, date_of_birth, escape_attempt, weight_kg, neutered) VALUES('Blossom','1998-10-13', 3, 17, true);          
 INSERT INTO animals (name, date_of_birth, escape_attempt, weight_kg, neutered) VALUES('Ditto','2022-05-14', 4, 22, true);  