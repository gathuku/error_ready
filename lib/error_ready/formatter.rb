module ErrorReady
  class Formatter
    def initialize(error:, handled:, severity:, context:, source: nil)
      @error = error 
      @handled = handled
      @severity = severity
      @context = context
      @source = source
    end

    def format
      {
        error_message: @error.message,
        error_class: @error.class,
        backtrace: @error.backtrace,
        severity: @severity,
        context: @context,
        source: @source
      }
    end
  end
end
