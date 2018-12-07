require_relative('../db/sql_runner.rb')

class Member

  attr_reader :id
  attr_accessor :member_name, :email, :premium_membership

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @member_name = options['member_name']
    @email = options['email']
    @premium_membership = options['premium_membership']
  end





end
