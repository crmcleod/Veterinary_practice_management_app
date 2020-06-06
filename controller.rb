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

get '/animals' do
    @animals = Animal.all
    erb( :index)
end

get '/animals/:id' do
    @animal = Animal.find_by_id(params[:id])
    erb( :show )
end
