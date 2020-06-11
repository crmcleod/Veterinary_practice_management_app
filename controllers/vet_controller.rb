require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/animal' )
require_relative('../models/vet')

also_reload( '../models/*' )


get '/vets' do #index
    @vets = Vet.all
    erb( :"vets/index")
end

get '/vets/new' do
    @animal=Animal.all
    erb(:"vets/new")
end

get '/vets/:id' do #show
    @vet = Vet.find_by_id(params[:id])
    @animals = @vet.animals
    erb( :"vets/show" )
end

get '/vets/:id/edit' do
    @vet = Vet.find_by_id(params['id'])
    @animal = @vet.animals
    erb(:"vets/edit")
end

post '/vets/:id' do
    vet = Vet.new(params)
    vet.update
    redirect to "/vets/#{params['id']}"
end

post '/vets' do
    @vet = Vet.new(params)
    @vet.save()
    erb( :"vets/create")
end

post '/vets/:id/delete' do
    vet = Vet.find_by_id(params['id'])
    @animal = Animal.all
    @vets = Vet.all
    @vet = vet
    @animals = vet.animals
        if vet.count_animals == 0
            vet.delete
            redirect to '/vets'
        else
            erb(:"vets/delete")
        end
end