require_relative('../db/sql_runner')

class Animal

    attr_reader :id, :name, :date_of_birth, :vet_id, :animal_type, :animal_breed, :owner_name
    attr_accessor :treatment_notes, :vet_id

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @name = options['name']
        @date_of_birth = options['date_of_birth']
        @animal_type = options['animal_type']
        @animal_breed = options['animal_breed']
        @owner_name = options['owner_name']
        @owner_phone_number = options['owner_phone_number']
        @treatment_notes = options['treatment_notes']
        @vet_id = options['vet_id'].to_i
    end

    

end