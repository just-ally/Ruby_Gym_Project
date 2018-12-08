require_relative('../models/booking.rb')
require_relative('../models/gymclass.rb')
require_relative('../models/member.rb')
require_relative('../models/workout.rb')
require('pry')

Booking.delete_all()
Member.delete_all()
GymClass.delete_all()
Workout.delete_all()

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
workout1.save()

gymclass1 = GymClass.new({
  'workout_id' =>  workout1.id,
  'start_date' => '10-Dec-2018',
  'start_time' => '19.00',
  'capacity' => '5',
  'peak' => 'false'
})
gymclass1.save()

booking1 = Booking.new({
  'member_id' => member1.id,
  'gym_class_id' => gymclass1.id
})
booking1.save()

binding.pry
nil
