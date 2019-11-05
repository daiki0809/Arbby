class Hobby < ApplicationRecord
	mount_uploaders :images, ImageUploader
		with_options presence: true do
		validates :user_id
		validates :genre_id
		validates :title
		validates :body
		validates :budget
		validates :hobby_point
	end
end
