require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/gymclass.rb')
also_reload('../models/*')

get '/gymclasses' do
  @gymclasses = GymClass.all()
  erb(:"gymclasses/index")
end

get '/gymclasses/new' do
  erb(:"gymclasses/new")
end

post '/gymclasses' do
  gymclass = GymClass.new(params)
  gymclass.save()
  redirect to ("/gymclasses")
end

get '/gymclasses/:id' do
  @gymclass = GymClass.find(params['id'].to_i)
  @workout = @gymclass.workout()
  @members = @gymclass.members()
  erb(:"gymclasses/show")
end

post '/gymclasses/:id/delete' do
  @gymclass = GymClass.find(params['id'])
  @gymclass.delete
  redirect to ("/gymclasses")
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
