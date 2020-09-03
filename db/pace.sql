DROP TABLE  IF EXISTS notes;
DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTSowners;
DROP TABLE IF EXISTS vets;

CREATE TABLE vets (
    id SERIAL primary key,
    name VARCHAR(255),
);

CREATE TABLE animals (
    id SERIAL primary key,
    name VARCHAR(255),
    date_of_birth VARCHAR(255),
    animal_type VARCHAR(255),
    animal_breed VARCHAR(255),
    owner_name VARCHAR(255),
    owner_phone_number VARCHAR(255),
    treatment_note TEXT,
    vet_id INT REFERENCES vets(id)
);

CREATE TABLE notes (
    id SERIAL primary key,
    treatment_note TEXT,
    date VARCHAR(255),
    animal_id INT REFERENCES animals(id) ON DELETE CASCADE
);

