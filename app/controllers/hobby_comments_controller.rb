class HobbyCommentsController < ApplicationController

	def create
		@hobby = Hobby.find(params[:hobby_id])
		hobby_comment = current_user.hobby_comments.new(hobby_comment_params)
		hobby_comment.hobby_id = @hobby.id
		if params[:reply] == "true"
			hobby_comment.reply_comment = params[:comment_id]
		end
		if hobby_comment.save
		else
			@alert = true
		end
		@comment = HobbyComment.new
		comments_get(@hobby)
	end

	def destroy
		comment = HobbyComment.find(params[:hobby_id])
		@hobby = comment.hobby
		comment.destroy
		@comment = HobbyComment.new
		comments_get(@hobby)
	end

	def update
		comment = HobbyComment.find(params[:hobby_id])
		@hobby = comment.hobby
		if comment.private == false
			comment.private = true
			@private = "true"
		else
			comment.private = false
		end
		comment.save
		@comment = HobbyComment.new
		comments_get(@hobby)
	end

	private

	def hobby_comment_params
		params.require(:hobby_comment).permit(:comment, :user_id, :hobby_id, :private)
	end

	def comments_get(hobby)
		if hobby.user == current_user
	      @comments = hobby.hobby_comments.where(reply_comment: nil)
	      @replys = hobby.hobby_comments.where.not(reply_comment: nil)
	    else
	      no_private_comments = hobby.hobby_comments.where(private: false).where(reply_comment: nil)
	      my_private_comments = hobby.hobby_comments.where(private: true).where(user_id: current_user.id)
	      @comments = no_private_comments + my_private_comments
	      @replys = hobby.hobby_comments.where.not(reply_comment: nil)
    	end
	end
end
