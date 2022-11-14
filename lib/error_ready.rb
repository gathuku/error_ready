require "error_ready/version"
require "error_ready/engine"

module ErrorReady
  autoload :Subscriber, "error_ready/subscriber"
  autoload :Formatter, 'error_ready/formatter'
  autoload :Configuration, "error_ready/configuration"

  # middlewares
  autoload :RackMiddleware, "error_ready/middlewares/rack_middleware"

  # notifiers
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
