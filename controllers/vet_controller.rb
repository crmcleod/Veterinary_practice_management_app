require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/animal' )
require_relative('../models/vet')

also_reload( '../models/*' )


get '/vets' do #index
    @vets = Vet.all
    erb( :"vets/index")
end

get '/vets/:id' do #show
    @vet = Vet.find_by_id(params[:id])
    erb( :"vets/show" )
end