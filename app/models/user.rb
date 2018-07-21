class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable, omniauth_providers: [:google_oauth2]

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  def self.from_omniauth(data)
  	user= User.find_by(email:data.email)
  	if user.blank?
  		user=User.create(email:data.email,password:Devise.friendly_token)
  	end
  	return user
  end

 def set_auth_token
    self.auth_token = SecureRandom.uuid

    self.save

    # ideally, check the validity of the auth token and then either return a new one or the same if valid

  end

end
