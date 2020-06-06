get '/vets' do #index
    @vets = Vet.all
    erb( :"vets/index")
end

get '/vets/:id' do #show
    @vet = Vet.find_by_id(params[:id])
    erb( :"vets/show" )
end