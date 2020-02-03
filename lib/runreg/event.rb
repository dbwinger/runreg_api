require 'ostruct'

module Runreg
  class Event < OpenStruct
    def initialize hash
      hash.keys.each do |key|
        if key.match?(/Date/) && hash[key]
          hash[key] = Runreg::Event.convert_datetime(hash[key])
        end
      end

      super hash
    end

    # Date/times come in format /Date(1592625600000-0400)/
    def self.convert_datetime string
      DateTime.strptime(string, '/Date(%Q%z)/').to_s
    end
  end
end
