require_relative('../db/sql_runner.rb')

class Workout

  attr_reader :id
  attr_accessor :workout_name, :workout_type

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @workout_name = options['workout_name']
    @workout_type = options['workout_type']
  end





end
