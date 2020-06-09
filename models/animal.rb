require_relative('../db/sql_runner')
require_relative('./vet')
require_relative('./note')

class Animal

    attr_reader :id, :name, :date_of_birth, :vet_id, :animal_type, :animal_breed, :owner_name
    attr_accessor :treatment_note, :vet_id, :owner_phone_number

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @name = options['name']
        @date_of_birth = options['date_of_birth']
        @animal_type = options['animal_type']
        @animal_breed = options['animal_breed']
        @owner_name = options['owner_name']
        @owner_phone_number = options['owner_phone_number']
        @treatment_note = options['treatment_note']
        @vet_id = options['vet_id'].to_i
    end

    def save()
        sql = "INSERT INTO animals
        (
        name,
        date_of_birth,
        animal_type,
        animal_breed,
        owner_name,
        owner_phone_number,
        treatment_note,
        vet_id
        )
        VALUES
        (
        $1, $2, $3, $4, $5, $6, $7, $8
        )
        RETURNING id"
        values = [@name, @date_of_birth, @animal_type, @animal_breed, @owner_name, @owner_phone_number, @treatment_note, @vet_id]
        result = SqlRunner.run(sql, values)
        id = result.first['id']
        @id = id
    end

    def update()
        sql = "UPDATE animals
        SET
        (
            owner_name,
            owner_phone_number,
            treatment_note,
            vet_id
        )
        =
        (
            $1, $2, $3, $4
        )
        WHERE id = $5"
        values = [@owner_name, @owner_phone_number, @treatment_note, @vet_id, @id]
        SqlRunner.run(sql, values)
    end

    def vet()
        sql="SELECT * FROM vets where id = $1"
        values = [@vet_id]
        vet = SqlRunner.run(sql, values)
        result = vet.map{|vet| Vet.new(vet)}
        return result.first
    end

    def get_notes()
        sql ="SELECT * FROM notes where animal_id = $1 ORDER BY id DESC"
        values = [@id]
        notes = SqlRunner.run(sql,values)
        results = notes.map{|note| Note.new(note)}
        return results
    end


    def delete()
        sql = "DELETE FROM animals WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def self.find_by_id(id)
        sql = "SELECT * from animals
        WHERE id = $1"
        values = [id]
        animals = SqlRunner.run(sql, values)
        return Animal.map_item(animals)
    end

    def self.all()
        sql = "SELECT * FROM animals"
        animal_data = SqlRunner.run(sql)
        return Animal.map_items(animal_data)
    end

    def self.map_items(animal_data)
        result = animal_data.map { |animal| Animal.new( animal )}
        return result
    end

    def self.map_item(animal_data)
        result = Animal.map_items(animal_data)
        return result.first
    end

    def self.delete()
        sql = "DELETE * FROM animals;"
        SqlRunner.run(sql)
    end

    def type_breed
        return "#{@animal_type} (#{@animal_breed})"
    end

end