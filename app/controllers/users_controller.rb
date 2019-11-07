class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@hobbies = @user.hobbies
  end

  def edit
  	@user = current_user
  end

  def update
  	user = current_user
  	user.update(user_params)
  	redirect_to user_path(user.id)
  end

  private
   def user_params
   	params.require(:user).permit(:name, :nickname, :profile_image)
   end
end
