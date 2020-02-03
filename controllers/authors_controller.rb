require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/author.rb' )
also_reload( '../models/*' )

get '/authors' do
  @authors = Author.all()
  erb ( :"authors/index" )
end
