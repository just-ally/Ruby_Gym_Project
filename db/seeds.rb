require_relative('../models/booking.rb')
require_relative('../models/gymclass.rb')
require_relative('../models/member.rb')
require_relative('../models/workout.rb')
require('pry')

Booking.delete_all()
Member.delete_all()
GymClass.delete_all()
Workout.delete_all()

member1 = Member.new({ 'member_name' => 'Sylvester Stallone', 'email' => 'sly@mail.com', 'premium_membership' => 'true' })
member1.save()

member2 = Member.new({ 'member_name' => 'Dolph Lundgren', 'email' => 'DL@mail.com', 'premium_membership' => 'false' })
member2.save()

member3 = Member.new({ 'member_name' => 'Jason Statham', 'email' => 'jay@mail.com', 'premium_membership' => 'false' })
member3.save()

member4 = Member.new({ 'member_name' => 'Jet Li', 'email' => 'jet@mail.com', 'premium_membership' => 'true' })
member4.save()

member5 = Member.new({ 'member_name' => 'Terry Crews', 'email' => 'terrylovesyoghurt@mail.com', 'premium_membership' => 'true' })
member5.save()

member6 = Member.new({ 'member_name' => 'Mickey Rourke', 'email' => 'mickey@mail.com', 'premium_membership' => 'false' })
member6.save()

member7 = Member.new({ 'member_name' => 'Randy Couture', 'email' => 'randy_randy@mail.com', 'premium_membership' => 'false' })
member7.save()

member8 = Member.new({ 'member_name' => 'Steve Austin', 'email' => 'stone_cold@mail.com', 'premium_membership' => 'true' })
member8.save()



workout1 = Workout.new({ 'workout_name' => 'Boxfit', 'workout_type' => 'Cardio' })
workout1.save()

workout2 = Workout.new({ 'workout_name' => 'Spin', 'workout_type' => 'High Intensity' })
workout2.save()

workout3 = Workout.new({ 'workout_name' => 'Yoga', 'workout_type' => 'Mind & Body' })
workout3.save()

workout4 = Workout.new({ 'workout_name' => 'Induction', 'workout_type' => 'Introductory' })
workout4.save()

workout5 = Workout.new({ 'workout_name' => 'Circuits', 'workout_type' => 'Cardio' })
workout5.save()

workout6 = Workout.new({ 'workout_name' => 'Pilates', 'workout_type' => 'Mind & Body' })
workout6.save()

workout7 = Workout.new({ 'workout_name' => 'Absolute Abs', 'workout_type' => 'Muscle Tone' })
workout7.save()

workout8 = Workout.new({ 'workout_name' => 'Body Pump', 'workout_type' => 'Muscle Tone' })
workout8.save()



gymclass1 = GymClass.new({ 'workout_id' =>  workout1.id, 'start_date' => '14-Dec-2018', 'start_time' => '19.00', 'capacity' => '5', 'peak' => 'false' })
gymclass1.save()

gymclass2 = GymClass.new({ 'workout_id' =>  workout2.id, 'start_date' => '15-Dec-2018', 'start_time' => '16.00', 'capacity' => '12', 'peak' => 'true' })
gymclass2.save()

gymclass3 = GymClass.new({ 'workout_id' =>  workout3.id, 'start_date' => '16-Dec-2018', 'start_time' => '12.00', 'capacity' => '3', 'peak' => 'true' })
gymclass3.save()

gymclass4 = GymClass.new({ 'workout_id' =>  workout4.id, 'start_date' => '17-Dec-2018', 'start_time' => '20.00', 'capacity' => '1', 'peak' => 'false' })
gymclass4.save()

gymclass5 = GymClass.new({ 'workout_id' =>  workout5.id, 'start_date' => '18-Dec-2018', 'start_time' => '14.00', 'capacity' => '7', 'peak' => 'true' })
gymclass5.save()

gymclass6 = GymClass.new({ 'workout_id' =>  workout6.id, 'start_date' => '18-Dec-2018', 'start_time' => '19.30', 'capacity' => '4', 'peak' => 'false' })
gymclass6.save()

gymclass7 = GymClass.new({ 'workout_id' =>  workout2.id, 'start_date' => '20-Dec-2018', 'start_time' => '10.00', 'capacity' => '12', 'peak' => 'true' })
gymclass7.save()

gymclass8 = GymClass.new({ 'workout_id' =>  workout5.id, 'start_date' => '20-Dec-2018', 'start_time' => '17.30', 'capacity' => '5', 'peak' => 'true' })
gymclass8.save()

gymclass9 = GymClass.new({ 'workout_id' =>  workout4.id, 'start_date' => '20-Dec-2018', 'start_time' => '21.00', 'capacity' => '1', 'peak' => 'false' })
gymclass9.save()

gymclass10 = GymClass.new({ 'workout_id' =>  workout2.id, 'start_date' => '21-Dec-2018', 'start_time' => '20.30', 'capacity' => '5', 'peak' => 'false' })
gymclass10.save()

gymclass11 = GymClass.new({ 'workout_id' =>  workout1.id, 'start_date' => '22-Dec-2018', 'start_time' => '15.30', 'capacity' => '6', 'peak' => 'true' })
gymclass11.save()



booking1 = Booking.new({ 'member_id' => member1.id, 'gym_class_id' => gymclass1.id })
booking1.save()

booking2 = Booking.new({ 'member_id' => member2.id, 'gym_class_id' => gymclass1.id })
booking2.save()

booking3 = Booking.new({ 'member_id' => member3.id, 'gym_class_id' => gymclass2.id })
booking3.save()

booking4 = Booking.new({ 'member_id' => member4.id, 'gym_class_id' => gymclass5.id })
booking4.save()

booking5 = Booking.new({ 'member_id' => member5.id, 'gym_class_id' => gymclass4.id })
booking5.save()

booking6 = Booking.new({ 'member_id' => member6.id, 'gym_class_id' => gymclass6.id })
booking6.save()

booking7 = Booking.new({ 'member_id' => member7.id, 'gym_class_id' => gymclass11.id })
booking7.save()

booking8 = Booking.new({ 'member_id' => member2.id, 'gym_class_id' => gymclass8.id })
booking8.save()

booking9 = Booking.new({ 'member_id' => member5.id, 'gym_class_id' => gymclass6.id })
booking9.save()

booking10 = Booking.new({ 'member_id' => member6.id, 'gym_class_id' => gymclass3.id })
booking10.save()

booking11 = Booking.new({ 'member_id' => member3.id, 'gym_class_id' => gymclass3.id })
booking11.save()

booking12 = Booking.new({ 'member_id' => member7.id, 'gym_class_id' => gymclass4.id })
booking12.save()

booking13 = Booking.new({ 'member_id' => member6.id, 'gym_class_id' => gymclass8.id })
booking13.save()

booking14 = Booking.new({ 'member_id' => member2.id, 'gym_class_id' => gymclass7.id })
booking14.save()

booking15 = Booking.new({ 'member_id' => member8.id, 'gym_class_id' => gymclass11.id })
booking15.save()

booking16 = Booking.new({ 'member_id' => member2.id, 'gym_class_id' => gymclass10.id })
booking16.save()

binding.pry
nil
