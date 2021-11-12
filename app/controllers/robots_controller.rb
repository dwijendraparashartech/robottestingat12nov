class RobotsController < ApplicationController
	skip_before_action :verify_authenticity_token
	def new
		@robot=Robot.new
	end

	def create
		@robot=Robot.new(params[:robot])
		@robot.execute_commands!
	    return render json: {location: @robot.report}
	end
end
