require( "sinatra" )
require( "sinatra/contrib/all" )
require( "pry" )
require_relative( "./models/city.rb" )
require_relative( "./models/adventure.rb" )
require_relative( "./models/visit.rb" )

get "/main/:id/details/goals" do
  @adventure = Adventure.find(params[:id])
  erb(:goals)
end

post "/main/:id/details" do
  @city = City.new(params)
  @city.save()
  erb(:details)
end
