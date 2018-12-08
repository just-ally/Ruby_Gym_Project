require_relative('../models/booking.rb')
require_relative('../models/gymclass.rb')
require_relative('../models/member.rb')
require_relative('../models/workout.rb')
require('pry')

Member.delete_all()

member1 = Member.new({
  'member_name' => 'Sylvester Stallone',
  'email' => 'sly@mail.com',
  'premium_membership' => 'true'
})
member1.save()

member2 = Member.new({
  'member_name' => 'Dolph Lundgren',
  'email' => 'DL@mail.com',
  'premium_membership' => 'false'
})
member2.save()

workout1 = Workout.new({
  'workout_name' => 'Boxfit',
  'workout_type' => 'cardio'
})

gymclass1 = GymClass.new({
  'workout_id' =>  '4',
  'start_date' => '10-Dec-2018',
  'start_time' => '19.00',
  'capacity' => '5',
  'peak' => 'false'
})

booking1 = Booking.new({
  'member_id' => '4',
  'gym_class_id' => '11'
})

binding.pry
nil
