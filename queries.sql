/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = 'Luna';

SELECT * FROM WHERE name LIKE '%mon%'; 
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-30'; 
SELECT * FROM animals WHERE (neutered = t) AND (escape_attempt < 3);   
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');        
SELECT date_of_birth FROM animals WHERE (name ='Agumon') OR (name = 'Pikachu'); 
SELECT name, escape_attempt FROM animals WHERE (weight_kg < 10.5);   
SELECT * FROM animals WHERE (neutered = 't');    
SELECT * FROM animals WHERE (name != 'Gabumon');   
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;   

-- query and update animals table
SELECT COUNT(*) FROM animals; 
SELECT COUNT(escape_attempt) FROM animals WHERE escape_attempt = 0;  
SELECT AVG(weight_kg) FROM animals;  
SELECT COUNT(escape_attempt) FROM animals WHERE escape_attempt > 0 GROUP BY neutered;           
SELECT MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;  
SELECT AVG(escape_attempt) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2020-12-30' GROUP BY species;  
