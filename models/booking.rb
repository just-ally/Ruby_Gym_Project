require_relative('../db/sql_runner.rb')
require_relative('./workout.rb')
require_relative('./member.rb')

class Booking

  attr_reader :id
  attr_accessor :member_id, :gym_class_id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @member_id = options['member_id'].to_i()
    @gym_class_id = options['gym_class_id'].to_i()
  end

  #CREATE
  def save()
    sql = "INSERT INTO bookings (member_id, gym_class_id) VALUES ($1, $2) returning id"
    values = [@member_id, @gym_class_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i()
  end

  #READ all
  def self.all()
    sql = "SELECT * FROM bookings ORDER BY member_id ASC"
    booking_data = SqlRunner.run(sql)
    return Booking.map_items(booking_data)
  end

  #READ by id
  def self.find(id)
    sql = "SELECT * FROM bookings WHERE id = $1"
    values = [id]
    booking_data = SqlRunner.run(sql, values)
    return Booking.map_item(booking_data)
  end

  #DELETE all
  def self.delete_all()
    sql = "DELETE FROM bookings"
    SqlRunner.run(sql)
  end

  #DELETE by id
  def delete()
    sql = "DELETE FROM bookings WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  #Helper methods for mapping
  def self.map_items(booking_data)
    result = booking_data.map { |booking| Booking.new(booking) }
    return result
  end

  def self.map_item(booking_data)
    result = Booking.map_items(booking_data)
    return result.first
  end

  #SHOW WORKOUT
  def workout()
    sql = "SELECT workouts.* FROM workouts
    INNER JOIN gym_classes
    ON workouts.id = gym_classes.workout_id
    WHERE gym_classes.id = $1"
    values = [@gym_class_id]
    workout_data = SqlRunner.run(sql, values)
    workout = Workout.map_item(workout_data)
    return workout
  end

  #SHOW MEMBER
  def member()
    sql = "SELECT * FROM members WHERE members.id = $1"
    values = [@member_id]
    member_data = SqlRunner.run(sql, values)
    member = Member.map_item(member_data)
    return member
  end

  #SHOW GYMCLASS
  def gymclass()
    sql = "SELECT * FROM gym_classes WHERE gym_classes.id = $1"
    values = [@gym_class_id]
    gymclass_data = SqlRunner.run(sql, values)
    gymclass = GymClass.map_item(gymclass_data)
    return gymclass
  end


end
