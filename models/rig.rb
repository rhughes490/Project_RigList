require_relative("../db/sql_runner")

class Rig

  attr_reader :id
  attr_accessor :name, :type, :distance, :country, :oil_company_id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @type = options['type']
    @distance = options['distance']
    @country = options['country']
    @oil_company = options['oil_company_id'].to_i
  end

  def save()
    sql = "INSERT INTO rigs
    (
      name,
      type,
      distance,
      country,
      oil_company_id
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id"
    values = [@name, @type, @distance, @country, @oil_company_id]
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

def oil_workers
    sql = "SELECT oil_worker.* FROM oil_workers oil_worker INNER JOIN flights flight ON flight.oil_worker_id = oil_worker.id WHERE flight.rig_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |oil_worker| Oil_worker.new(oil_worker) }
end

  def self.find( id )
    sql = "SELECT * FROM rigs
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Rig.new( results.first )
  end

end
