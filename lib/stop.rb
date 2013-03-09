class Stop
  attr_reader :line, :station, :id


  def initialize(line, station, id=nil)
    @line = line
    @station = station
    @id = id
    # @line_id = attributes['line_id'].to_i
    # @line_name = attributes['']
    # @station_id = attributes['station_id'].to_i
    # @id = attributes['id'].to_i
  end

  def save
    # DB.exec("INSERT INTO stop VALUES (line.id, station.id);")
    @id = DB.exec("INSERT INTO stop (station_id, line_id) VALUES ('#{@station.id}', '#{@line.id}') RETURNING id;").first['id']
  end

  def view_stations_for_stop(id)
    DB.exec("SELECT station.name 
            FROM station, stop 
            WHERE #{line.id} = stop.line_id 
            AND station.id = stop.station_id;").inject([]) {|stops, stop_hash| stops << Stop.new(stop_hash)}
  end
end

#   def ==(other)
#       if other.class != self.class
#         false
#       else
#         self.line_id == other.line_id && self.station_id == other.station_id && self.id == other.id
#       end
#     end

#   def self.search_line_id(line_id)
#     Stop.from_pg_result(DB.exec("SELECT * FROM line WHERE id = '#{line_id}'"))
#   end

# private

#   def self.from_pg_result(pg_result)
#     pg_result.inject([]) {|books, book_hash| books << Stop.new(book_hash)}
#   end


