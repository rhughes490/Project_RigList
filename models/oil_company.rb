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

   def self.find(id)
    sql = "SELECT * FROM oil_companys
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql ,values).first
    oil_company = Oil_company.new(result)
    return oil_company
  end

  def self.all()
    sql = "SELECT * FROM oil_companys"
    oil_company_data = SqlRunner.run(sql)
    oil_companys = map_items(oil_company_data)
    return oil_companys
  end

  def self.map_items(oil_company_data)
    return oil_company_data.map { |oil_company| Oil_company.new(oil_company) }
  end

end
