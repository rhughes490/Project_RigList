equire_relative("../db/sql_runner")

class Oil_worker

  attr_reader :id
  attr_accessor :first_name, :last_name, :contact_num

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end


end
