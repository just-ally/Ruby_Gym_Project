require_relative('../db/sql_runner.rb')
require_relative('./workout.rb')
require_relative('./member.rb')

class GymClass

  attr_reader :id
  attr_accessor :workout_id, :start_date, :start_time, :capacity, :peak

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @workout_id = options['workout_id'].to_i()
    @start_date = options['start_date']
    @start_time = options['start_time']
    @capacity = options['capacity'].to_i()
    @peak = options['peak']
  end

  #CREATE
  def save()
    sql = "INSERT INTO gym_classes (workout_id, start_date, start_time, capacity, peak) VALUES ($1, $2, $3, $4, $5) returning id"
    values = [@workout_id, @start_date, @start_time, @capacity, @peak]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i()
  end

  #READ all
  def self.all()
    sql = "SELECT * FROM gym_classes"
    gymclass_data = SqlRunner.run(sql)
    return GymClass.map_items(gymclass_data)
  end

  #READ by id
  def self.find(id)
    sql = "SELECT * FROM gym_classes WHERE id = $1"
    values = [id]
    gymclass_data = SqlRunner.run(sql, values)
    return GymClass.map_item(gymclass_data)
  end

  #UPDATE
  def update()
    sql = "UPDATE gym_classes SET (workout_id, start_date, start_time, capacity, peak) = ($1, $2, $3, $4, $5) WHERE id = $6"
    values = [@workout_id, @start_date, @start_time, @capacity, @peak, @id]
    SqlRunner.run(sql, values)
  end

  #DELETE all
  def self.delete_all()
    sql = "DELETE FROM gym_classes"
    SqlRunner.run(sql)
  end

  #DELETE by id
  def delete()
    sql = "DELETE FROM gym_classes WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  #Helper methods for mapping
  def self.map_items(gymclass_data)
    result = gymclass_data.map {|gymclass| GymClass.new(gymclass)}
    return result
  end

  def self.map_item(gymclass_data)
    result = GymClass.map_items(gymclass_data)
    return result.first
  end

  def workout()
    sql = "SELECT * FROM workouts WHERE workouts.id = $1"
    values = [@workout_id]
    workout_data = SqlRunner.run(sql, values)
    workout = Workout.map_item(workout_data)
    return workout
  end

  def members()
    sql = "SELECT members.* FROM members INNER JOIN bookings ON bookings.member_id = members.id WHERE bookings.gym_class_id = $1"
    values = [@id]
    member_data = SqlRunner.run(sql, values)
    return Member.map_items(member_data)
  end


end
