require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza_order')
also_reload('./models/*')


get '/pizza_orders' do
  @orders = PizzaOrder.all()
  erb(:index)
end

get '/pizza_orders/new' do
  erb(:new)
end


get '/pizza_orders/:id' do
  @order = PizzaOrder.find(params[:id])
  erb(:show)
end

post '/pizza_orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end

post '/pizza_orders/delete/:id' do
  @order = PizzaOrder.find(params[:id])
  @order.delete()
  redirect '/pizza_orders'
end

get '/pizza_orders/edit/:id' do
  @order = PizzaOrder.find(params[:id])
  erb(:edit)
end

post '/pizza_orders/edit/:id' do
 @order = PizzaOrder.new(params)
 @order.update
 redirect '/pizza_orders'
end
