require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('controllers/cars_controller.rb')
require_relative('controllers/customers_controller.rb')
require_relative('controllers/rentals_controller.rb')

#INDEX
get '/' do
  erb(:index)
end
