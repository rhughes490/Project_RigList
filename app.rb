require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/rig_controller')
require_relative('controllers/oil_worker_controller')
require_relative('controllers/flight_controller')
require_relative('controllers/wish_list_controller')
require_relative('controllers/oil_company_controller')

get '/' do
  erb( :index )
end

