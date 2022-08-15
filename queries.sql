/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = 'Luna';



DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SELECT * FROM animals;
SAVEPOINT spoint1;
UPDATE animals SET weight_kg = weight_kg * -1;
SELECT * FROM animals;
ROLLBACK TO spoint1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg  0;
COMMIT;


-- aggregrate
SELECT * FROM WHERE name LIKE '%mon%'; 
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-30'; 
SELECT * FROM animals WHERE (neutered = t) AND (escape_attempt < 3);   
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');        
SELECT date_of_birth FROM animals WHERE (name ='Agumon') OR (name = 'Pikachu'); 
SELECT name, escape_attempt FROM animals WHERE (weight_kg < 10.5);   
SELECT * FROM animals WHERE (neutered = 't');    
SELECT * FROM animals WHERE (name != 'Gabumon');   
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3; 

-- transaction
BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT species FROM animals;
ROLLBACK;
SELECT species FROM animals


-- query and update animals table
SELECT COUNT(*) FROM animals; 
SELECT COUNT(escape_attempt) FROM animals WHERE escape_attempt = 0;  
SELECT AVG(weight_kg) FROM animals;  
SELECT COUNT(escape_attempt) FROM animals WHERE escape_attempt > 0 GROUP BY neutered;           
SELECT MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;  
SELECT AVG(escape_attempt) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2020-12-30' GROUP BY species;  


-- queries using Join 
-- What animals belong to Melody Pond?

SELECT A.id, A.name, O.full_name FROM owners O JOIN animals A ON A.owner_id=O.id WHERE full_name= 'Melody Pond'; 

-- List of all animals that are pokemon (their type is Pokemon).
SELECT A.id, A.name, S.name FROM animals A JOIN species S ON A.species_id=S.id WHERE A.species_id=(SELECT id FROM species WHERE name ='Pokemon');

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT O.full_name, A.name FROM owners o LEFT JOIN animals A ON A.owner_id=O.id;

-- How many animals are there per species?
SELECT COUNT(*), S.name FROM animals A JOIN species S ON A.species_id=S.id GROUP BY S.name;

-- List all Digimon owned by Jennifer Orwell.
SELECT name AS digimon FROM (SELECT A.name, A.owner_id FROM species S JOIN animals A ON A.species_id=S.id WHERE S.name='Digimon') AS digimonLIst JOIN owners O ON digimonLIst.owner_id=O.id WHERE O.full_name= 'Jennifer Orwell';


-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT A.name , O.full_name FROM owners O JOIN animals A ON A.owner_id=(SELECT id FROM owners WHERE full_name='Dean Winchester') WHERE A.escape_attempt=0;

-- SELECT COUNT(*), S.name FROM animals A JOIN species S ON A.species_id=S.id GROUP BY S.name;
-- Who owns the most animals

SELECT COUNT(A.name) AS anime, O.full_name FROM animals A JOIN owners O ON A.owner_id = O.id GROUP BY O.full_name ORDER BY anime DESC LIMIT 1;
