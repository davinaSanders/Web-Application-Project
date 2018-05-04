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
