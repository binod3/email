class UsersController < ApplicationController
	 


	 def index
    @users = User.all
  end


  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user_params])
    if @user.save
      UserMailer.signup_confirmation(@user).deliver
      redirect_to @user, notice: "Signed up successfully."
    else
      render :new
    end
  end



private
def user_params
  params.require(:users).permit(:name,:email)
end
end
