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

  # CREATE
  def save()
    sql = "INSERT INTO members (member_name, email, premium_membership)
    VALUES ($1, $2, $3) returning id"
    values = [@member_name, @email, @premium_membership]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i()
  end

  # READ all
  def self.all()
    sql = "SELECT * FROM members"
    member_data = SqlRunner.run(sql)
    return Member.map_items(member_data)
  end

  #READ by id
  def self.find(id)
    sql = "SELECT * FROM members WHERE id = $1"
    values = [id]
    member_data = SqlRunner.run(sql, values)
    return Member.map_item(member_data)
  end

  #UPDATE
  def update()
    sql = "UPDATE members SET (member_name, email, premium_membership)
    = ($1, $2, $3) WHERE id = $4"
    values = [@member_name, @email, @premium_membership, @id]
    SqlRunner.run(sql, values)
  end

  #DELETE all
  def self.delete_all()
    sql = "DELETE FROM members"
    SqlRunner.run(sql)
  end

  #DELETE by id
  def delete()
    sql = "DELETE FROM members WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  #Helper methods for mapping
  def self.map_items(member_data)
    result = member_data.map {|member| Member.new(member)}
    return result
  end

  def self.map_item(member_data)
    result = Member.map_items(member_data)
    return result.first
  end



end
