require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/animal')
require_relative('../models/vet')
also_reload('../models/*')

get '/admin' do
    erb(:"admin/index")
end