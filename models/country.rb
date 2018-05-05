require_relative('../db/sql_runner')

class Country
  attr_reader :id
  attr_accessor :name, :arrival_date, :duration
    def initialize(options)
      @id = options["id"].to_i if options["id"]
      @name = options["name"]
      @arrival_date = options["arrival_date"]
      @duration = options["duration"].to_i
    end

    def update()
      
    end

    def save()
      sql = "INSERT INTO countries
      (name, arrival_date, duration)
      VALUES
      ($1, $2, $3)
      RETURNING id"
      values = [@name, @arrival_date, @duration]
      country = SqlRunner.run(sql, values)
      @id = country[0]["id"].to_i
    end

    def self.delete_all()
      sql = "DELETE FROM countries"
      SqlRunner.run(sql)
    end

    def self.all()
      sql = "SELECT * FROM countries"
      countries_array = SqlRunner.run( sql )
      result = countries_array.map { |countries_hash| Country.new( countries_hash ) }
      return result
    end

  end
