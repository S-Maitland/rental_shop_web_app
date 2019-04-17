require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/cars_controller.rb')
require_relative('controllers/customers_controller.rb')
require_relative('controllers/rentals_controller.rb')
also_reload('../models/*')

#INDEX
get '/' do
  erb(:index)
end
