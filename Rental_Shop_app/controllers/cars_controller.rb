require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/car.rb')
also_reload('../models/*')

get '/cars' do
  @cars = Car.all()
  erb (:"cars/index")
end

post '/cars' do
  @cars = Car.new(params)
  @cars.save()
  redirect '/cars'
end

post '/cars/:id' do
  @cars = Car.new(params)
  @cars.update()
  redirect '/cars'
end

get '/cars/new' do
  erb (:"cars/new")
end

get '/cars/:id' do
  @cars = Car.find(params[:id].to_i)
  erb(:"cars/show")
end

get '/cars/:id/edit' do
  @cars = Car.find(params[:id].to_i)
  erb(:"cars/edit_car")
end

post '/cars/:id/delete' do
  Car.delete(params[:id].to_i)
  redirect '/cars'
end
