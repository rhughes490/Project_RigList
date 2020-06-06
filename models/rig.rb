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

  

end
