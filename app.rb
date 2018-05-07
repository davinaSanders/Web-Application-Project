require( "sinatra" )
require( "sinatra/contrib/all" )
require( "pry" )
require_relative( "./controllers/city_controller.rb" )
require_relative( "./controllers/adventure_controller.rb" )
require_relative( "./controllers/visit_controller.rb" )


get "/main" do
  @visited = Adventure.all__visited_adventures()
  @not_visited = Adventure.not_visited()
  erb(:main)
end
