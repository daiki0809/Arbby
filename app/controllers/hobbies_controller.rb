class HobbiesController < ApplicationController

  before_action :authenticate_user!

  def new
  	@hobby = Hobby.new
  end

  def create
  	@hobby = Hobby.new(hobby_params)
  	if params[:unit] == "b"
  		@hobby.budget = @hobby.budget * 1000
  	elsif params[:unit] == "c"
  		@hobby.budget = @hobby.budget * 10000
  	end
  	@hobby.user_id = current_user.id
  	@hobby.genre_id = params[:genre]
  	if @hobby.save
  	   redirect_to hobbies_path
    else
      flash.now[:danger] = "入力不十分な項目があります。"
      render action: :new
    end
  end

  def index
    if params[:q].present?
      @search = "true"
      @genre_id = params[:q][:genre_id_eq]
    end
     # 検索機能
    @q = Hobby.ransack(params[:q])
    @hobbies = @q.result(distinct: true).page(params[:page]).reverse_order
  end

  def show
    @hobby = Hobby.find(params[:id])
    @comment = HobbyComment.new
    if @hobby.user == current_user
      @comments = @hobby.hobby_comments.where(reply_comment: nil)
      @replies = @hobby.hobby_comments.where.not(reply_comment: nil)
    else
      no_private_comments = @hobby.hobby_comments.where(private: false).where(reply_comment: nil)
      my_private_comments = @hobby.hobby_comments.where(private: true).where(user_id: current_user.id)
      @comments = no_private_comments + my_private_comments
      @replies = @hobby.hobby_comments.where.not(reply_comment: nil)
    end
  end

  def edit
    @hobby = Hobby.find(params[:id])
    if @hobby.user != current_user
      redirect_to hobby_path(@hobby.id)
    end
  end

  def update
    @hobby = Hobby.find(params[:id])
    if @hobby.user != current_user
      redirect_to hobbies_path
    end
    @hobby.genre_id = params[:genre]
    if params[:unit] == "b"
      @hobby.budget = params[:provisional].to_i * 1000
    elsif params[:unit] == "c"
      @hobby.budget = params[:provisional].to_i * 10000
    else
      @hobby.budget = params[:provisional].to_i
    end
    if @hobby.update(hobby_params)
      redirect_to hobby_path(@hobby.id)
    else
      flash.now[:danger] = "入力不十分な項目があります。"
      render action: :edit
    end
  end

  def destroy
    hobby = Hobby.find(params[:id])
    if hobby.user != current_user
      redirect_to hobbies_path
    end
    hobby.destroy
    redirect_to hobbies_path
  end

  def search
    @q = Hobby.ransack(search_params)
    @hobbies = @q.result.page(params[:page]).reverse_order
    @sort = "true"
    render action: :index
  end

  private

  	def hobby_params
  		params.require(:hobby).permit(:title, :body, :user_id, :genre_id, :budget, :hobby_point, {images: []})
  	end

    def search_params
      params.require(:q).permit(:sorts)
    end
end
