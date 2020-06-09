# require_relative('../db/sql_runner')
# require_relative('./vet')
# require_relative('./note')
# require_relative('./owner')
# require_relative('./animal')

# class Record

#     attr_reader :id, :vet_id, :animal_id

#     def initialize(options)
#         @id = options['id'].to_i
#         @vet_id = options['vet_id'].to_i
#         @animal_id = options['animal_id'].to_i
#     end

#     def save()
#         sql = "INSERT INTO records
#         (
#         vet_id,
#         animal_id,
#         owner_id
#         )
#         VALUES
#         (
#         $1, $2
#         )
#         returning id"
#         values = [@vet_id, @animal_id
#         result = SqlRunner.run(sql, values)
#         id = result.first['id']
#         @id = id
#     end

#     def self.all()
#         sql = "SELECT * FROM records"
#         results = SqlRunner.run(sql)
#         return results.map { |record| Record.new(record)}
#     end

#     def animal()
#         sql = "SELECT * FROM animals
#         WHERE id = $1"
#         values = [@animal_id]
#         results = SqlRunner.run(sql, values)
#         return Animal.new( results.first )
#     end

# end