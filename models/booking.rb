require_relative('../db/sql_runner.rb')

class Booking

  attr_reader :id
  attr_accessor :member_id, :gym_class_id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @member_id = options['member_id'].to_i()
    @gym_class_id = options['gym_class_id'].to_i()
  end

  #CREATE
  def save()
    sql = "INSERT INTO bookings (member_id, gym_class_id) VALUES ($1, $2) returning id"
    values = [@member_id, @gym_class_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i()
  end

  #READ all
  def self.all()
    sql = "SELECT * FROM bookings"
    booking_data = SqlRunner.run(sql)
    return Booking.map_items(booking_data)
  end

  #READ by id
  def self.find(id)
    sql = "SELECT * FROM bookings WHERE id = $1"
    values = [id]
    booking_data = SqlRunner.run(sql, values)
    return Booking.map_item(booking_data)
  end

  #DELETE all
  def self.delete_all()
    sql = "DELETE FROM bookings"
    SqlRunner.run(sql)
  end

  #DELETE by id
  def delete()
    sql = "DELETE FROM bookings WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  #Helper methods for mapping
  def self.map_items(booking_data)
    result = booking_data.map { |booking| Booking.new(booking) }
    return result
  end

  def self.map_item(booking_data)
    result = Booking.map_items(booking_data)
    return result.first
  end

  #SHOW MEMBER


  #SHOW WORKOUT



end
