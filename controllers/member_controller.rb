require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/member.rb')
require_relative('../models/workout.rb')
also_reload('../models/*')

get '/members' do
  @members = Member.all()
  erb(:"members/index")
end

get '/members/:id' do
  @member = Member.find(params['id'].to_i)
  @workouts = @member.workouts()
  @gymclasses = @member.gymclasses()
  erb(:"members/show")
end

get '/members/new' do
  erb(:"members/new")
end
