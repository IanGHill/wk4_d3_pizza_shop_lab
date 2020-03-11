require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('models/pizza_order')
also_reload('./models/*')

get '/pizza-orders' do
  # Should be the PizzaOrder.all method
  # Remnder some kind of view called index
  @orders = PizzaOrder.all()
  erb(:index)
end

get '/pizza-orders/new' do
  #
  erb(:new)
end

get '/pizza-orders/:id' do
  @order = PizzaOrder.find(params[:id])
  erb(:show)
end

post '/pizza-orders' do
  @order = PizzaOrder.new(params)
  @order.save
  erb(:create)
end

post '/pizza-orders/:id/delete' do
  @order = PizzaOrder.find(params[:id])
  @order.delete()
  redirect '/pizza-orders'
  # erb(:destroy)
end

get '/pizza-orders/:id/edit' do
  @order = PizzaOrder.find(params[:id])
  erb(:edit)
end

post '/pizza-orders/:id' do
  @order = PizzaOrder.find(params[:id])
  @order.first_name = params[:first_name]
  @order.last_name = params[:last_name]
  @order.topping = params[:topping]
  @order.quantity = params[:quantity]
  # binding.pry
  @order.update()
  redirect '/pizza-orders'
end
