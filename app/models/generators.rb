require 'securerandom'

module Generators
  module GPID
    module_function

    def generate
      "pg-#{SecureRandom.uuid}"
    end
  end

  module GCID
    module_function

    def generate
      "ch-#{SecureRandom.uuid}"
    end
  end
end
