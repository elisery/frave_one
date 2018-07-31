class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      session[:user_id] = @user.id 
      redirect_to dashboard_path # THIS CHANGES TO DASHBOARD PATH
    else
      render :new 
    end
  end

  # user dashboard
  def show 
    # params[:id] == current_user.id 
    # @user = User.find(params[:id])
    @user = current_user
    # PUT VARIABLES ACCESSIBLE TO THE VIEW HERE
    
  end

  private
  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :email, :password, :password_confirmation
    )
  end
  
end
