require_relative('../db/sql_runner')

class Book

  attr_reader( :id, :title, :buying_price, :selling_price,
               :description, :stock_quantity, :author_id)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @buying_price = options['buying_price'].to_i
    @selling_price = options['selling_price'].to_i
    @description = options['description']
    @stock_quantity = options['stock_quantity'].to_i
    @author_id = options['author_id'].to_i
  end

  # --------- CRUD --------

  #  !!!CREATE!!!

  def save()
    sql = "INSERT INTO books
          (title, buying_price, selling_price,
          description, stock_quantity, author_id )
          VALUES($1, $2, $3, $4, $5, $6)RETURNING id"
    values = [@title, @buying_price, @selling_price,
             @description, @stock_quantity,@author_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  #  !!!READ!!!

  def self.all()
    sql = "SELECT * FROM books"
    results = SqlRunner.run( sql )
    return results.map { |hash_bk| Author.new(hash_bk) }
  end

  #  !!!UPDATE!!!

  def update()
      sql = "UPDATE books SET (title, buying_price, selling_price,
            description, stock_quantity, author_id) = ($1, $2, $3, $4, $5,$6)
      WHERE id = $7"
      values = [@title, @buying_price,@selling_price, @description,
               @stock_quantity, @author_id, @id]
      SqlRunner.run(sql, values)
    end

  #  !!!DELETE!!!

  def self.delete_all()
    sql = "DELETE FROM books"
    SqlRunner.run( sql )
  end

  #  !!!DELETE BY ID

  def delete()
    sql = "DELETE from books where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  # !!!FIND BY ID

  def self.find( id )
    sql = "SELECT * FROM books
          WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Book.new( results.first )
  end


end