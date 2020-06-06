require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/animal')
require_relative('../models/vet')
also_reload('../models/*')

get '/consultation' do
    erb (:"consultation/index")
end