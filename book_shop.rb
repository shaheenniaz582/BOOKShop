require( 'sinatra' )
require( 'sinatra/contrib/all' )

# This controller takes to home page(index)

get '/' do
  erb( :index)
end
