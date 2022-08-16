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


-- who was the last animal seen by William
SELECT A.name, V.visit_date FROM visits V JOIN animals A ON A.id=V.animal_id WHERE V.vet_id=(SELECT id FROM vets WHERE name = 'William Tatcher') ORDER BY visit_date DESC LIMIT 1;

-- How many different animals did Stephanie Mendez see?

SELECT COUNT(DISTINCT A.name) FROM visits V JOIN animals A ON A.id=V.animal_id WHERE V.vet_id=(SELECT id FROM vets WHERE name='Stephanie Mendez')

-- List all vets and their specialties, including vets with no specialties.
SELECT V.name, S.name AS speciality FROM vets V LEFT JOIN (
     SELECT S.name, sp.vet_id AS id FROM species S JOIN specializations sp ON S.id=sp.species_id ) 
     AS S ON V.id=S.id GROUP BY V.name, speciality;

    --  List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
    SELECT A.name, V.visit_date FROM (SELECT A.name, A.id FROM animals A JOIN visits v ON A.id = v.animal_id GROUP BY A.name, A.id ) 
    AS A JOIN visits V ON  V.vet_id=(SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez' )
    WHERE V.visit_date BETWEEN '2020-04-01' AND '2020-08-30';

-- What animal has the most visits to vets?

SELECT A.name AS animal_name, COUNT(V.vet_id) AS visitations
FROM visits V
JOIN animals A ON A.id = V.animal_id
GROUP BY A.name
ORDER BY COUNT(V.vet_id) DESC LIMIT 1;

/* Who was Maisy Smith's first visit? */
SELECT vets.name AS vet, animals.name AS animal, visit_date
FROM visits
JOIN vets ON vet_id = vets.id
JOIN animals ON animal_id = animals.id
WHERE vets.name = 'Maisy Smith'
ORDER BY visit_date
LIMIT 1;

/* Details for most recent visit: animal information, vet information, and date of visit. */
SELECT
  animals.name,  date_of_birth,  escape_attempt,  neutered,  weight_kg,  vets.name,  age AS vet_age,
  date_of_graduation AS vet_graduation,
  visit_date
FROM visits
JOIN vets ON vet_id = vets.id
JOIN animals ON animal_id = animals.id
ORDER BY visit_date DESC
LIMIT 1;

/* How many visits were with a vet that did not specialize in that animal's species? */
SELECT COUNT(vet) as visitations
FROM (
  SELECT animals.name AS animal, animals.species_id AS species, vets.name AS vet, S.species_id AS vet_specialty
  FROM visits
  JOIN vets ON vet_id = vets.id
  JOIN animals ON animal_id = animals.id
  JOIN specializations S ON S.vet_id = vets.id
  WHERE vets.name != 'Stephanie Mendez' AND animals.species_id != S.species_id OR S.species_id IS NULL
) AS not_specialized;

/* What specialty should Maisy Smith consider getting? Look for the species she gets the most. */
SELECT species.name AS species, COUNT(vets.name) AS visitations
FROM visits
JOIN vets ON vet_id = vets.id
JOIN animals ON animal_id = animals.id
JOIN species ON animals.species_id = species.id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name;




   EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animal_id = 4;
    EXPLAIN ANALYZE SELECT * FROM visits where vet_id = 2;
    EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';
