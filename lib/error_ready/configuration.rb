module ErrorReady
  class Configuration
    include ActiveSupport::Configurable 

    config_accessor :host, default: "https://errorready.free.beeceptor.com"
    config_accessor :database_notifier, default: false
    config_accessor :api_key
  end
end
