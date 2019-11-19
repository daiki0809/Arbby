class Hobby < ApplicationRecord
	mount_uploaders :images, ImageUploader

	has_many :challenges, dependent: :destroy
	has_many :surprises, dependent: :destroy
	has_many :hobby_comments, dependent: :destroy

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

	ransacker :challenges_count do
		query = '(SELECT COUNT(challenges.hobby_id) FROM challenges where challenges.hobby_id = hobbies.id GROUP BY challenges.hobby_id)'
		Arel.sql(query)
	end

# ユーザがチャレンジをすでに押しているか？
	def challenge_by?(user)
		challenges.where(user_id: user.id).exists?
	end

# ユーザがびっくりをすでに押しているか？
	def surprise_by?(user)
		surprises.where(user_id: user.id).exists?
	end
end
