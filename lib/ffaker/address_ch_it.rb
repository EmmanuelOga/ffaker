

require 'ffaker/address_ch'

module FFaker
  module AddressCHIT
    include AddressCH

    extend ModuleUtils
    extend self

    def canton
      CANTON.sample
    end
  end
end
