# frozen_string_literal: true

require 'helper'

class TestAddressNL < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::AddressNL,
    :city, :province, :street_address, :street_name, :zip_code
  )

  def setup
    @tester = FFaker::AddressNL
  end

  def test_city
    assert_match(/[ a-z]+/, @tester.city)
  end

  def test_province
    assert_match(/[ a-z]/, @tester.province)
  end

  def test_zip_code
    assert_match(/\A[1-9]\d{3} ?(?!sa|sd|ss)[A-Z]{2}\z/, @tester.zip_code)
  end

  def test_street_name
    assert_match(/[ a-z]+/, @tester.street_name)
  end

  def test_street_address
    assert_match(/[ a-z]+/, @tester.street_address)
  end
end
