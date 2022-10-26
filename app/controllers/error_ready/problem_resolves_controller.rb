module ErrorReady
  class ProblemResolvesController < ApplicationController
    before_action :set_problem

    def create
      @problem.update!(resolved_at: Time.current)
      
      redirect_to problems_path, notice: "Problem resolved"
    end

    private

    def set_problem
      @problem = Problem.find(params[:problem_id])
    end
  end
end
