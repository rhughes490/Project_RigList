require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/rig_controller')
require_relative('controllers/oil_worker_controller')
require_relative('controllers/flight_controller')

get '/' do
  erb( :index )
end

