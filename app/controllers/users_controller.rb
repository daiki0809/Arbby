class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@hobbies = @user.hobbies
    level_point = @user.level.level_point
    next_point = Level.find(@user.level_id + 1).level_point - level_point
    actual_point = @user.user_point - level_point
    @percentage = (actual_point / next_point.to_f) * 100
    @event = Event.new
  end

  def edit
  	@user = current_user
  end

  def update
  	user = current_user
  	user.update(user_params)
  	redirect_to user_path(user.id)
  end

  def destroy
    current_user.really_destroy!
    redirect_to root_path
  end

  private
   def user_params
   	params.require(:user).permit(:name, :nickname, :profile_image)
   end
end
