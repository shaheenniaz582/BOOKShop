require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../publisher.rb")

class TestPublisher < MiniTest::Test

  def setup
    options = {"id" => 1, "name" => "Bloomsburry"}
    @publisher = Publisher.new(options)
  end

  def test_publisher()
    result = @publisher.name
    assert_equal("Bloomsburry", result)
  end

end
