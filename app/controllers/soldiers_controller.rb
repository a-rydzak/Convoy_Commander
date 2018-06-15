class SoldiersController < ApplicationController
  def create
  	  	@soldier=Soldier.create(soldier_name: params[:soldier_name], rank: params[:rank], position: params[:position], vehicle_id: params[:id])
  		redirect_to :back
  end
end
