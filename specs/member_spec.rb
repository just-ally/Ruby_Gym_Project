require('minitest/autorun')
require('minitest/rg')
require_relative('../models/member.rb')

class MemberTest < MiniTest::Test

  def setup
    options1 = {
      'member_name' => 'Joe Bloggs',
      'email' => 'jb@mail.com',
      'premium_membership' => 'false'
    }
    @member1 = Member.new(options1)
  end

  def test_member_has_name()
    assert_equal( 'Joe Bloggs', @member1.member_name() )
  end

  def test_member_has_email()
    assert_equal( 'jb@mail.com', @member1.email() )
  end

  # removed this property - might add back in as date
  # def test_member_has_member_since_data()
  #   assert_equal( '01-03-2015', @member1.member_since() )
  # end

  def test_member_has_type()
    assert_equal( 'false', @member1.premium_membership() )
  end

end
