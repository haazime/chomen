require 'securerandom'

module Generators
  module GPID
    module_function

    def generate
      "pg-#{SecureRandom.uuid}"
    end
  end
end
