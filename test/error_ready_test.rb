require "test_helper"

class ErrorReadyTest < ActiveSupport::TestCase
  test "it has a version number" do
    assert ErrorReady::VERSION
  end

  test "configuration" do
    ErrorReady.configure do |config|
      config.host = "test.com"
      config.api_key = '1234'
    end

    assert_equal "test.com", ErrorReady.configuration.host
    assert_equal "1234", ErrorReady.configuration.api_key
  end
end
