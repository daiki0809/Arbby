class LevelsController < ApplicationController
	def update
		user = current_user
		challenge = Challenge.find(params[:id])
		hobby = Hobby.find(challenge.hobby.id)
		challenge.times = challenge.times + 1
		user.user_point = user.user_point + hobby.hobby_point
		next_level = Level.find(user.level_id + 1)
		if user.user_point >= next_level.level_point
			i = next_level.id
			while user.user_point >= next_level.level_point
				next_level = Level.find(i + 1)
				i = i + 1
			end
			user.level_id = i - 1
		end
		challenge.save
		user.save
		redirect_to user_path(user.id)
	end
end
