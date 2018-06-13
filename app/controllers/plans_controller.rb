class PlansController < ApplicationController

  def update_plan
  	Plan.update(params[:id], situation: params[:situation],mission: params[:mission],execution: params[:execution], service_support: params[:service_support])
  	redirect_to :back
  end

  private
  	 # def Plan_params
    #    params.require(:Plan).permit(:situation, :mission, :execution, :service_support, :command_signal)
    #  end 
end
