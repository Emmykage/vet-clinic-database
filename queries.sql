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