require_relative("../db/sql_runner")
require_relative("oil_worker")
require_relative("rig")

class Wish_List

  attr_reader :id
  attr_accessor :oil_worker_id, :rig_id,

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @oil_worker_id = options['oil_worker_id'].to_i
    @rig_id = options['rig_id'].to_i
  end

  def save()
    sql = "INSERT INTO flights
    (
      oil_worker_id,
      rig_id,
      date
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@oil_worker_id, @rig_id, @date]
    flight = SqlRunner.run( sql,values ).first
    @id = flight['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM flights"
    SqlRunner.run(sql)
   end

   def self.all()
    sql = "SELECT * FROM flights"
    results = SqlRunner.run( sql )
    return results.map { |flight| Flight.new( flight ) }
  end

  def oil_worker()
    sql = "SELECT * FROM oil_workers
    WHERE id = $1"
    values = [@oil_worker_id]
    results = SqlRunner.run( sql, values )
    return Oil_worker.new( results.first )
  end

  def rig()
    sql = "SELECT * FROM rigs
    WHERE id = $1"
    values = [@rig_id]
    results = SqlRunner.run( sql, values )
    return Rig.new( results.first )
  end

  def self.delete(id)
    sql = "DELETE FROM flights
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

end
