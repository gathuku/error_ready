module ErrorReady
  class AsyncSender
    def initialize(formatted_error)
      @error = formatted_error
    end

    def call
      SyncSender.new(@error).async.call
    end
  end
end
