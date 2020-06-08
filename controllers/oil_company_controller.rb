require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/flight.rb' )
require_relative( '../models/oil_worker.rb' )
require_relative( '../models/rig.rb' )
require_relative( '../models/oil_company.rb' )
also_reload( '../models/*' )

get '/oil_companys' do
  @oil_companys = Oil_company.all
  erb ( :"oil_companys/index" )
end

get '/oil_companys/new' do
  @oil_comapnys = Oil_company.all
  erb(:"oil_companys/new")
end

get '/rigs/:id' do
  @rig = Rig.find(params['id'].to_i)
  erb(:"rigs/show")
end

post '/oil_companys' do
  oil_company = Oil_company.new(params)
  oil_company.save
  redirect to("/oil_companys")
end

post '/oil_companys/:id/delete' do
  Oil_company.delete(params[:id])
  redirect to("/oil_companys")
end