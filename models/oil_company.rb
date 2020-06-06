require_relative("../db/sql_runner")

class Oil_company

  attr_reader :id
  attr_accessor :name, :type

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @type = options['type']
  end

  def save()
    sql = "INSERT INTO oil_companys
    (
      name,
      type
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@name, @type]
    oil_company = SqlRunner.run( sql, values ).first
    @id = oil_company['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM oil_companys"
    SqlRunner.run(sql)
   end

end
