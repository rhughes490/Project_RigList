require_relative("../db/sql_runner")
require_relative("oil_worker")
require_relative("rig")

class Flight

  attr_reader :id
  attr_accessor :oil_worker_id, :rig_id, :date, :status

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @oil_worker_id = options['oil_worker_id'].to_i
    @rig_id = options['rig_id'].to_i
    @date = options['date']
    @status = options ['status']
  end

  def save()
    sql = "INSERT INTO flights
    (
      oil_worker_id,
      rig_id,
      date,
      status
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@oil_worker_id, @rig_id, @date, @status]
    flight = SqlRunner.run( sql,values ).first
    @id = flight['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM flightss"
    SqlRunner.run(sql)
   end

end
