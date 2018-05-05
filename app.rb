require( "sinatra" )
require( "sinatra/contrib/all" )
require( "pry" )
require_relative( "./models/city.rb" )
require_relative( "./models/country.rb" )
require_relative( "./models/visit.rb" )


get "/welcome" do
  erb( :welcome )
end

get "/welcome/main" do
  erb( :main )
end

post "/welcome/main" do
  @visitor = params[:visitor].capitalize
  erb(:main)
end
