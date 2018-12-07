require('minitest/autorun')
require('minitest/rg')
require_relative('../models/gymclass.rb')

class GymClassTest < MiniTest::Test

  def setup
    options1 = {
      'workout_id' =>  '4',
      'start_date' => '10-Dec-2018',
      'start_time' => '19.00',
      'capacity' => '5',
      'peak' => 'true'
    }
    @gymclass1 = GymClass.new(options1)
  end

  def test_gymclass_has_id()
    assert_equal( 4, @gymclass1.workout_id() )
  end

  def test_gymclass_has_date()
    assert_equal( '10-Dec-2018', @gymclass1.start_date() )
  end

  def test_gymclass_has_time()
    assert_equal( '19.00', @gymclass1.start_time() )
  end

  def test_gymclass_has_capacity()
    assert_equal( 5, @gymclass1.capacity() )
  end

  def test_gymclass_has_peak_value()
    assert_equal( 'true', @gymclass1.peak() )
  end


end
