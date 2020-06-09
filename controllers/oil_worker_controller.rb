require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/oil_worker.rb' )
also_reload( '../models/*' )

get '/oil_workers' do
  @oil_workers = Oil_worker.all()
  erb ( :"oil_workers/index" )
end

get '/oil_workers/new' do
  erb(:"oil_workers/new")
end

post '/oil_workers' do
oil_worker = Oil_worker.new(params).save
redirect to "/oil_workers"
end

get '/oil_workers/:id' do
  @oil_worker = Oil_worker.find(params['id'].to_i)
  erb( :"oil_workers/show" )
end

get '/oil_workers/:id/wish_list' do
  @oil_worker = Oil_worker.find(params['id'].to_i)
  erb( :"oil_workers/wish_list" )
end
