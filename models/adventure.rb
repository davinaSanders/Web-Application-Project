require_relative('../db/sql_runner')
require_relative("city.rb")
require_relative("visit.rb")

class Adventure
  attr_reader :id
  attr_accessor :country, :continent
    def initialize(options)
      @id = options["id"].to_i if options["id"]
      @country = options["country"]
      @continent = options["continent"]
    end

    def update()
      sql = "UPDATE adventures SET
      (country, continent) =
      ($1, $2)
      WHERE id = $3"
      values = [@country, @continent, @id]
      SqlRunner.run(sql, values)
    end

    def save()
      sql = "INSERT INTO adventures
      (country, continent)
      VALUES
      ($1, $2)
      RETURNING id"
      values = [@country, @continent]
      adventure = SqlRunner.run(sql, values)
      @id = adventure[0]["id"].to_i
    end

    def self.delete_all()
      sql = "DELETE FROM adventures"
      SqlRunner.run(sql)
    end

    def delete()
      sql = "DELETE FROM adventures where id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def self.all()
      sql = "SELECT * FROM adventures"
      adventures_array = SqlRunner.run( sql )
      result = adventures_array.map { |adventures_hash| Adventure.new( adventures_hash ) }
      return result
    end

    def self.all_total()
      sql = "SELECT * FROM adventures"
      adventures_array = SqlRunner.run( sql )
      result = adventures_array.map { |adventures_hash| Adventure.new( adventures_hash ) }
      return result.count()
    end

    def self.all__visited_adventures()
      sql = "SELECT adventures.* FROM adventures INNER JOIN visits ON adventures.id = visits.adventure_id"
      adventures_array = SqlRunner.run( sql )
      result = adventures_array.map { |adventures_hash| Adventure.new( adventures_hash ) }
      return result
    end

    def self.not_visited
      sql = "SELECT adventures.* FROM adventures
      LEFT JOIN visits ON adventures.id = visits.adventure_id WHERE visits.adventure_id IS NULL"
      adventures_array = SqlRunner.run( sql )
      result = adventures_array.map { |adventures_hash| Adventure.new( adventures_hash ) }
      return result
    end

    def self.find( id )
      sql = "SELECT * FROM adventures
      WHERE id = $1"
      values = [id]
      adventure = SqlRunner.run( sql, values )
      result = Adventure.new( adventure.first )
      return result
    end

    def cities()
      sql = "SELECT cities.* FROM cities WHERE cities.adventure_id = $1"
      values = [@id]
      city_hashes = SqlRunner.run(sql, values)
      cities = city_hashes.map { |city_hash| City.new(city_hash)}
      return cities
    end


    def continents()
      sql = "SELECT adventures.* FROM adventures WHERE adventures.continent = $1"
      values = [@continent]
      country_hashes = SqlRunner.run(sql, values)
      countries = country_hashes.map { |country_hash| Adventure.new(country_hash)}
      return countries
    end



  end
