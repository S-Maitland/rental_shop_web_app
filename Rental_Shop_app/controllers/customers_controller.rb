require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/customer.rb')
also_reload('../models/*')

get '/customers' do
  @customers = Customer.all()
  erb (:"customers/index")
end

post '/customers' do
  @customer = Customer.new(params)
  @customer.save()
  redirect '/customers'
end

post '/customers/:id' do
  @customer = Customer.new(params)
  @customer.update()
  redirect '/customers'
end

get '/customers/new' do
  erb (:"customers/new")
end

get '/customers/:id' do
  @customer = Customer.find(params[:id])
  erb(:"customers/show")
end

get '/customers/:id/edit' do
  @customer = Customer.find(params[:id].to_i)
  erb(:"customers/edit_customer")
end

post '/customers/:id/delete' do
  Customer.delete(params[:id].to_i)
  redirect '/customers'
end
