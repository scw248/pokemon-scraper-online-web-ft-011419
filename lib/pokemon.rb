class Pokemon

  attr_accessor :id, :name, :type, :hp, :db

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type) 
  end

  def self.find(id, db)
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE pokemon.id = '#{id}'")
    #binding.pry
    self.new(id: id, name: pokemon_info[0][1], type: pokemon_info[0][2], hp: pokemon_info[0][3], db: db)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end

end