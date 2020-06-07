require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/rig.rb' )
also_reload( '../models/*' )

get '/rigs' do
  @rigs = Rig.all()
  erb ( :"rigs/index" )
end

get '/rigs/:id' do
  @Rig = Rig.find(params['id'].to_i)
  erb(:"rigs/show")
end
