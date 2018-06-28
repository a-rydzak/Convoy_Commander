class PlansController < ApplicationController
	before_action :authenticate_login

  def update_plan
  	plan=Plan.new(params[:id], situation: params[:situation],mission: params[:mission],execution: params[:execution], service_support: params[:service_support])
  	if plan.valid?
  		Plan.update(params[:id], situation: params[:situation],mission: params[:mission],execution: params[:execution], service_support: params[:service_support])
  		redirect_to :back
  	else
  		flask[:errors]=plan.errors.full_messages
  		redirect_to :back
  	end
  end

  private
  	def authenticate_login
      if session[:id] == nil
        flash[:errors] = ["You must be logged in to access this section"]
        redirect_to :root
      end
    end
end
