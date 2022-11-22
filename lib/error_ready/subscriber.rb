module ErrorReady
  class Subscriber
    def report(error, handled:, severity:, context:, source: nil)
      formatted_error = Formatter.new(
        error: error,
        handled: handled,
        severity: severity,
        context: context,
        source: source
      ).format

      # send Async
      return if ErrorReady.configuration.ignored_environments.include?(Rails.env)

      AsyncSender.new(formatted_error).call
    end
  end
end
