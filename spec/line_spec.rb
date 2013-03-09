require 'spec_helper'

describe Line do 
  context '#initialize' do 
    it 'initializes an instance of the line class' do
    line = Line.new('Red')
    line.should be_an_instance_of Line
    end
  end

  context '#save' do 
    it 'should save line and set id equal to database id field' do 
      line = Line.new('Red')
      line.save
      line.id.should_not be_nil
    end
  end

  context 'Reader' do 
    it 'should give us the id of the line object' do 
      line = Line.new('Red', 14)
      line.id.should eq 14
    end
  end


  context '.all' do 
    it 'shows all of the lines in the DB' do
      line = Line.new('Red')
      line.save
      Line.all.length.should eq 1
    end
  end

  # context '#view_stations' do 
  #   it 'shows all stations for the line' do 
  #     line = Line.new('Blue')
  #     line.save
  #     station = Station.new('Washington')
  #     station.save
  #     Line.view_stations.should eq 'Washington'
  #   end
  # end


  # context '#search_line_id' do 
  #   it 'searches for the train lines that match the line id' do
  #     line = Line.new('Blue')
  #     line.save
  #     Line.search_line_id(line.id).should eq line
  #   end
  # end
end