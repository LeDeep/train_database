require 'pg'
require 'rspec'
require 'line'
require 'stop'
require 'station'

DB = PG.connect(:dbname => 'trains_test')

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM stop *;")
    DB.exec("DELETE FROM line *;")
    DB.exec("DELETE FROM station *;")
  end
end