require 'test_helper'

class TestColor < Minitest::Test
  def test_name
    assert_match /\A[a-z]+\z/, FFaker::Color.name
  end
end
