require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('./controllers/animals_controller')
require_relative('./controllers/vet_controller')
require_relative('./controllers/notes_controller')

require_relative('./models/animal.rb')
require_relative('./models/note.rb')
require_relative('./models/vet.rb')

get '/' do
    redirect to("/animals")
end