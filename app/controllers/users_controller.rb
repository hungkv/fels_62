class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
  end

  def update
    if current_user.update_attributes user_params
    	flash[:notice] = "User update successfully"
    	redirect_to root_path
    else
    	flash[:notice] = "User update faild"
    	redirect_to :edit
    end
  end

  private
  def user_params
    params.require(:user).permit :avatar, :email, :name
  end
end
