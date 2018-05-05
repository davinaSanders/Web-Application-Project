require_relative("../models/city.rb")
require_relative("../models/visit.rb")
require_relative("../models/country.rb")
require("pry")

Visit.delete_all()
City.delete_all()
Country.delete_all()


country1 = Country.new({
  "name" => "Iceland",
  "arrival_date" => "2018-06-01",
  "duration" => 15
  })

  country1.save()

country2 = Country.new({
  "name" => "Denmark",
  "arrival_date" => "2018-07-01",
  "duration" => 10
  })
  country2.save()

country3 = Country.new({
  "name" => "The Netherlands",
  "arrival_date" => "2018-08-01",
  "duration" => 5
  })
  country3.save()

country4 = Country.new({
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

  city1.save()

city2 = City.new({
  "name" => "Stockholm",
  "interest" => "Stockholm Palace",
  "country_id" => country4.id()
  })

  city2.save()

city3 = City.new({
  "name" => "Leiden",
  "interest" => "Starbucks",
  "country_id" => country3.id()
  })

  city3.save()

city4 = City.new({
  "name" => "Den Haag",
  "interest" => "Albert Heijn",
  "country_id" => country3.id()
  })

  city4.save()

city5 = City.new({
  "name" => "Roskilde",
  "interest" => "Viking Ship",
  "country_id" => country2.id()
  })

  city5.save()

city6 = City.new({
  "name" => "Copenhagen",
  "interest" => "The Little Mermaid",
  "country_id" => country2.id()
  })

  city6.save()

city7 = City.new({
  "name" => "Reykjavik",
  "interest" => "volcano",
  "country_id" => country1.id()
  })

  city7.save()

city8 = City.new({
  "name" => "Perlan",
  "interest" => "Glass Restaurant",
  "country_id" => country1.id()
  })

  city8.save()

  visit1 = Visit.new({
  "country_id" => country1.id(),
  "city_id" => city7.id()
  })

  visit1.save()

  binding.pry
nil
