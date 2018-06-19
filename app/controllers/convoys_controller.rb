class ConvoysController < ApplicationController

  def convoy_page
  	@user=User.find(session[:id])
  	@convoy_plans=ConvoyPlan.where(user_id: session[:id])
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
   # def ConvoyPlan_params
   #    params.require(:ConvoyPlan).permit(:title)
   # end 

   # def Permission_params
   #    params.require(:Permission).permit(:title)
   # end 

end
