require_relative('../db/sql_runner.rb')

class GymClass

  attr_reader :id
  attr_accessor :workout_id, :date, :time, :capacity, :peak

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @workout_id = options['workout_id'].to_i()
    @date = options['date']
    @time = options['time']
    @capacity = options['capacity'].to_i()
    @peak = options['peak']
  end




end
