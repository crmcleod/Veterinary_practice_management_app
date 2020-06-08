require_relative('../db/sql_runner')
require_relative('./animal')

class Owner

    attr_reader :id, :name

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @name = options['name']
        @vet_registration = options['vet_registration']
    end

    def save()
        sql = "INSERT INTO owners
        (
        name,
        vet_registration
        )
        VALUES
        (
        $1, $2
        )
        RETURNING id"
        values = [@name, @vet_registration]
        result = SqlRunner.run(sql, values)
        id = result.first['id']
        @id = id.to_i
    end