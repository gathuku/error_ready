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
        message: @error.message,
        err_class: @error.class.to_s,
        backtrace: @error.backtrace,
        severity: @severity.to_s,
        context: @context.transform_values(&:to_s),
        source: @source,
        environment: Rails.env
      }
    end
  end
end
