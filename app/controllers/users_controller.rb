class UsersController < ApplicationController
  def show
  	@viewed_user=User.find(params[:id])
  	@user_convoys=ConvoyPlan.includes(:permissions).where('permissions.user_id': session[:id], 'permissions.invited_user': params[:id])
    @user_permissions=Permission.where(user_id: session[:id])
  end


end
