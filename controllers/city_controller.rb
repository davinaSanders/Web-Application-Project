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

post "/main/:id/details/goals" do
  @city = City.new(params)
  @city.save()
  redirect to ("/main/:id/details")
end
