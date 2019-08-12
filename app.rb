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
  erb :index
end

post('/new_project') do
  Project.new({:title => params[:title]}).save
  redirect to ('/')
end

get ('/projects/:project_id')do
  @project = Project.find(params[:project_id])
  erb (:projects)
end

get('/edit_projects/:project_id/edit') do
  @project = Project.find(params[:id])
  erb(:edit_projects)
end

post('/edit_projects') do
  'hello world'
end

post ('/edit_projects/:project_id/edit')do
    title = params[:title]
    id = params[:project_id].to_i
    project = Project.find(id)
    project.update({:title => title})
    redirect to ('/')
end

patch('/edit_projects/:project_id/edit') do
  project = Project.find(params[:id])
  project.update({:title => params[:title]})
  redirect to "projects/#{project.id}"
end

get ('/volunteers')do
    @volunteer = Volunteer.find(params[:project_id])
    erb :volunteer
end
