require_relative('../db/sql_runner')

class Visit
  attr_reader :id
  attr_accessor :country_id, :city_id
  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @country_id = options["country_id"].to_i
    @city_id = options["city_id"].to_i
  end


  def save()
    sql = "INSERT INTO visits
    (country_id, city_id)
    VALUES
    ($1, $2)
    RETURNING id"
    values = [@country_id, @city_id]
    visit = SqlRunner.run(sql, values)
    @id = visit.first()["id"].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM visits"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM visits"
    visits_array = SqlRunner.run( sql )
    result = visits_array.map { |visits_hash| Visit.new( visits_hash ) }
    return result
  end

  end
