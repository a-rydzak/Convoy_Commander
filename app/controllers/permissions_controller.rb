
class PermissionsController < ApplicationController
  def update
  	user_convoys=ConvoyPlan.where(user_id: session[:id])
  	user_convoys.each do |convoy|
  		if Permission.where(user_id: session[:id],invited_user: params[:id], convoy_plan_id: convoy.id).empty?
  			permission=Permission.create(user_id: session[:id],invited_user: params[:id], permission_plan: "NO", permission_vehicle: "NO" , permission_view: "NO", convoy_plan_id: convoy.id)
  		end
  	end
  	redirect_to :back
  end

  def update_create_view
  	puts '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
  	Permission.create(user_id: session[:id], permission_plan: "NO", permission_vehicle:"NO", permission_view: "NO", invited_user: params[:vuid], convoy_plan_id: params[:id])
  	# puts params[:id]
  	# puts params[:vuid]
  	# Permission.where(user_id: session[:id], invited_user: params[:vuid]).update(convoy_plan_id: params[:id])
 	redirect_to :back
  end
end
