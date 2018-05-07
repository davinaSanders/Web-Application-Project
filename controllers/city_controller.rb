require( "sinatra" )
require( "sinatra/contrib/all" )
require( "pry" )
require_relative( "../models/city.rb" )
require_relative( "../models/adventure.rb" )
require_relative( "../models/visit.rb" )
require_relative( "adventure_controller.rb" )
require_relative( "visit_controller.rb" )

get "/main/:id/details/goals" do
  @adventure = Adventure.find(params[:id].to_i)
  erb(:goals)
end

get "/main/city/:id/change" do
  @city = City.find(params[:id].to_i)
  erb(:change)
end

post "/main/city/:id/change" do
  @city = City.new(params)
  @city.update()
  redirect to ("/main")
end

post "/main/city/:id/delete" do
  @city = City.find(params[:id].to_i)
  @city.delete()
  redirect to ("/main")
end

post "/main/:id/details/goals" do
  @city = City.new(params)
  @city.save()
  redirect to ("/main")
end
