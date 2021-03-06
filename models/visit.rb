require_relative('../db/sql_runner')
require("pry")

class Visit
  attr_reader :id, :adventure_id
  attr_accessor :arrival_date, :duration, :review
  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @arrival_date = options["arrival_date"]
    @duration = options["duration"].to_i
    @adventure_id = options["adventure_id"].to_i
    @review = options["review"]
  end

  def save()
    sql = "INSERT INTO visits
    (arrival_date, duration, adventure_id, review)
    VALUES
    ($1, $2, $3, $4)
    RETURNING id"
    values = [@arrival_date, @duration, @adventure_id, @review]
    visit = SqlRunner.run(sql, values)
    @id = visit.first()["id"].to_i
  end

  def delete()
    sql = "DELETE FROM visits where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM visits"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE visits SET
    (arrival_date, duration) =
    ($1, $2, $3)
    WHERE id = $4"
    values = [@arrival_date, @duration, @review, @id]
    SqlRunner.run(sql, values)
  end

  def self.reviews()
    sql = "SELECT visits.review, visits.arrival_date FROM visits"
    reviews_array = SqlRunner.run( sql )
    return reviews_array
  end

  def self.all()
    sql = "SELECT * FROM visits"
    visits_array = SqlRunner.run( sql )
    result = visits_array.map { |visits_hash| Visit.new( visits_hash ) }
    return result
  end


  def visits()
    sql = "SELECT visits.* FROM visits WHERE visits.adventure_id = $1"
    values = [@id]
    visit_hashes = SqlRunner.run(sql, values)
    visits = visit_hashes.map { |visit_hash| Visit.new(visit_hash)}
    return visits
  end

  def adventure()
    sql = "SELECT * FROM adventures WHERE id = $1"
    values = [@adventure_id]
    results = SqlRunner.run(sql, values)
    adventure = Adventure.new(results.first)
    return adventure
  end


end
