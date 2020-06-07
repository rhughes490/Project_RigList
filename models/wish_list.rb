require_relative("../db/sql_runner")
require_relative("oil_worker")
require_relative("rig")

class Wish_list

  attr_reader :id
  attr_accessor :oil_worker_id, :rig_id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @oil_worker_id = options['oil_worker_id'].to_i
    @rig_id = options['rig_id'].to_i
  end

  def save()
    sql = "INSERT INTO wish_lists
    (
      oil_worker_id,
      rig_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@oil_worker_id, @rig_id]
    wish_list = SqlRunner.run( sql,values ).first
    @id = wish_list['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM wish_lists"
    SqlRunner.run(sql)
   end

   def self.all()
    sql = "SELECT * FROM wish_lists"
    results = SqlRunner.run( sql )
    return results.map { |wish_list| Wish_list.new( wish_list ) }
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
    sql = "DELETE FROM wish_lists
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

end
