require "test_helper"

class ErrorReadyTest < ActiveSupport::TestCase
  test "it has a version number" do
    assert ErrorReady::VERSION
  end

  test "configuration" do
    ErrorReady.configure do |config|
      config.host = "test.com"
      config.app_secret = '1234'
    end

    assert_equal "test.com", ErrorReady.configuration.host
    assert_equal "1234", ErrorReady.configuration.app_secret
  end
end
