class UsersController < ApplicationController
  def index
    @users = User.all.order(:id).page(params[:page]).per(5)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to :index
    else
      render :edit
    end

  end

private

def user_params
  params.require(:user).permit(:name, :email, :password, :zip, :address, :introduction)
end

end
