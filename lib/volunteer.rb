require 'pry'

class Volunteer
  attr_reader :name, :project_id, :id

  def initialize(attributes)
    @id = attributes.fetch(:project_id)
    @name = attributes.fetch(:name)
  end

  def ==(equal)
    @name == equal.name
  end

  def save
    volunteer = DB.exec("INSERT INTO volunteers (name) VALUES ('#{@name}') RETURNING id;")
    @id = volunteer.first().fetch("id").to_i
  end

  def delete
    DB.exec("DELETE FROM volunteers WHERE id = #{@id};")
  end

  def update(name)
    @name = name
    db.exec("UPDATE volunteers SET name = '#{@name}' WHERE id = #{@id};")
  end


end
