DROP TABLE notes;
DROP TABLE animals;
DROP TABLE owners;
DROP TABLE vets;
DROP TABLE records;

CREATE TABLE records (
    id SERIAL primary key,
    vet_id INT REFERENCES vets(id),
    owner_id INT REFERENCES owners(id),
    animal_id INT REFERENCES animals(id),
    note_id INT REFERENCES notes(id)
);


CREATE TABLE vets (
    id SERIAL primary key,
    name VARCHAR(255)
);

CREATE TABLE owners (
    id serial primary key,
    name VARCHAR(255),
    vet_registration BOOLEAN,
    contact_number VARCHAR(255)
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
    vet_id INT REFERENCES vets(id) --,
    -- owner_id INT references ownders(id)
);

CREATE TABLE notes (
    id SERIAL primary key,
    treatment_note TEXT,
    date VARCHAR(255),
    animal_id INT REFERENCES animals(id)
);

