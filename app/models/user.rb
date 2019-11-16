class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

         mount_uploader :profile_image, ProfileImageUploader

         has_many :hobbies, dependent: :destroy
         has_many :challenges, dependent: :destroy
         has_many :events, dependent: :destroy
         has_many :surprises, dependent: :destroy


         belongs_to :level

         acts_as_paranoid
# ツイッターでログインの記述
    def self.find_for_oauth(auth)
    	user = User.where(uid: auth.uid, provider: auth.provider).first

         unless user
         	user = User.create(
         		uid: auth.uid,
         		provider: auth.provider,
         		email: User.dummy_email(auth),
         		password: Devise.friendly_token[0, 20],
         		profile_image: auth.info.image,
         		name: auth.info.name,
         		)
         end

         user
     end

     private
# ツイッターログインでメールアドレスが持ってこれないので、ダミーを準備
     def self.dummy_email(auth)
     	"#{auth.uid}-#{auth.provider}@example.com"
     end

end
