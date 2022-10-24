require "error_ready/version"
require "error_ready/engine"

module ErrorReady
  autoload :Subscriber, "error_ready/subscriber"
  autoload :RackMiddleware, "error_ready/rack_middleware"
  autoload :Formatter, 'error_ready/formatter'
  autoload :Configuration, "error_ready/configuration"

  # notifiers
  autoload :Database, "error_ready/notifiers/database"
  autoload :SyncSender, "error_ready/notifiers/sync_sender"
  autoload :AsyncSender, "error_ready/notifiers/async_sender"

  class << self 
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield configuration
    end
  end
end
