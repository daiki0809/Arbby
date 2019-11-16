class SurprisesController < ApplicationController

	def create
		@hobby = Hobby.find(params[:hobby_id])
		surprise = current_user.surprises.new(hobby_id: @hobby.id)
		surprise.save
	end

	def destroy
		@hobby = Hobby.find(params[:hobby_id])
		surprise = current_user.surprises.find_by(hobby_id: @hobby.id)
		surprise.destroy
	end

end
