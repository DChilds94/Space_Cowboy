require("PG")

class SpaceCowboy

attr_reader :id
attr_accessor :name, :favourite_weapon, :last_known_location, :bounty_value

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @favourite_weapon = options['favourite_weapon']
    @last_known_location = options['last_known_location']
    @bounty_value = options['bounty_value'].to_i
  end

  def save()
    db = PG.connect({dbname: "space_cowboys", host: "localhost"})
    sql = "INSERT INTO bounty (name, favourite_weapon, last_known_location, bounty_value)
    VALUES ($1, $2, $3, $4) RETURNING id ;"
    values = [@name, @favourite_weapon, @last_known_location, @bounty_value]
    db.prepare("save", sql)
    results = db.exec_prepared("save", values)
    db.close
  end

  def update()
    db = PG.connect({dbname: "space_cowboys", host: "localhost"})
    sql = "UPDATE bounty SET (name, favourite_weapon, last_known_location, bounty_value) = ($1, $2, $3, $4) WHERE id = $5"
    values = [@name, @favourite_weapon, @last_known_location, @bounty_value, @id]
    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close
  end

  def delete()
    db = PG.connect({dbname: "space_cowboys", host: "localhost"})
    sql = "DELETE FROM bounty WHERE id = $1"
    values = [@id]
    db.prepare("delete", sql)
    db.exec_prepared("delete", values)
    db.close
  end

  def delete_all()
    db = PG.connect({dbname: "space_cowboys", host: "localhost"})
    sql = "DELETE FROM bounty"
    db.prepare("delete_all", sql)
    db.exec_prepared("delete_all")
    db.close
  end

  def self.all()
    db = PG.connect({dbname: "space_cowboys", host: "localhost"})
    sql = "SELECT * FROM bounty"
    db.prepare("all", sql)
    bounty_list = db.exec_prepared("all")
    db.close
    return bounty_list.map {|list| SpaceCowboy.new(list)}
  end

  def self.find_by_name(name)
    db = PG.connect({dbname: "space_cowboys", host: "localhost"})
    sql = "SELECT name FROM bounty WHERE name = $1"
    values = [@name]
    db.prepare("name", sql)
    cowboy = db.exec_prepared("name", values)
    db.close()
  
    p cowboy.each {|list| SpaceCowboy.new}

  end

end
