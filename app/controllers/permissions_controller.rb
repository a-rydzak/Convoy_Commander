
class PermissionsController < ApplicationController
  def update
  	permission=Permission.create(user_id: session[:id],invited_user: params[:id], permission_plan: "NO", permission_vehicle: "NO" )
  	redirect_to :back
  end

  def update_view
  	permission=Permission.find(session[:pid])
  	puts '!!!!!!!!!!!!!'
  	puts  permission.user_id
  	
  	# permission.convoy_plan_id = params[:id]
  	# permission.save
  	redirect_to :back
  end
end
