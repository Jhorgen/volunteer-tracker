require('./lib/volunteer.rb')
require 'pry'

class Project
  attr_reader :title, :id

  def initialize(attributes)
    @id = attributes[:id]
    @title = attributes[:title]
  end

  def ==(project)
    self.title == project.title
  end

  def save
    project = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
    @id = project.first().fetch("id").to_i
  end

  def delete
    DB.exec("DELETE FROM projects WHERE id = #{@id};")
    DB.exec("DELETE FROM volunteers WHERE project_id = #{@id};")
  end

  def self.clear
    DB.exec("DELETE FROM projects *;")
  end

  def update(title)
    @title = title
    DB.exec("UPDATE projects SET title = '#{@title}' WHERE id = #{@id};")
  end

  def self.all
    returned_projects = DB.exec("SELECT * FROM projects;")
    projects = []
    returned_projects.each() do |project|
      title = project.fetch("title")
      id = project.fetch("id").to_i
      projects.push(Project.new({:title => title, :id => id}))
    end
    projects
  end

  def self.find(id)
    project = DB.exec("SELECT * FROM projects WHERE id = #{:id};").first
    title = project.fetch("title")
    id = project.fetch("id").to_i
    Project.new({:title => title, :id => id})
  end

  def volunteers
    Volunteer.find_by_project(self.id)
  end

end
