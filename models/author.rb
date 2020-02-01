require_relative('../db/sql_runner')

class Author

  attr_reader( :id, :name)

  # ------CONSTRUCTOR------

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  # --------- CRUD --------

  #  !!!CREATE!!!

  def save()
    sql = "INSERT INTO authors(name)
          VALUES($1)RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  #  !!!READ!!!

  def self.all()
    sql = "SELECT * FROM authors"
    results = SqlRunner.run( sql )
    return results.map { |hash_athr| Author.new(hash_athr) }
  end

  #  !!!UPDATE!!!

  def update()
      sql = "UPDATE authors SET (name) = ($1)
      WHERE id = $2"
      values = [@name, @id]
      SqlRunner.run(sql, values)
    end

  #  !!!DELETE!!!

  def self.delete_all()
    sql = "DELETE FROM authors"
    SqlRunner.run( sql )
  end

  #   !!!!DELETE BY ID

  def delete()
    sql = "DELETE from authors where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  # !!!FIND BY ID

  def self.find( id )
    sql = "SELECT * FROM authors
          WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Author.new( results.first )
  end

  # Finds by author name

  def self.find(name)
    sql = "SELECT * FROM authors
          WHERE name = $1"
    values = [name]
    results = SqlRunner.run(sql, values)
    return Author.new( results.first )
  end


end
