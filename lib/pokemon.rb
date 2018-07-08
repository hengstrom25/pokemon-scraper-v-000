class Pokemon
  
  attr_accessor :id, :name, :type, :db, :hp
  
  @@all = []
  
  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, db)
    result = db.execute("SELECT * FROM pokemon WHERE id=?", id)
    data = result.flatten
    pokemon = self.new(id: data[0], name: data[1], type: data[2], db: db)
    pokemon
  end
    
  def alter_hp(new_hp, )
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, id)
  end  

end
