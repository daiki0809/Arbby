class HobbiesController < ApplicationController
  def new
  	@hobby = Hobby.new
  end

  def create
  	hobby = Hobby.new(hobby_params)
  	if params[:unit] == "b"
  		hobby.budget = hobby.budget * 1000
  	elsif params[:unit] == "c"
  		hobby.budget = hobby.budget * 10000
  	end
  	hobby.user_id = current_user.id
  	hobby.genre_id = params[:genre]
  	hobby.save
  	redirect_to hobbies_path
  end

  def index
     # 検索機能
    @q = Hobby.ransack(params[:q])
    @hobbies = @q.result(distinct: true)
  end

  def show
    @hobby = Hobby.find(params[:id])
  end

  def edit
    @hobby = Hobby.find(params[:id])
  end

  def update
    hobby = Hobby.find(params[:id])
    hobby.genre_id = params[:genre]
    if params[:unit] == "b"
      hobby.budget = params[:provisional].to_i * 1000
    elsif params[:unit] == "c"
      hobby.budget = params[:provisional].to_i * 10000
    end
    hobby.update(hobby_params)
    redirect_to hobby_path(hobby.id)
  end

  def destroy
    hobby = Hobby.find(params[:id])
    hobby.destroy
    redirect_to hobbies_path
  end

  private

  	def hobby_params
  		params.require(:hobby).permit(:title, :body, :user_id, :genre_id, :budget, :hobby_point, {images: []})
  	end
end
