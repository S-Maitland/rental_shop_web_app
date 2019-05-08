require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/rental.rb')
require_relative('../models/customer.rb')
require_relative('../models/car.rb')

get '/rentals' do
  @rentals = Rental.all()
  erb(:"rentals/index")
end

post '/rentals' do
  @rentals = Rental.new(params)
  @rentals.save()
  @rentalCar = Car.find(params[:car_id].to_i).rent()
  redirect '/rentals'
end

post '/rentals/:id' do
  @rentals = Rental.new(params)
  @rentals.update()
  redirect '/rentals'
end

get '/rentals/new' do
  @customers = Customer.all()
  @cars = Car.all()
  erb (:"rentals/new")
end

get '/rentals/:id' do
  @rental = Rental.find(params[:id].to_i)
  @customer = @rental.return_customer
  @car = @rental.return_car
  erb(:"rentals/show")
end

get '/rentals/:id/edit' do
  @rental = Rental.find(params[:id].to_i)
  erb(:"rentals/edit_rental")
end

post '/rentals/:id/delete' do
  Car.find(params[:id].to_i).return_rental
  Rental.delete(params[:id].to_i)
  redirect '/rentals'
end
