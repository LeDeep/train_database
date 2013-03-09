require 'spec_helper'

describe Station do 
  context '#initialize' do 
    it 'initializes an instance of the station class' do
    station = Station.new('Red')
    station.should be_an_instance_of Station
    end
  end

  context '#save' do 
    it 'saves a station name to the DB' do 
      station = Station.new('Red')
      station.save
    end
  end

  context '.all' do 
    it 'shows all of the stations in the DB' do
      station = Station.new('Red')
      station.save
      Station.all.length.should eq 1
      Station.all.first.should be_an_instance_of Station
    end
  end

  # context '#search_station_id' do 
  #   it 'searches for the station that match the argument' do
  #     station = Station.new({'station' => 'Washington'})  
  #     Station.search_station_id(station.id)[0].station.should eq station
  #   end
  # end
end