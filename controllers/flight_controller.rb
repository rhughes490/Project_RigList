require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/flight.rb' )
require_relative( '../models/oil_worker.rb' )
require_relative( '../models/rig.rb' )
also_reload( '../models/*' )

get '/flights' do
  @flights = Flight.all
  erb ( :"flights/index" )
end

get '/flights/new' do
  @oil_workers = Oil_worker.all
  @rigs = Rig.all
  erb(:"flights/new")
end

post '/flights' do
  flight = Flight.new(params)
  flight.save
  redirect to("/flights")
end

post '/flights/:id/delete' do
  Flight.delete(params[:id])
  redirect to("/flights")
end