require('minitest/autorun')
require('minitest/rg')
require_relative('../models/booking.rb')

class BookingTest < MiniTest::Test

  def setup
    options1 = {
      'member_id' => '4',
      'gym_class_id' => '11'
    }
    @booking1 = Booking.new(options1)
  end

  def test_booking_has_member_id()
    assert_equal( 4, @booking1.member_id() )
  end

  def test_booking_has_gym_class_id()
    assert_equal( 11, @booking1.gym_class_id() )
  end



end 
