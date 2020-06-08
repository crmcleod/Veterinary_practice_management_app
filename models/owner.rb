require_relative('../db/sql_runner')
require_relative('./animal')

class Owner

    attr_reader :id, :name
    attr_accessor :vet_registration, :contact_number

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @name = options['name']
        @vet_registration = options['vet_registration']
        @contact_number = options['contact_number']
    end

    def save()
        sql = "INSERT INTO owners
        (
        name,
        vet_registration,
        contact_number
        )
        VALUES
        (
        $1, $2, $3
        )
        RETURNING id"
        values = [@name, @vet_registration, @contact_number]
        result = SqlRunner.run(sql, values)
        id = result.first['id']
        @id = id.to_i
    end

    def update()
        sql = "UPDATE owners
        SET
        (
        vet_registration,
        contact_number
        )
        VALUES
        (
        $1, $2
        )
        WHERE id = $3"
        values = [@vet_registration, @contact_number]
        SqlRunner.run(sql, values)
    end


end