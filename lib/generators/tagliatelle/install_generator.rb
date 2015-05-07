module Tagliatelle
  module Generators
    class InstallGenerator < Rails::Generators::Base
      def create_tag_model
        create_file "app/models/tag.rb" do
          <<-END.strip_heredoc
            class Tag < ActiveRecord::Base
              include Tagliatelle::Tag
            end
          END
        end
      end

      def create_tagging_model
        create_file "app/models/tagging.rb" do
          <<-END.strip_heredoc
            class Tagging < ActiveRecord::Base
              include Tagliatelle::Tagging
            end
          END
        end
      end

      def copy_migrations
        system("bundle exec rake tagliatelle:install:migrations")
      end
    end
  end
end
