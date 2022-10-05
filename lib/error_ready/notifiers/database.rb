module ErrorReady
  module Notifier
    class Database
      def initialize(formatted_error)
        @error = formatted_error
      end
      
      def create_problem
        ErrorReady::Problem.create(
          error_message: @error['error_message'],
        )
      end

      def create_notice
        ErrorReady::Notice.create(
        )
      end
    end
  end
end
