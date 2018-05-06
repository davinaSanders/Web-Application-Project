require_relative('../db/sql_runner')

class Visit
  attr_reader :id, :adventure_id
  attr_accessor :arrival_date, :duration
  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @arrival_date = options["arrival_date"]
    @duration = options["duration"].to_i
    @adventure_id = options["adventure_id"].to_i
  end

  def save()
    sql = "INSERT INTO visits
    (arrival_date, duration, adventure_id)
    VALUES
    ($1, $2, $3)
    RETURNING id"
    values = [@arrival_date, @duration, @adventure_id]
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
    ($1, $2)
    WHERE id = $3"
    values = [@arrival_date, @duration, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM visits"
    visits_array = SqlRunner.run( sql )
    result = visits_array.map { |visits_hash| Visit.new( visits_hash ) }
    return result
  end

  end
