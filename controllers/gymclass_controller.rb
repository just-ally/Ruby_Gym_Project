require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/gymclass.rb')
also_reload('../models/*')

get '/gymclasses' do
  @gymclasses = GymClass.all()
  erb(:"gymclasses/index")
end

get '/gymclasses/:id/edit' do
  @gymclass = GymClass.find(params[:id].to_i)
  @workout = @gymclass.workout()
  erb(:"gymclasses/edit")
end

post '/gymclasses/:id' do
  @gymclass = GymClass.new(params)
  @gymclass.update()
  redirect to ("/gymclasses")
end
