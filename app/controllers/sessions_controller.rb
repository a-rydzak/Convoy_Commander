class SessionsController < ApplicationController
	before_action :authenticate_login, except: [:make_user, :login, :logout, :new]


	def new
		if(!session[:id])
			session[:id]=nil
		end
	end


	def make_user
		user=User.new(register_params)
		if user.valid?
	    	@user=User.create(register_params)
	     	flash[:success]="Succesfully created a new user please login"
	     	redirect_to :back
	    else
	      	flash[:errors]=user.errors.full_messages
	      	redirect_to :back
	   	end
	end

	def login
	    @user = User.find_by_email(params[:email])
	    if @user.nil?
	      flash[:errors] = ['User does not exist']
	      redirect_to :back
	    else
	      if @user.authenticate(params[:password])
	        session[:id] = @user.id
	        redirect_to '/convoy'
	      else
	        flash[:errors] = ['User Password And Email Combination Does Not Exist']
	        redirect_to :back
	      end
    	end
 	end


 	def logout
		session[:id]=nil
		redirect_to '/new'
	end

################# Private Params
  private
    def register_params
      params.require(:user).permit(:user_name, :email,:password, :password_confirmation)
    end 

    def authenticate_login
    	if session[:id] == nil
    		flash[:errors] = ["You must be logged in to access this section"]
    		redirect_to '/new'
    	end
    end
end
