require_relative('../db/sql_runner.rb')

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




end
