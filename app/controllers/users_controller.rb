class UsersController < ApplicationController
  def show
  	@viewed_user=User.find(params[:id])
  	@user_convoys=User.find(session[:id]).convoy_plans
  	@user_permissions=Permission.where(user_id: session[:id])
  	@permission=Permission.where(user_id: session[:id], invited_user: params[:id])
  	session[:pid]=@permission.ids
  end


end
