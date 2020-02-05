require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/publisher.rb' )
also_reload( '../models/*' )

get '/publishers' do
  @publishers = Publisher.all()
  erb ( :"publishers/index")
end

# gets the new publisher form
get '/publishers/new' do
  erb(:"publishers/new")
end
# adds new publisher in db
post '/publishers' do
  @publisher = Publisher.new(params).save
  redirect to '/publishers'
end

# gets info about a particular publisher
get '/publishers/:id' do
  @publisher = Publisher.find(params[:id]) # this returned author object will be paased to show page
  erb(:"publishers/show")
end

get '/publishers/:id/edit' do # edit
  @publisher = Publisher.find(params[:id])
  erb( :"publishers/edit" )
end

post '/publishers/:id' do # update
  @publisher = Publisher.new( params )
  @publisher.update()
  redirect to '/publishers'
end

post '/publishers/:id/delete' do #DELETE
  @publisher =Publisher.find(params[:id])
  @publisher.delete
  redirect to '/publishers'
end
