require 'pry'

class Project
  attr_reader :id, :title

  def initialize(attributes)
    @id = attributes[:id]
    @title = attributes[:title]
  end

  def ==(equals)
    @title == equals.title
  end

  def save
    project = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
    @id = project.first().fetch("id").to_i
  end

  def delete
    DB.exec("DELETE FROM projects WHERE id = #{@id};")
  end

  def update(title)
    @title = title
    db.exec("UPDATE projects SET name = '#{@title}' WHERE id = #{@id};")
  end

  def self.all
    db_records = DB.exec("SELECT * FROM projects")
    db_records.map { |db_record| Project.new_from_db(db_record) }
  end






end
