require('minitest/autorun')
require('minitest/rg')
require_relative('../models/workout.rb')

class WorkoutTest < MiniTest::Test

  def setup
    options1 = {
      'workout_name' => 'Boxfit',
      'workout_type' => 'cardio'
    }
    @workout1 = Workout.new(options1)
  end

  def test_workout_has_name()
    assert_equal( 'Boxfit', @workout1.workout_name() )
  end

  def test_workout_has_type()
    assert_equal('cardio', @workout1.workout_type())
  end

end
