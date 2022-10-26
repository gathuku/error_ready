module ErrorReady
  class ProblemsController < ApplicationController
    before_action :set_problem, only: %i[ show destroy ]

    # GET /problems
    def index
      @problems = Problem.latest_first
    end

    # GET /problems/1
    def show
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_problem
        @problem = Problem.find(params[:id])
      end
  end
end
