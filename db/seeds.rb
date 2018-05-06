require_relative("../models/city.rb")
require_relative("../models/visit.rb")
require_relative("../models/adventure.rb")
require("pry")

Visit.delete_all()
City.delete_all()
Adventure.delete_all()


adventure1 = Adventure.new({
  "country" => "Iceland",
  "continent" => "Europe"
  })

  adventure1.save()

adventure2 = Adventure.new({
  "country" => "Denmark",
  "continent" => "Europe"
  })

  adventure2.save()

adventure3 = Adventure.new({
  "country" => "The Netherlands",
  "continent" => "Europe"
  })

  adventure3.save()

adventure4 = Adventure.new({
  "country" => "Sweden",
  "continent" => "Europe"
  })

  adventure4.save()

city1 = City.new({
  "name" => "Lund",
  "interest" => "Botanical Garden",
  "adventure_id" => adventure4.id()
  })

  city1.save()

city2 = City.new({
  "name" => "Stockholm",
  "interest" => "Stockholm Palace",
  "adventure_id" => adventure4.id()
  })

  city2.save()

city3 = City.new({
  "name" => "Leiden",
  "interest" => "Starbucks",
  "adventure_id" => adventure3.id()
  })

  city3.save()

city4 = City.new({
  "name" => "Den Haag",
  "interest" => "Albert Heijn",
  "adventure_id" => adventure3.id()
  })

  city4.save()

city5 = City.new({
  "name" => "Roskilde",
  "interest" => "Viking Ship",
  "adventure_id" => adventure2.id()
  })

  city5.save()

city6 = City.new({
  "name" => "Copenhagen",
  "interest" => "The Little Mermaid",
  "adventure_id" => adventure2.id()
  })

  city6.save()

city7 = City.new({
  "name" => "Reykjavik",
  "interest" => "volcano",
  "adventure_id" => adventure1.id()
  })

  city7.save()

city8 = City.new({
  "name" => "Perlan",
  "interest" => "Glass Restaurant",
  "adventure_id" => adventure1.id()
  })

  city8.save()

visit1 = Visit.new({
  "arrival_date" => "02/08/2014",
  "duration" => 5,
  "adventure_id" => adventure1.id(),
  "city_id" => city7.id()

  })

visit1.save()

  visit2 = Visit.new({
    "arrival_date" => "01/06/2012",
    "duration" => 12,
    "adventure_id" => adventure3.id(),
    "city_id" => city3.id()
    })

  visit2.save()

  binding.pry
nil
