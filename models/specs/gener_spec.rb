require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../gener.rb")

class TestGener < MiniTest::Test

  def setup
    options = {"id" => 1, "gener" => "Romance"}
    @gener = Gener.new(options)
  end

  def test_gener()
    result = @gener.gener
    assert_equal("Romance", result)
  end

end
