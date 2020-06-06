require_relative("../db/sql_runner")

class Rig

  attr_reader :id
  attr_accessor :name, :type, :distance, :country

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @category = options['category']
    @distance = options['distance']
    @country = options['country']
  end

  def save()
    sql = "INSERT INTO rigs
    (
      name,
      type,
      distance,
      country
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@name, @type, @distance, @country]
    location = SqlRunner.run( sql, values ).first
    @id = rig['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM rigs"
    SqlRunner.run(sql)
   end

end
