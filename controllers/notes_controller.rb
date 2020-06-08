require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/animal' )
require_relative('../models/vet')
require_relative('../models/note')

also_reload( '../models/*' )

get '/notes' do
    "blah blah"
    @notes = Note.all
    erb(:"notes/index")
end


get '/notes/new' do
    @animal = Animal.all
    erb(:"notes/new")
end

get '/notes/:id' do
    @note = Note.find_by_id(params[:id])
    erb( :"notes/show")
end

post '/notes' do
    @note = Note.new( params )
    @note.save()
    redirect to "/animals/#{@note.animal_id}"
end