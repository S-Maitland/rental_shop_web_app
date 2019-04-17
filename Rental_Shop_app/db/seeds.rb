require('pry-byebug')
require_relative('../models/customer.rb')
require_relative('../models/car.rb')
#seed database with customers

customer1 = Customer.new({
  'first_name' => 'Jeremy',
  'second_name' => 'Clarkson',
  'age' => '59',
  'wallet' => '1000'
  })
  customer1.save()

customer2 = Customer.new({
  'first_name' => 'James',
  'second_name' => 'May',
  'age' => '56',
  'wallet' => '1000'
  })
  customer2.save()

customer3 = Customer.new({
  'first_name' => 'Richard',
  'second_name' => 'Hammond',
  'age' => '49',
  'wallet' => '1000'
  })
  customer3.save()

#seed database with cars
car1 = Car.new({
'manufacturer' => 'Alfa Romeo',
'model' => 'Guilia Quadrifoglio',
'mileage' => '11000',
'registration_year' => '2016',
'daily_rental_rate' => '160',
'rented' => 'f',
'car_image' => '/images/guilia_quadrifoglio.jpeg'
  })
car1.save()

car2 = Car.new({
'manufacturer' => 'Austin Martin',
'model' => 'DBS Superleggera',
'mileage' => '4000',
'registration_year' => '2018',
'daily_rental_rate' => '155',
'rented' => 'f',
'car_image' => '/images/dbs_superleggera.jpeg'
  })
car2.save()

car3 = Car.new({
'manufacturer' => 'Audi',
'model' => 'R8 Spyder',
'mileage' => '33000',
'registration_year' => '2006',
'daily_rental_rate' => '120',
'rented' => 'f',
'car_image' => '/images/r8_spyder.jpeg'
  })
car3.save()

car4 = Car.new({
'manufacturer' => 'BMW',
'model' => '4 series Gran Coupe',
'mileage' => '44000',
'registration_year' => '2014',
'daily_rental_rate' => '90',
'rented' => 'f',
'car_image' => '/images/4_series_gran_coupe.jpeg'
  })
car4.save()

car5 = Car.new({
'manufacturer' => 'Jaguar',
'model' => 'F-Type Coupe',
'mileage' => '4000',
'registration_year' => '2016',
'daily_rental_rate' => '170',
'rented' => 'f',
'car_image' => '/images/f-type.jpeg'
  })
car5.save()

car6 = Car.new({
'manufacturer' => 'Mercedes-Benz',
'model' => 'S-Class',
'mileage' => '16000',
'registration_year' => '2014',
'daily_rental_rate' => '140',
'rented' => 'f',
'car_image' => '/images/s-class.jpeg'
  })
car6.save()

car7 = Car.new({
'manufacturer' => 'Maserati',
'model' => 'Ghibli',
'mileage' => '56000',
'registration_year' => '2013',
'daily_rental_rate' => '200',
'rented' => 'f',
'car_image' => '/images/ghibli.jpeg'
  })
car7.save()

binding.pry
nil
