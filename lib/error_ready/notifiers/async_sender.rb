module ErrorReady
  class AsyncSender
    def initialize(formatted_error)
      @error = formatted_error
    end

    def call
      Thread.new do
        Rails.application.executor.wrap do
          SyncSender.new(@error).call
        end
      end
    end
  end
end
