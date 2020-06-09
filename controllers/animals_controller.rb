require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/animal' )
require_relative('../models/vet')
require_relative('../models/note')

also_reload( '../models/*' )

get '/animals' do #index
    @animals = Animal.all
    erb( :"animals/index")
end

get '/animals/new' do
    @vets=Vet.all
    erb(:"animals/new")
end


get '/animals/:id' do #show
    @animal = Animal.find_by_id(params[:id])
    @notes = @animal.get_notes
    erb( :"animals/show" )
end

get '/animals/:id/edit' do
    @vets = Vet.all
    @animal = Animal.find_by_id(params['id'])
    erb(:"animals/edit")
end

get '/animals/:id/add_notes' do
    @date = Note.date()
    @animal = Animal.find_by_id(params['id'])
    erb(:"notes/new")
end

get '/animals/:id/edit_vet' do
    @vets= Vet.all()
    @animal = Animal.find_by_id(params['id'])
    @vet_id = @animal.vet_id
    erb(:"vets/edit")
end

post '/animals/:id/edit_vet' do
    animal = Animal.new(params)
    @animal = Animal.new(params)
    @vet = @animal.vet
    vet_id = @vet.id
    animal.update
    redirect to "/vets"
end

post '/animals/:id' do
     animal = Animal.new(params)
     animal.update
     redirect to "/animals/#{params['id']}"
end

post '/animals' do
    @animal = Animal.new( params )
    @animal.save()
    erb( :"animals/create" )
end

post '/animals/:id/delete' do
    animal = Animal.find_by_id(params['id'])
    animal.delete
    redirect to '/animals'
end


