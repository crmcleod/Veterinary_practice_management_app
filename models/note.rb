require_relative('../db/sql_runner')
require_relative('./animal')

class Note

    attr_reader :id, :animal_id
    attr_accessor :treatment_notes

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @treatment_notes = options['treatment_notes']
        @animal_id = options['animal_id'].to_i
    end

    
end