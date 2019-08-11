require 'pry'

class Project
  attr_reader :id, :title

  def initialize(attributes)
    @id = attributes[:id]
    @title = attributes[:title]
  end

  def ==(project)
    @title == project.title
  end

  def save
    project = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
    @id = project.first().fetch("id").to_i
  end

  def delete
    DB.exec("DELETE FROM projects WHERE id = #{@id};")
  end

  def self.clear
    DB.exec("DELETE FROM projects *;")
  end

  def update(title)
    @title = title
    db.exec("UPDATE projects SET name = '#{@title}' WHERE id = #{@id};")
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
    project = DB.exec("SELECT * FROM projects WHERE id = #{id};").first
    title = project.fetch("title")
    id = project.fetch("id").to_i
    Project.new({:title => title, :id => id})
  end







end
