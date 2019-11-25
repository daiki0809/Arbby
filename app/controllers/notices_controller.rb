class NoticesController < ApplicationController

	def index
		@users = User.where(:notice_id => 2..4)
	end

	def update
		user = User.find(params[:id])
		user.notice_id = params[:notice_id]
		user.save
	end

	def destroy
		user = User.find(params[:id])
		user.destroy
		@users = User.where(:notice_id => 2..4)
	end
end
