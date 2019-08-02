require('sinatra')
require('sinatra/reloader')
require('pry')
require("pg")
also_reload('lib/**/*.rb')

# DB = PG.connect({:dbname => ""})

get ('/')do
erb :index
end
