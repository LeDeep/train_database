require 'pg'
require './lib/line'
require './lib/station'
require './lib/stop'

DB = PG.connect(:dbname => 'trains')

def welcome
  puts "Welcome to the THE TRAIN APP!"
  operator_menu
end

def operator_menu
  choice = nil
  until choice == 'e'
    puts "Press 'l' to add a line, 's' to add a station, 'v' to view stops."
    puts "Press 'e' to exit."
    choice = gets.chomp
    case choice
      when 'l'
      add_line
      when 's'
      add_station
      when 'v'
      view
      when 'e'
      exit
      else
      invalid
    end
  end
end

def add_line
  puts "Add the name of the line:"
  line_name = gets.chomp
  line = Line.new(line_name)
  line.save
end

def add_station
  puts "Add the name of the station:"
  station_name = gets.chomp
  station = Station.new(station_name)
  station.save
end



def view
choice = nil
  until choice == 'x'
    puts "Press 'l' to view lines for a given station, 's' to view stations for a given line."
    puts "Press 'x' to exit."
    choice = gets.chomp
    case choice
    when 'l'
      view_lines
    when 's'
      view_stations
    when 'x'
      exit
    else
      invalid
    end
  end
end

def view_lines
  puts "Which line do you want to view" #SHOWS ALL THE STOPS FOR A SPECIFIC LINE
  line_choice = gets.chomp
  #add search method to retrieve line id.
  line.view_stations.each { |station| puts station.name }
end


# def view_stations
#   puts "Which station do you want to view" #SHOWS ALL THE LINES THAT GO THROUGH A SPECIFIC STATION
#   station.view.each { |line| puts line.name }

# end

def exit
  puts "Exiting."
end

def invalid
  puts "Invalid entry."
end


welcome
