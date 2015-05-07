module Tagliatelle
  module Tag
    extend ActiveSupport::Concern

    included do
      has_many :taggings, dependent: :destroy

      validates :name, presence: true
    end

    def to_s
      name
    end
  end
end
