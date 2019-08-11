require './lib/project'
require './lib/volunteer'
require('sinatra')
require('sinatra/reloader')
require('pry')
require("pg")
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "volunteer_tracker"})

get ('/') do
  @projects = Project.all
  erb(:index)
end

# post('/new_project') do
#   Project.new({:title => params[:title]}).save
#   erb(:index)
# end
