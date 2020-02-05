require_relative('../db/sql_runner')

class Gener

  attr_reader( :id, :gener)

  # ------CONSTRUCTOR------

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @gener = options['gener']
  end

  # --------- CRUD --------

  #  !!!CREATE!!!

  def save()
    sql = "INSERT INTO geners(gener)
    VALUES($1)RETURNING id"
    values = [@gener]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  #  !!!READ!!!

  def self.all()
    sql = "SELECT * FROM geners"
    results = SqlRunner.run( sql )
    return results.map { |hash| Gener.new( hash ) }
  end

  #  !!!UPDATE!!!

  def update()
    sql = "UPDATE geners SET (gener) = ($1)
    WHERE id = $2"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  #  !!!DELETE!!!

  def self.delete_all()
    sql = "DELETE FROM geners"
    SqlRunner.run( sql )
  end

  #   !!!!DELETE BY ID

  def delete()
    sql = "DELETE from geners where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  # !!!FIND BY ID

  def self.find( id )
    sql = "SELECT * FROM geners
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values).first
    gener = Gener.new( results)
    return gener
  end

  # Finds by author name

  def self.find_by_gener(gener)
    sql = "SELECT * FROM geners
    WHERE name = $1"
    values = [gener]
    results = SqlRunner.run(sql, values)
    return Gener.new( results.first )
  end

  def books()
    sql = "SELECT title FROM books
    WHERE books.gener_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |book| Book.new( book ) }

  end

end
