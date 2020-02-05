require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/book.rb' )
require_relative('../models/author.rb')
require_relative('../models/publisher.rb')
require_relative('../models/gener.rb')
also_reload( '../models/*' )
require('pry')

# This controller takes to index of
# books(lists all books with complete information)
get '/books' do
  @books = Book.all() #call to function in book model.
  erb( :"books/index" ) #index page of books.
end

# gets the new book form
get '/books/new' do
  @authors = Author.all()
  @publishers = Publisher.all()
  @gener = Gener.all()
  erb(:"books/new")
end
# adds new book in db
post '/books' do
  Book.new(params).save
  redirect to '/books'
end

# gets info about a particular book
get '/books/:id' do
  # will return the id and with this id find function will
  #return particular book wth passed id
  @book = Book.find(params[:id]) # this returned book object will be paased to show page
  erb(:"books/show")
end

get '/books/:id/edit' do # edit
  @book = Book.find(params[:id])
  @authors = Author.all()
  @publishers = Publisher.all()
  @gener = Gener.all()
  erb( :"books/edit" )
end

post '/books/:id' do # update
  @updated_book = Book.new( params )
  @updated_book.update()
  redirect to '/books'
end

post '/books/:id/delete' do #DELETE
  @book = Book.find(params[:id])
  @book.delete
  redirect to '/books'
end
