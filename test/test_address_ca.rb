# encoding: utf-8

require 'helper'

class TestAddressCA < Test::Unit::TestCase
  def test_province
    assert_match /[ a-z]/, FFaker::AddressCA.province
  end

  def test_province_abbr
    assert_match /[A-Z][A-Z]/, FFaker::AddressCA.province_abbr
  end

  def test_postal_code
    assert_match /[A-Z]\d[A-Z]\W\d[A-Z]\d/, FFaker::AddressCA.postal_code
  end
end
