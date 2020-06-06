equire_relative("../db/sql_runner")

class Oil_worker

  attr_reader :id
  attr_accessor :first_name, :last_name, :contact_num

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
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

end
