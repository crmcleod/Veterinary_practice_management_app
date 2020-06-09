require_relative('../db/sql_runner')
require_relative('./vet')
require_relative('./note')
require_relative('./owner')
require_relative('./animal')

class Record

    attr_reader :id, :vet_id, :animal_id, :owner_id

    def initialize(options)
        @id = options['id'].to_i
        @vet_id = options['vet_id'].to_i
        @animal_id = options['animal_id'].to_i
        @owner_id = options['owner_id'].to_i
    end

    def save()
        sql = "INSERT INTO records
        (
        vet_id,
        animal_id,
        owner_id
        )
        VALUES
        (
        $1, $2, $3
        )
        returning id"
        values = [@vet_id, @animal_id, @owner_id]
        result = SqlRunner.run(sql, values)
        id = result.first['id']
        @id = id
    end
end