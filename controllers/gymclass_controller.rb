require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/gymclass.rb')
also_reload('../models/*')

get '/gymclass' do
  erb(:"gymclasses/index")
end
