require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/booking_controller.rb')
require_relative('controllers/gymclass_controller.rb')
require_relative('controllers/member_controller.rb')

get '/' do
  erb(:index)
end
