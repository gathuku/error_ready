module ErrorReady
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Created an ErrorReady initializer file"

      source_root File.expand_path("templates", __dir__)

      def create_initializer_file
        template "error_ready.rb", "config/initializers/error_ready.rb"
      end
    end
  end
end
