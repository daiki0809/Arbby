class UsersController < ApplicationController

  before_action :authenticate_user!

  def show
  	@user = User.find(params[:id])
  	@hobbies = @user.hobbies
    level_point = @user.level.level_point
    next_point = Level.find(@user.level_id + 1).level_point - level_point
    actual_point = @user.user_point - level_point
    @percentage = (actual_point / next_point.to_f) * 100  #次のレベルまでのゲージに使用
    @event = Event.new
  end

  def edit
  	@user = User.find(params[:id])
    if @user != current_user
      redirect_to edit_user_path(current_user.id)
    end
  end

  def update
  	@user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(@user.id)
    end
  	if @user.update(user_params)
  	 redirect_to user_path(@user.id)
    else
      flash.now[:danger] = "入力不十分の項目があります。"
      render action: :edit
    end
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
