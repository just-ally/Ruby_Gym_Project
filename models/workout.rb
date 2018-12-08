require_relative('../db/sql_runner.rb')

class Workout

  attr_reader :id
  attr_accessor :workout_name, :workout_type

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @workout_name = options['workout_name']
    @workout_type = options['workout_type']
  end

  #CREATE
  def save()
    sql = "INSERT INTO workouts (workout_name, workout_type) VALUES ($1, $2) returning id"
    values = [@workout_name, @workout_type]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i()
  end

  #READ all
  def self.all()
    sql = "SELECT * FROM workouts"
    workout_data = SqlRunner.run(sql)
    return Workout.map_items(workout_data)
  end

  #READ by id
  def self.find(id)
    sql = "SELECT * FROM workouts WHERE id = $1"
    values = [id]
    workout_data = SqlRunner.run(sql, values)
    return Workout.map_item(workout_data)
  end

  #UPDATE
  def update()
    sql = "UPDATE workouts SET (workout_name, workout_type) = ($1, $2) WHERE id = $3"
    values = [@workout_name, @workout_type, @id]
    SqlRunner.run(sql, values)
  end

  #DELETE all
  def self.delete_all()
    sql = "DELETE FROM workouts"
    SqlRunner.run(sql)
  end

  #DELETE by id
  def delete()
    sql = "DELETE FROM workouts WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  #Helper methods for mapping
  def self.map_items(workout_data)
    result = workout_data.map {|workout| Workout.new(workout)}
    return result
  end

  def self.map_item(workout_data)
    result = Workout.map_items(workout_data)
    return result.first
  end



end
