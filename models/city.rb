require_relative('../db/sql_runner')

class City
  attr_reader :id, :adventure_id
  attr_accessor :name, :interest
    def initialize(options)
      @id = options["id"].to_i if options["id"]
      @name = options["name"]
      @interest = options["interest"]
      @adventure_id = options["adventure_id"].to_i
    end


    def save()
      sql = "INSERT INTO cities
      (name, interest, adventure_id)
      VALUES
      ($1, $2, $3)
      RETURNING id"
      values = [@name, @interest, @adventure_id]
      city = SqlRunner.run(sql, values)
      @id = city.first()["id"].to_i
    end

    def update()
      sql = "UPDATE cities SET
      (name, interest) =
      ($1, $2)
      WHERE id = $3"
      values = [@name, @interest, @id]
      SqlRunner.run(sql, values)
    end

    def delete()
      sql = "DELETE FROM cities where id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def self.delete_all()
      sql = "DELETE FROM cities;"
      SqlRunner.run(sql)
    end

    def self.all()
      sql = "SELECT * FROM cities"
      cities_array = SqlRunner.run( sql )
      result = cities_array.map { |cities_hash| City.new( cities_hash ) }
      return result
    end

    def self.find( id )
      sql = "SELECT * FROM cities
      WHERE id = $1"
      values = [id]
      city = SqlRunner.run( sql, values )
      result = City.new( city.first )
      return result
    end

    def visits()
      sql = "SELECT visits.* FROM visits WHERE visits.city_id = $1"
      values = [@id]
      visit_hashes = SqlRunner.run(sql, values)
      visits = visit_hashes.map { |visit_hash| Visit.new(visit_hash)}
      return visits
    end

    def self.all__visited_cities()
      sql = "SELECT cities.* FROM cities INNER JOIN visits ON cities.id = visits.city_id"
      cities_array = SqlRunner.run( sql )
      result = cities_array.map { |cities_hash| City.new( cities_hash ) }
      return result
    end

  end
