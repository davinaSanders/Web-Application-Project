require( "sinatra" )
require( "sinatra/contrib/all" )
require( "pry" )
require_relative( "./models/city.rb" )
require_relative( "./models/adventure.rb" )
require_relative( "./models/visit.rb" )


get "/" do
  erb( :welcome )
end

get "/main" do
  @visited = Adventure.all__visited_adventures()
  @adventures = Adventure.all()
  binding.pry
  erb(:main)
end

get "/new"  do
  erb(:new)
end

get "/main/:id/edit" do
  erb(:edit)
end

get "/main/:id/details" do
  @adventure = Adventure.find(params[:id].to_i)
  @cities = @adventure.cities()
  erb(:details)
end

get "/main/:id/visited" do
  erb(:visited)
end

post "/main" do
  @visitor = params[:visitor].capitalize
  erb(:main)
end


post "/main/:id/details" do
  # @order = PizzaOrder.new(params)
  # @order.update()
  # redirect "/pizza_orders"
  erb(:details)
end
