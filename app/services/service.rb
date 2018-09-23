# frozen_string_literal: true

# To be included in every service
# and implement `call` public method for any processing
module Service
  extend ActiveSupport::Concern

  included do
    def self.call(*args)
      new(*args).call
    end
  end
end
