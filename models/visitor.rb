require_relative('../db/sql_runner')

class Visitor
  attr_reader :id
  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
end



    def save()
      sql = "INSERT INTO visitors
      (name)
      VALUES
      ($1)
      RETURNING id"
      values = [@name]
      city = SqlRunner.run(sql, values)
      @id = city.first()["id"].to_i
    end

    def self.delete_all()
      sql = "DELETE FROM visitors;"
      SqlRunner.run(sql)
    end

    def self.all()
      sql = "SELECT * FROM cities"
      cities_array = SqlRunner.run( sql )
      result = cities_array.map { |cities_hash| City.new( cities_hash ) }
      return result
    end
