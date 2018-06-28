class SoldiersController < ApplicationController
  before_action :authenticate_login

  def create
  	  	@soldier=Soldier.create(soldier_name: params[:soldier_name], rank: params[:rank], position: params[:position], vehicle_id: params[:vehicle_id], convoy_plan_id: params[:id])
  		redirect_to :back
  end

  def delete
  	  	@soldier=Soldier.find(params[:id]).delete
  		redirect_to :back
  end

    private
    def authenticate_login
    	if session[:id] == nil
    		flash[:errors] = ["You must be logged in to access this section"]
    		redirect_to :root
    	end
    end
end
