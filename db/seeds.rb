require_relative('../models/animal')
require_relative('../models/vet')

animal1 = Animal.new({
    'name' => 'Sherry',
    'date_of_birth' => '31/05/2007',
    'animal_type' => 'Cat',
    'animal_breed' => 'domestic short hair',
    'owner-name' => 'Craig McLeod',
    'owner_phone_number' => '07777777770',
    'treatment_notes' => "",
    'vet_id' => vet1.id})

animal2 = Animal.new({
        'name' => 'Scoobert-Doo',
        'date_of_birth' => '13/09/1963',
        'animal_type' => 'Dog',
        'animal_breed' => 'great dane',
        'owner-name' => 'Norville Rogers',
        'owner_phone_number' => '555-123-134',
        'treatment_notes' => "",
        'vet_id' => vet2.id})

animal1.save()
animal2.save()