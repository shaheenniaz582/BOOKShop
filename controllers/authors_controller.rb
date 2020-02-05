require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry')
require_relative( '../models/author.rb' )
also_reload( '../models/*' )

get '/authors' do
  @authors = Author.all()
  erb ( :"authors/index" )
end

# gets the new author form
get '/authors/new' do
  erb(:"authors/new")
end
# adds new author in db
post '/authors' do
  @author = Author.new(params).save
  redirect to '/authors'
end

# gets info about a particular author
get '/authors/:id' do
  # will return the id and with this id find function will
  #return particular author wth passed id
  @author = Author.find(params[:id]) # this returned author object will be paased to show page
  erb(:"authors/show")
end

get '/authors/:id/edit' do # edit
  @author = Author.find(params[:id])
  erb( :"authors/edit" )
end

post '/authors/:id' do # update
  @updated_author = Author.new( params )
  @updated_author.update()
  redirect to '/authors'
end

post '/authors/:id/delete' do #DELETE
  @author =Author.find(params[:id])
  @author.delete
  redirect to '/authors'
end
