require( "sinatra" )
require( "sinatra/contrib/all" )
require( "pry" )
require_relative( "../models/city.rb" )
require_relative( "../models/adventure.rb" )
require_relative( "../models/visit.rb" )

get "/new"  do
  erb(:new)
end

get "/main/:id/edit" do
  @adventure = Adventure.find(params[:id].to_i)
  erb(:edit)
end

get "/main/:id/details" do
  @adventure = Adventure.find(params[:id].to_i)
  @cities = @adventure.cities()
  erb(:details)
end

get "/search" do
  erb(:search)
end

post "/search/results" do
  @adventure = Adventure.find_by_continent(params["continent"])
  if @adventure != nil
    @adventures = @adventure.continents()
    erb(:results)
  else
    @adventures = nil
    @continent = params["continent"]
    erb(:results)
  end
end

post "/new" do
  @adventure = Adventure.new(params)
  @adventure.save()
  redirect to("/main")
end

post "/main/:id/update" do
  @adventure = Adventure.new(params)
  @adventure.update()
  redirect to("/main")
end

post "/main/:id/details" do
  @city = City.new(params)
  @city.save()
  erb(:details)
end

post '/main/:id/delete' do
  @adventure = Adventure.find(params[:id].to_i)
  @adventure.delete()
  redirect to("/main")
end
