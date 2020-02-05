require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../author.rb")

class TestGener < MiniTest::Test

  def setup
    options = {"id" => 1, "name" => "J.K.Rowling"}
    @author = Author.new(options)
  end

  def test_author()
    result = @author.name
    assert_equal("J.K.Rowling", result)
  end

end
