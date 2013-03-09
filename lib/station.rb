class Station


  attr_reader :name, :id

  def initialize(name, id=nil)
    @name = name
    @id = id
  end


  def save
    @id = DB.exec("INSERT INTO station (name) VALUES ('#{name}') RETURNING id;").first['id']
  end

    
  def self.all
    DB.exec("SELECT * FROM station;").inject([]) { |station, station_hash| station << Station.new(station_hash['name'], station_hash['id']) }
  end


 # def self.search_station_id(station_id)
 #    Station.from_pg_result(DB.exec("SELECT * FROM station WHERE id = '#{station_id}';"))
 #  end



end
