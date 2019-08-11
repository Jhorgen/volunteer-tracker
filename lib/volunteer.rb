require 'pry'

class Volunteer
  attr_reader :name, :project_id, :id

  def initialize(attributes)
    @id = attributes[:project_id]
    @name = attributes[:name]
  end

  def ==(volunteer)
    @name == volunteer.name
  end

  def save
    volunteer = DB.exec("INSERT INTO volunteers (name) VALUES ('#{@name}') RETURNING id;")
    @id = volunteer.first().fetch("id").to_i
  end

  def delete
    DB.exec("DELETE FROM volunteers WHERE id = #{@id};")
  end

  def self.clear
    DB.exec("DELETE FROM  *;")
  end

  def update(name)
    @name = name
    db.exec("UPDATE volunteers SET name = '#{@name}' WHERE id = #{@id};")
  end

  def self.all
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    returned_volunteers.each() do |volunteer|
      name = volunteer.fetch("name")
      id = volunteer.fetch("id").to_i
      volunteers.push(Project.new({:name => name, :id => id}))
    end
    volunteers
  end

  def self.find(id)
    volunteer = DB.exec("SELECT * FROM volunteers WHERE id = #{id};").first
    name = volunteer.fetch("name")
    id = volunteer.fetch("id").to_i
    Volunteer.new({:name => name, :id => id})
  end


end
