require ('pry-byebug')
require_relative('../db/sql_runner.rb')

class Customer
  attr_reader :id
  attr_accessor :first_name, :second_name, :age

  def initialize(options)
    @first_name = options['first_name']
    @second_name =options['second_name']
    @age =options['age'].to_i
    @wallet =options['wallet'].to_i
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = 'INSERT INTO customers(
    first_name,
    second_name,
    age,
    wallet
    ) VALUES ($1,$2,$3,$4)
    RETURNING id'
    values = [@first_name, @second_name, @age, @wallet]
    customer_result = SqlRunner.run(sql, values)
    @id = customer_result[0]['id'].to_i
  end

  def update()
    sql = 'UPDATE customers
    SET (first_name,
      second_name,
      age,
      wallet
      ) = ($1,$2,$3,$4)
      WHERE id = $5'
      values = [@first_name, @second_name, @age, @wallet, @id]
      SqlRunner.run(sql, values)
  end

  def self.all()
    sql = 'SELECT * FROM customers'
    result = SqlRunner.run(sql)
    return result.map{|customer| Customer.new(customer)}
  end

  def self.delete_all()
    sql = 'DELETE FROM customers'
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = 'DELETE FROM customers WHERE id = $1'
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM customers
    WHERE id = $1"
    values = [id]
    hash = SqlRunner.run(sql, values)[0]
    return Customer.new(hash)
  end

end
