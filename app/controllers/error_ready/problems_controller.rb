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

    # DELETE /problems/1
    def destroy
      @problem.destroy
      redirect_to problems_url, notice: "Problem was successfully destroyed."
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_problem
        @problem = Problem.find(params[:id])
      end
  end
end
