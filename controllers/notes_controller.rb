require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/animal' )
require_relative('../models/vet')
require_relative('../models/note')

also_reload( '../models/*' )

get '/notes/new' do
    @animal = Animal.all
    erb(:"notes/new")
end

post '/notes' do
    @note = Note.new( params )
    @note.save()
    redirect to "/animals/#{@note.animal_id}"
end