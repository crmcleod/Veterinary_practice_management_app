require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/animal' )
require_relative('../models/vet')
require_relative('../models/note')

also_reload( '../models/*' )

get '/notes' do
    @notes = Note.all
    erb(:"notes/index")
end