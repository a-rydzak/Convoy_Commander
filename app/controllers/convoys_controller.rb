class ConvoysController < ApplicationController
  before_action :authenticate_login
  
  def convoy_page
  	@user=User.find(session[:id])
  	@convoy_plans=ConvoyPlan.where(user_id: session[:id])
    @all_users=User.all()
  end

  def create_convoy
  	# convoy_plan=ConvoyPlan.new(ConvoyPlan_params)
  	convoy_plan=ConvoyPlan.new(title: params[:title])

   	if convoy_plan.valid?
      	 convoy=ConvoyPlan.create(title: params[:title], user_id: session[:id])
         Plan.create(convoy_plan_id: convoy.id)
      	 Permission.create(user_id: session[:id])
     	 redirect_to :back
    else
      	# flash[:errors]=["Convoy title must be between 2-20 characters long."]
        flash[:errors]=convoy_plan.errors.full_messages
      	redirect_to :back
   	end
  end

def specefic_convoy
	@user=User.find(session[:id])
	@convoy=ConvoyPlan.find(params[:id])
  @soldiers=ConvoyPlan.find(params[:id]).soldiers
	@vehicles=Vehicle.where(convoy_plan_id: params[:id])
	@plan=@convoy.plan
end

def delete
  @convoy=ConvoyPlan.find(params[:id])
  @convoy.destroy
  redirect_to :back
end


################# Private Params

  private
    def authenticate_login
      if session[:id] == nil
        flash[:errors] = ["You must be logged in to access this section"]
        redirect_to :root
      end
    end

end
