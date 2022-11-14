module ErrorReady
  class Configuration
    include ActiveSupport::Configurable 

    config_accessor :host, default: "https://errorready.com/api/problems"
    config_accessor :database_notifier, default: false
    config_accessor :app_secret
  end
end
