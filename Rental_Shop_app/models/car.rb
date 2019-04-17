require ('pry-byebug')
require_relative('../db/sql_runner.rb')

class Car
  attr_reader :id
  attr_accessor :manufacturer, :model, :mileage, :registration_year, :daily_rental_rate, :rented, :car_image

  def initialize(options)
    @manufacturer = options['manufacturer']
    @model = options['model']
    @mileage = options['mileage']
    @registration_year = options['registration_year']
    @daily_rental_rate = options['daily_rental_rate']
    @rented = options['rented']
    @car_image = options['car_image']
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = 'INSERT INTO cars(
          manufacturer,
          model,
          mileage,
          registration_year,
          daily_rental_rate,
          rented,
          car_image
          ) VALUES ($1, $2, $3, $4, $5, $6, $7)
          RETURNING id'
    values = [@manufacturer, @model, @mileage, @registration_year, @daily_rental_rate, @rented, @car_image]
    customer_result = SqlRunner.run(sql, values)
    @id = customer_result[0]['id'].to_i
  end

  def update()
    sql = 'UPDATE cars
    SET (manufacturer,
        model,
        mileage,
        registration_year,
        daily_rental_rate,
        rented,
        car_image
        ) = ($1,$2,$3,$4, $5, $6, $7)
        WHERE id = $8'
    values = [@manufacturer, @model, @mileage, @registration_year, @daily_rental_rate, @rented, @car_image, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = 'SELECT * FROM cars'
    result = SqlRunner.run(sql)
    return result.map{|car| Car.new(car)}
  end

  def self.delete_all()
    sql = 'DELETE FROM cars'
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = 'DELETE FROM cars WHERE id = $1'
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = 'SELECT * FROM cars
    WHERE id = $1'
    values = [id]
    hash = SqlRunner.run(sql, values)[0]
    return Car.new(hash)
  end

  def rent()
    sql = 'UPDATE cars SET rented = true WHERE id = $1'
    values = [id]
    SqlRunner.run(sql, values)
    @rented = true
  end

  def return_rental()
    sql = 'UPDATE cars SET rented = false WHERE id = $1'
    values = [id]
    SqlRunner.run(sql, values)
    @rented = false
  end

end
