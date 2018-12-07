require_relative('../db/sql_runner.rb')

class Member

  attr_reader :id
  attr_accessor :member_name, :email, :member_since, :membership_type

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @member_name = options['member_name']
    @email = options['email']
    @member_since = options['member_since']
    @membership_type = options['membership_type']
  end





end
