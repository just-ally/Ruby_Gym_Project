require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/booking_controller')
require_relative('controllers/gymclass_controller')
require_relative('controllers/member_controller')

get '/' do
  erb(:index)
end
