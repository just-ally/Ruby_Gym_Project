require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/gymclass.rb')
also_reload('../models/*')

get '/gymclass' do
  @gymclasses = GymClass.all()
  erb(:"gymclasses/index")
end




# @workouts = []
# for gymclass in @gymclasses
#   @workouts << gymclass.workout
# end
