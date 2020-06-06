require_relative("../db/sql_runner")

class Oil_worker

  attr_reader :id
  attr_accessor :first_name, :last_name, :contact_num

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @contact_num = options['contact_num']
  end

  def save()
    sql = "INSERT INTO oil_workers
    (
      first_name,
      last_name,
      contact_num
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@first_name, @last_name, @contact_num]
    oil_worker = SqlRunner.run( sql, values ).first
    @id = oil_worker['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM oil_workers"
    SqlRunner.run(sql)
   end

    def self.all()
        sql = "SELECT * FROM oil_workers"
        results = SqlRunner.run( sql )
        return results.map { |hash| Oil_worker.new( hash ) }
    end

    def rigs
        sql = "SELECT rig.* FROM rigs rig INNER JOIN flights flight ON flight.rig_id = rig.id WHERE flight.oil_worker_id = $1;"
        values = [@id]
        results = SqlRunner.run(sql, values)
        return results.map { |rig| Rig.new(rig) }
      end

end
