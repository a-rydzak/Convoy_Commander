class ConvoysController < ApplicationController

  def convoy_page
  	@user=User.find(session[:id])
  	@convoy_plans=ConvoyPlan.where(user_id: session[:id])
  end

  def create_convoy
  	# convoy_plan=ConvoyPlan.new(ConvoyPlan_params)
  	convoy_plan=ConvoyPlan.new(title: params[:title])

   	if convoy_plan.valid?
      	 ConvoyPlan.create(title: params[:title], user_id: session[:id])
      	 Permission.create(user_id: session[:id])
     	 redirect_to :back
    else
      	flash[:errors]=product.errors.full_messages
      	redirect_to :back
   	end
  end

def specefic_convoy
	@user=User.find(session[:id])
	@convoy=ConvoyPlan.find(params[:id])
	@vehicles=Vehicle.where(convoy_plan_id: params[:id])
	@plan=Plan.find(params[:id])
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
