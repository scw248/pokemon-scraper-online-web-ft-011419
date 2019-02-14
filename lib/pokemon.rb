class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES ('#{name}', '#{type}')") 
  end

  def self.find(id, db)
    array = db.execute("SELECT * FROM pokemon WHERE pokemon.id = '#{id}'")
    #binding.pry
    self.new(id: id, name: array[0][1], type: array[0][2], db: db)
  end

end
