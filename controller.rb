require('sinatra')
require('sinatra/contrib/all')
require_relative('models/animal')
require_relative('models/vet')
also_reload('./models/*')

get '/homepage' do
    erb( :homepage)
end

get '/animals' do
    @animals = Animal.all
    erb( :index)
end