module Tagliatelle
  module Taggable
    extend ActiveSupport::Concern

    included do
      has_many :taggings, as: :taggable, dependent: :destroy
      has_many :tags, through: :taggings
    end

    def tag_list
      tags.map(&:name).join(", ")
    end

    def tag_list=(value)
      self.tags = value.split(",").map(&:strip).uniq.map do |tag|
        Tag.find_or_initialize_by(name: tag)
      end
    end

    module ClassMethods
      def tagged_with(tags)
        joins(:tags)
          .where(tags: { name: tags.map(&:to_s) })
          .preload(:tags)
          .distinct
      end
    end
  end
end
