require_relative("../db/sql_runner")

class Rig

  attr_reader :id
  attr_accessor :name, :type, :distance, :country

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @type = options['type']
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
    rig = SqlRunner.run( sql, values ).first
    @id = rig['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM rigs"
    SqlRunner.run(sql)
   end

   def self.all()
    sql = "SELECT * FROM rigs"
    results = SqlRunner.run( sql )
    return results.map { |hash| Rig.new( hash ) }
end

# def rigs
#     sql = "SELECT rig.* FROM rigs rig INNER JOIN flights flight ON flight.rig_id = rig.id WHERE flight.oil_worker_id = $1;"
#     values = [@id]
#     results = SqlRunner.run(sql, values)
#     return results.map { |rig| Rig.new(rig) }
#   end

#   def self.find( id )
#     sql = "SELECT * FROM oil_workers
#     WHERE id = $1"
#     values = [id]
#     results = SqlRunner.run( sql, values )
#     return Oil_worker.new( results.first )
#   end

end
