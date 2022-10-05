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

      binding.break
    end
  end
end
