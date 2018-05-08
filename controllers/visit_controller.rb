require( "sinatra" )
require( "sinatra/contrib/all" )
require( "pry" )
require_relative( "../models/city.rb" )
require_relative( "../models/adventure.rb" )
require_relative( "../models/visit.rb" )

get "/reviews" do
  @visits = Visit.all()
  erb(:reviews)
end


get "/main/:id/visited" do
  @adventure = Adventure.find(params[:id].to_i)
  erb(:visited)
end

post "/main/:id/visited" do
  @visit = Visit.new(params)
  @visit.save()
  redirect to ("/main")
end
