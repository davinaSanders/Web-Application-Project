require( "sinatra" )
require( "sinatra/contrib/all" )
require( "pry" )
require_relative( "./models/city.rb" )
require_relative( "./models/adventure.rb" )
require_relative( "./models/visit.rb" )

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
