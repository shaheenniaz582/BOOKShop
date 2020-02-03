require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/books_controller.rb')
require_relative('controllers/publishers_controller.rb')
require_relative('controllers/authors_controller.rb')

# This controller takes to home page(index)

get '/' do
  erb( :index)
end
