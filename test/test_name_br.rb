require 'test_helper'

class TestFakerNameBR < Minitest::Test
  def setup
    @tester = FFaker::NameBR
  end

  def test_name
    assert_match(/\A[a-zA-ZéúôóíáÍã\s]+\z/, @tester.name)
  end

  def test_name_with_prefix
    prefix, name = @tester.name_with_prefix.split(/\s+/)
    assert_includes(@tester::PREFIXES, prefix)
    assert(name.length > 0)
  end

  def test_first_name
    assert_includes(@tester::FIRST_NAMES, @tester.first_name)
  end

  def test_last_name
    assert_includes(@tester::LAST_NAMES, @tester.last_name)
  end

  def test_prefix
    assert_includes(@tester::PREFIXES, @tester.prefix)
  end
end
