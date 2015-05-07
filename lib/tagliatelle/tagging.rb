module Tagliatelle
  module Tagging
    extend ActiveSupport::Concern

    included do
      belongs_to :taggable, polymorphic: true
      belongs_to :tag

      validates :tag, uniqueness: { scope: [:taggable_id, :taggable_type] }
    end
  end
end
