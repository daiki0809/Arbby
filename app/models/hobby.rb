class Hobby < ApplicationRecord
	mount_uploaders :images, ImageUploader

	belongs_to :genre
	belongs_to :user
	
		with_options presence: true do
		validates :user_id
		validates :genre_id
		validates :title
		validates :body
		validates :budget
		validates :hobby_point
	end
end
