require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../book.rb")

class TestGener < MiniTest::Test

  def setup
    options = {"id" => 1, "title" => "Zaviya", "buying_price" => 10,
              "selling_price" => "12","description" => "AAA","stock_quantity" => 45,
              "author_id" => 1,"publisher_id" => 1,"gener_id" => "1" }
    @book = Book.new(options)
  end

  def test_title()
    result = @book.title
    assert_equal("Zaviya", result)
  end

  def test_buying_price()
    result = @book.buying_price
    assert_equal(10, result)
  end

  def test_selling_price()
    result = @book.selling_price
    assert_equal(12, result)
  end

  def test_description()
    result = @book.description
    assert_equal("AAA", result)
  end

  def test_publisher_id()
    result = @book.publisher_id
    assert_equal(1, result)
  end

  def test_author_id()
    result = @book.author_id
    assert_equal(1, result)
  end

  def test_gener_id()
    result = @book.gener_id
    assert_equal(1, result)
  end

end
