require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/wish_list.rb' )
require_relative( '../models/oil_worker.rb' )
require_relative( '../models/rig.rb' )
also_reload( '../models/*' )

get '/wish_lists' do
  @wish_lists = Wish_list.all
  erb ( :"wish_lists/index" )
end

get '/wish_lists/new' do
  @oil_workers = Oil_worker.all
  @rigs = Rig.all
  erb(:"wish_lists/new")
end

post '/wish_lists' do
  wish_list = Wish_list.new(params)
  wish_list.save
  redirect to("/wish_lists")
end

post '/wish_lists/:id/delete' do
  Wish_list.delete(params[:id])
  redirect to("/wish_lists")
end