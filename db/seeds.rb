require_relative("../models/city.rb")
require_relative("../models/visitor.rb")
require_relative("../models/country.rb")
require("pry")


City.delete_all()
Visitor.delete_all()
Country.delete_all()

visitor1 = ({
    "name" => "Davina"
  })
visitor1.save()

country1 = ({
  "name" => "Iceland",
  "arrival_date" => "2018-06-01",
  "duration" => 15
  })
  country1.save()

country2 = ({
  "name" => "Denmark",
  "arrival_date" => "2018-07-01",
  "duration" => 10
  })
  country2.save()

country3 = ({
  "name" => "The Netherlands",
  "arrival_date" => "2018-08-01",
  "duration" => 5
  })
  country3.save()

country4 = ({
  "name" => "Sweden",
  "arrival_date" => "2018-09-01",
  "duration" => 20
  })
  country4.save()

city1 = City.new({
  "name" => "Lund",
  "interest" => "Botanical Garden",
  "country_id" => country4.id()
  })
city2 = City.new({
  "name" => "Stockholm",
  "interest" => "Stockholm Palace",
  "country_id" => country4.id()
  })
city3 = City.new({
  "name" => "Leiden",
  "interest" => "Starbucks",
  "country_id" => country3.id()
  })
city4 = City.new({
  "name" => "Den Haag",
  "interest" => "Albert Heijn",
  "country_id" => contry3.id()
  })
city5 = City.new({
  "name" => "Roskilde",
  "interest" => "Viking Ship",
  "country_id" => country2.id()
  })
city6 = City.new({
  "name" => "Copenhagen",
  "interest" => "The Little Mermaid",
  "country_id" => country2.id()
  })
city7 = City.new({
  "name" => "Reykjavik",
  "interest" => "volcano",
  "country_id" => country1.id()
  })
city8 = City.new({
  "name" => "Perlan",
  "interest" => "Glass Restaurant",
  "country_id" => country1.id()
  })
