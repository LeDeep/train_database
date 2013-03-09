class Line

  attr_reader :name, :id

  def initialize(name, id=nil)
    @name = name
    @id = id
  end


  def save
     @id = DB.exec("INSERT INTO line (name) VALUES ('#{name}') RETURNING id;").first['id']
  end
    
  def self.all
    Line.from_pg_result(DB.exec("SELECT * FROM line;"))
  end


  def self.view_stations
    Line.from_pg_result(DB.exec("SELECT station.name 
            FROM station, stop 
            WHERE #{@id} = stop.line_id 
            AND station.id = stop.station_id;"))
  end

 # def self.search_line_id(line_id)
 #    Line.from_pg_result(DB.exec("SELECT * FROM line WHERE id = '#{line_id}'"))
 #  end

  private

  def self.from_pg_result(pg_result)
    pg_result.inject([]) {|lines, line_hash| lines << Line.new(line_hash)}
  end


end
