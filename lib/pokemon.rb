class Pokemon
  
  attr_accessor :id, :name, :type, :database
  
  @@all = []
  
  def initialize(id:, name:, type:, database:)
    @id = id
    @name = name
    @type = type
    @database = database
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.save(name, type, database)
    database.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, database)
    pokemon = database.execute("SELECT * FROM pokemon WHERE id=?", id).first
   Pokemon.new(pokemon, database)
  end
    

end
