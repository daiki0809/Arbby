class AdminHobbiesController < ApplicationController

	before_action :authenticate_admin!

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
      	@comments = @hobby.hobby_comments.where(reply_comment: nil)
     	@replies = @hobby.hobby_comments.where.not(reply_comment: nil)
	end

	def destroy
		@hobby = Hobby.find(params[:id])
		@hobby.destroy
		redirect_to admin_hobbies_path
	end

	def search
		@q = Hobby.ransack(search_params)
		@hobbies = @q.result.page(params[:page]).reverse_order
		@sort = "true"
		render action: :index
	end

	private

	def search_params
	  params.require(:q).permit(:sorts)
	end
end
