require_relative('../models/booking.rb')
require_relative('../models/gymclass.rb')
require_relative('../models/member.rb')
require('pry')

member1 = Member.new({
  'member_name' => 'Joe Bloggs',
  'email' => 'jb@mail.com',
  'member_since' => '01-03-2015',
  'membership_type' => 'standard'
})

gymclass1 = GymClass.new({
  'workout_id' =>  '4',
  'date' => '10-Dec-2018',
  'time' => '19.00',
  'capacity' => '5',
  'peak' => 'peak'
})

booking1 = Booking.new({
  'member_id' => '4',
  'gym_class_id' => '11'
})

binding.pry
nil
