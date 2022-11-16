require "test_helper"

class ErrorReadyTest < ActiveSupport::TestCase
  test "it has a version number" do
    assert ErrorReady::VERSION
  end

  test "configuration" do
    assert_equal "https://example.com", ErrorReady.configuration.host
    assert_equal "1234", ErrorReady.configuration.app_secret
  end
end
