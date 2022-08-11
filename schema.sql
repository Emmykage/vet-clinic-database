/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED BY DEFAULT AS IDENTITY,   
    name VARCHAR(100) NOT NULL,  
    date_of_birth DATE,   
    escape_attempt INT, 
    neutered BIT, 
    weight_kg DECIMAL(5,2)     
   
    
);                                                                                  ALTER TABLE animals ADD COLUMN species VARCHAR(50);