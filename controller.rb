require('sinatra')
require('sinatra/contrib/all')
require_relative('models/animal')
require_relative('models/vet')
also_reload('./models/*')

get '/homepage' do
    erb( :homepage)
end

get '/admin' do
    erb( :admin)
end

get '/consultation' do
    erb( :consultation)
end

get '/animals' do #index
    @animals = Animal.all
    erb( :index)
end

get '/animals/new' do
    @vets=Vet.all
    erb(:animal_registration)
end

post '/animals' do
    @animal = Animal.new( params )
    @animal.save()
    erb( :registered)
end

get '/animals/:id' do #show
    @animal = Animal.find_by_id(params[:id])
    erb( :show )
end
