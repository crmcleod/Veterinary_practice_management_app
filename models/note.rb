require_relative('../db/sql_runner')
require_relative('./animal')

class Note

    attr_reader :id, :animal_id
    attr_accessor :treatment_notes

end