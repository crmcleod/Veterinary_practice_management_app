require_relative('../db/sql_runner')

class Vet

    attr_reader :id, :name

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @name = options['name']
    end

    def save()
        sql = "INSERT INTO vets
        (name) VALUES ($1)
        RETURNING id"
        values = [@name]
        result = SqlRunner.run(sql, values)
        id = result.first['id']
        @id = id.to_i
    end

    def self.find_by_id(id)
        sql = "SELECT * from vets
        WHERE id = $1"
        values = [id]
        vets = SqlRunner.run(sql, values)
        return Vet.map_item(vets)
    end

    def self.all()
        sql = "SELECT * FROM vets"
        vet_data = SqlRunner.run(sql)
        return Vet.map_items(vet_data)
    end

    def update()
        sql = "UPDATE vets
        SET vet_name = $1 WHERE id = $2"
        values = [@name, @id]
        SqlRunner.run(sql, values)
    end

    def self.map_items(vet_data)
        result = vet_data.map { |vet| Vet.new( vet )}
        return result
    end

    def self.map_item(vet_data)
        result = Vet.map_items(vet_data)
        return result.first
    end

end