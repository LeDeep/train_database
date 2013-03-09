require 'spec_helper'


describe Stop do 
  context '#initialize' do 
    it 'initializes stop with the line_id and station_id' do 
      # stop_information = {'line' => 'Blue', 'station' => 'Washington'}
      line = Line.new('Blue')
      station = Station.new('Meadowood')
      stop = Stop.new(line, station)
      stop.should be_an_instance_of Stop
    end
  end


  context '#save' do 
    it 'saves a line and a station as an instance of stop to the database' do 
      line = Line.new('Blue')
      line.save
      station = Station.new('Meadowood')
      station.save
      stop = Stop.new(line, station)
      stop.save.should eq stop.id
    end
  end

  context '.view_stations_for_stop' do 
    it 'shows all stations for a particular line' do 
      line = Line.new('Blue')
      line.save
      station = Station.new('Meadowood')
      station.save
      stop = Stop.new(line, station)
      stop.save
      stop.view_stations_for_stop(line).should eq [station]
    end
  end


#   context '#search_line_id' do 
#     it 'searches for the line that match the argument' do
#       line = Line.new({'line' => 'Blue'})
#       stop = Stop.new({'line' => line})
#       stop.save
#       Stop.search_line_id(stop.id)[0].line.should eq line
#     end
#   end

#   context '#==' do 
#     it 'should say the two objects are equal if their station_ids or line_ids are equal' do 
#       stop = Stop.new({'line_id' => 2, 'station_id' => 5 })
#       stop2 = Stop.new({'line_id' => 2, 'station_id' => 5 })
#       stop.should eq stop2
#     end
#   end
      


end



