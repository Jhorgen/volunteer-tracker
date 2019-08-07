require('sinatra')
require('sinatra/reloader')
require('pry')
require("pg")
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "volunteer_tracker"})

get ('/') do
  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:index)
end
