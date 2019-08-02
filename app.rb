require('sinatra')
require('sinatra/reloader')
require('pry')
require("pg")
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "volunteer_tracker", :password => "secret"})

get ('/')do
erb :index
end