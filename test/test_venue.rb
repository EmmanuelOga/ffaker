# encoding: utf-8

require File.dirname(__FILE__) + '/helper'

class TestVenue < Test::Unit::TestCase
  def test_name
    assert_match /1\+|[ a-z]+/i, Faker::Venue.name
  end
end
