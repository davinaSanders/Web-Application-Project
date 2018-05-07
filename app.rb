require( "sinatra" )
require( "sinatra/contrib/all" )
require( "pry" )
require_relative( "./models/city.rb" )
require_relative( "./models/adventure.rb" )
require_relative( "./models/visit.rb" )


# get "/" do
#   erb( :welcome )
# end

get "/main" do
  # @@visitor
  @visited = Adventure.all__visited_adventures()
  @adventures = Adventure.all()
  erb(:main)
end

get "/main/:id/visited" do
  @adventure = Adventure.find(params[:id].to_i)
  erb(:visited)
end

post '/main/:id/delete' do
  @adventure = Adventure.find(params[:id].to_i)
  @adventure.delete()
  redirect to("/main")
end

# post "/main" do
#   @@visitor = (params[:visitor].capitalize)
#   erb(:main)
# end

post "/new" do
  @adventure = Adventure.new(params)
  @adventure.save()
  erb(:main)
end

post "/main/:id/details/visited" do
  @visit = Visit.new(params)
  @visit.save()
  erb(:details)
end

post "/main/:id/details" do
  @city = City.new(params)
  @city.save()
  erb(:details)
end
