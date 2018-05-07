require( "sinatra" )
require( "sinatra/contrib/all" )
require( "pry" )
require_relative( "../models/city.rb" )
require_relative( "../models/adventure.rb" )
require_relative( "../models/visit.rb" )

get "/reviews" do
  # @reviews = Visit.
  erb(:reviews)
end


get "/main/:id/visited" do
  @adventure = Adventure.find(params[:id].to_i)
  erb(:visited)
end

post "/main/:id/visited" do
  @visit = Visit.new(params)
  @visit.save()
  erb(:details)
end
