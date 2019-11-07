class ChallengesController < ApplicationController

	def create
		@hobby = Hobby.find(params[:hobby_id])
		challenge = current_user.challenges.new(hobby_id: @hobby.id)
		challenge.save
	end

	def destroy
		@hobby = Hobby.find(params[:hobby_id])
		challenge = current_user.challenges.find_by(hobby_id: @hobby.id)
		challenge.destroy
	end

end
