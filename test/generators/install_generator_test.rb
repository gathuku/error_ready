require "test_helper"
require "generators/error_ready/install_generator"

class InstallGeneratorTest < Rails::Generators::TestCase
  tests ErrorReady::Generators::InstallGenerator

  destination File.expand_path("../../tmp", __dir__)

  setup :prepare_destination

  test "create initializer" do
    run_generator

    assert_file "config/initializers/error_ready.rb"
  end
end
