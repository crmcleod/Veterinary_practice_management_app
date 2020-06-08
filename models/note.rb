require_relative('../db/sql_runner')
require_relative('./animal')

class Note

    attr_reader :id
    attr_accessor :treatment_notes, :animal_id

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @treatment_note = options['treatment_note']
        @animal_id = options['animal_id'].to_i
    end

    def save()
        sql = "INSERT INTO notes
        (treatment_note,
        animal_id
        )
        VALUES
        ($1, $2
        )
        RETURNING id"
        values = [@treament_note, @animal_id]
        result = SqlRunner.run(sql, values)
        id = result.first['id']
        @id = id
    end

    def update()
        sql = "UPDATE notes
        SET treatment_note = $1 WHERE id = $2"
        values = [@treatment_note, @id]
        SqlRunner.run(sql, values)
    end

end