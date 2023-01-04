ErrorReady.configure do |config|
  # Get app_secret in(errorready.com), add it in rails credentials or env
  # error_ready:
  #   app_secret: 1234
  config.app_secret = Rails.application.credentials.dig(:error_ready, :app_secret)

  # Ignored environments
  # error will not be reported for this environments
  config.ignored_environments = ["development", "test"]
end
