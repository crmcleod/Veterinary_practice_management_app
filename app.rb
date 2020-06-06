require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/animals_controller')
require_relative('controllers/admin_controller')
require_relative('controllers/consultation_controller')
require_relative('controllers/vet_controller')

get '/' do
    erb ( :index )
end