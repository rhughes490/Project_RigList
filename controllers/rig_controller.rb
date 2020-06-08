require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/rig.rb' )
require_relative( '../models/oil_company.rb' )
also_reload( '../models/*' )

get '/rigs' do
  @rigs = Rig.all()
  erb ( :"rigs/index" )
end

get '/rigs/new' do
  @rigs = Rig.all()
  @oil_companys = Oil_company.all()
  erb ( :"rigs/new" )
end

get '/rigs/:id' do
  @rig = Rig.find(params['id'].to_i)
  erb(:"rigs/show")
end

post '/rigs' do
  rigs = Rig.new(params).save
  redirect to '/rigs'
end