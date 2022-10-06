module ErrorReady
  class Database
    def initialize(formatted_error)
      @error = formatted_error
    end
    
    def call
      problem = ErrorReady::Problem.find_or_create_by(
        message: @error[:message],
        err_class: @error[:err_class],
        environment: @error[:environment],
        severity: @error[:severity]
      )
      
      create_notice(problem)
    end

    def create_notice(problem)
      ActiveRecord::Base.transaction do
        ErrorReady::Notice.create(
          problem: problem,
          backtrace: @error[:backtrace],
          context: @error[:context]
        )

        problem.update(
          notices_count: problem.notices_count + 1,
          last_notice_at: Time.current,
        )
      end
    end
  end
end
