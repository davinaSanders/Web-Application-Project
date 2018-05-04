require_relative('../db/sql_runner')

class City
  attr_reader :id
  attr_accessor :name, :interest, :country_id
    def initialize(options)
      @id = options["id"].to_i if options["id"]
      @name = options["name"]
      @interest = options["interest"]
      @country_id = options["country_id"].to_i
    end


    def save()
      sql = "INSERT INTO cities
      (name, interest, country_id)
      VALUES
      ($1, $2, $3)
      RETURNING id"
      values = [@name, @interest, @country_id]
      city = SqlRunner.run(sql, values)
      @id = city.first()["id"].to_i
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
