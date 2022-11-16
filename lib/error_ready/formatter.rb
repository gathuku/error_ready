module ErrorReady
  class Formatter
    def initialize(error:, handled:, severity:, context:, source: nil)
      @handled = handled
      @severity = severity
      @context = context
      @source = source
      @error = wrapped_exception(error)
    end

    def format
      {
        message: @error.exception.message,
        err_class: @error.exception.class.to_s,
        severity: @severity.to_s,
        source: @source,
        environment: Rails.env,
        context: @context.transform_values(&:to_s),
        source_to_show: @error.source_extracts[@error.source_to_show_id],
        application_trace: @error.application_trace,
        full_trace: @error.full_trace
      }
    end

    def wrapped_exception(error)
      ActionDispatch::ExceptionWrapper.new(
        Rails::BacktraceCleaner.new,
        error
      )
    end
  end
end
