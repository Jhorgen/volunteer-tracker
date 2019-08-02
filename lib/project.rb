require 'pry'

class Project
attr_reader :id, :title

def initialize(attributes)
  @id = attributes.fetch(:project_id)
  @title = attributes.fetch(:title)
end

def ==(equal)
  @title == equal.title
end

def save
  project = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
  @id = project.first().fetch("id").to_i
end

def delete
  DB.exec("DELETE FROM projects WHERE id = #{@id};")
end







end
