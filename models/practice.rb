require_relative('../db/sql_runner')
require_relative('./vet')
require_relative('./note')
require_relative('./owner')
require_relative('./animal')

class Practice

    attr_reader :id, :vet_id, :animal_id, :owner_id

    def initialize(options)
        @id = options['id'].to_i
        @vet_id = options['vet_id'].to_i
        @animal_id = options['animal_id'].to_i
        @owner_id = options['owner_id'].to_i
    end

end