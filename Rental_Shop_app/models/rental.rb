require ('pry-byebug')
require_relative('../db/sql_runner.rb')
require_relative('customer.rb')
require_relative('car.rb')

class Rental
  attr_reader :id
  attr_accessor :customer_id, :car_id

  def initialize(options)
    @customer_id =options['customer_id'].to_i
    @car_id =options['car_id'].to_i
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = 'INSERT INTO rentals(
    customer_id,
    car_id
    ) VALUES ($1,$2)
    RETURNING id'
    values = [@customer_id, @car_id]
    rental_result = SqlRunner.run(sql, values)
    @id = rental_result[0]['id'].to_i
  end

  def update()
    sql = 'UPDATE rentals
    SET (customer_id,
      car_id
      ) = ($1,$2)
      WHERE id = $3'
      values = [@customer_id, @car_id, @id]
      SqlRunner.run(sql, values)
  end

  def self.all()
    sql = 'SELECT * FROM rentals'
    result = SqlRunner.run(sql)
    return result.map{|rental| Rental.new(rental)}
  end

  def self.delete_all()
    sql = 'DELETE FROM rentals'
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = 'DELETE FROM rentals WHERE id = $1'
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = 'SELECT * FROM rentals
    WHERE id = $1'
    values = [id]
    hash = SqlRunner.run(sql, values)[0]
    return Rental.new(hash)
  end

  def return_car()
    sql = 'SELECT * FROM cars WHERE id = $1'
    values = [@car_id]
    hash = SqlRunner.run(sql, values).first
    return Car.new(hash)
  end

  def return_customer()
    sql = 'SELECT * FROM customers WHERE id = $1'
    values = [@customer_id]
    hash = SqlRunner.run(sql, values).first
    return Customer.new(hash)
  end

end
