require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/book.rb' )
also_reload( '../models/*' )

# This controller takes to index of
# books(lists all books with complete information)
get '/books' do

   @books = Book.all() #call to function in book model.
  erb ( :"books/index" ) #index page of books.
end

# get '/zombies/:id' do
#   @zombie = Zombie.find(params['id'].to_i)
#   erb(:"zombies/show")
# end
