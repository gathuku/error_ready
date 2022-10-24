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

      # Save to database
      if ErrorReady.configuration.database_notifier 
       Database.new(formatted_error).call
      end

      # send Async
      AsyncSender.new(formatted_error).call
    end
  end
end
