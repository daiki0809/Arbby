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
  end

  def show
  end

  def edit
  end

  private

  	def hobby_params
  		params.require(:hobby).permit(:title, :body, :user_id, :genre_id, :budget, :hobby_point, {images: []})
  	end
end
