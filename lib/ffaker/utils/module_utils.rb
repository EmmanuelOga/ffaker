# frozen_string_literal: true

require_relative 'array_utils'
require_relative 'random_utils'
require_relative 'unique_utils'

module FFaker
  module ModuleUtils
    include RandomUtils

    def k(arg)
      FFaker::ArrayUtils.const_array(arg)
    end

    def const_missing(const_name)
      if const_name.match?(/[a-z]/) # Not a constant, probably a class/module name.
        super(const_name)
      else
        mod_name = ancestors.first.to_s.split('::').last
        data_path = "#{FFaker::BASE_LIB_PATH}/ffaker/data/#{underscore(mod_name)}/#{underscore(const_name.to_s)}"
        data = k File.read(data_path, mode: 'r:UTF-8').split("\n")
        const_set const_name, data
        data
      end
    end

    def underscore(string)
      string.gsub('::', '/')
            .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
            .gsub(/([a-z\d])([A-Z])/, '\1_\2')
            .tr('-', '_')
            .downcase
    end

    def unique(max_retries = 10_000)
      FFaker::UniqueUtils.add_instance(self, max_retries)
    end

    # http://en.wikipedia.org/wiki/Luhn_algorithm
    def luhn_check(number)
      sum = number.chars
                  .map(&:to_i)
                  .reverse
                  .each_with_index
                  .sum { |digit, index| index.even? ? (2 * digit).digits.sum : digit }
      ((10 - (sum % 10)) % 10).to_s
    end
  end
end
