require "debug"

class SyncSenderTest < ActiveSupport::TestCase
  setup do
    @error = sample_error
  end

  test "send success " do
    stub_request(:post, "https://example.com")
      .with(
        body: @error,
        headers: {
          "APP-SECRET" => "1234"
        }
      )
      .to_return(status: 200, body: "", headers: {})

    response = ErrorReady::SyncSender.new(@error).send_request
    assert_equal "200", response.code
  end

  test "send unathorized" do
    stub_request(:post, "https://example.com")
      .with(
        body: @error,
        headers: {"APP-SECRET": ""}
      )
      .to_return(body: '{message: "App with secret not found"}', status: 401)

    ErrorReady.configure do |config|
      config.app_secret = ""
    end

    response = ErrorReady::SyncSender.new(@error).send_request
    assert_equal "401", response.code
  end

  test "send with localhost" do
    stub_request(:post, "http://localhost:3000")
      .with(
        body: @error,
        headers: {
          "APP-SECRET" => "1234"
        }
      )
      .to_return(status: 200, body: "", headers: {})

    ErrorReady.configure do |config|
      config.host = "http://localhost:3000"
    end

    response = ErrorReady::SyncSender.new(@error).send_request
    assert_equal "200", response.code
  end

  private

  def sample_error
    JSON.parse(File.read(error_file_path))
  end

  def error_file_path
    File.join(ErrorReady.root, "test/files/error.json")
  end
end
