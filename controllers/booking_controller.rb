require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/booking.rb')
also_reload('../models/*')

get '/bookings' do
  @bookings = Booking.all()
  erb(:"bookings/index")
end

get '/bookings/new' do
  erb(:'bookings/new')
end
