class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:github]
  has_many :comments

  def self.find_for_github_oauth(access_token)
    user = User.find_by(email: access_token.info.email)
    unless user
      user = User.create(
        email: access_token.info.email,
        password: Devise.friendly_token[0, 20]
      )
    end
    user.name = access_token.info.name
    user.username = access_token.info.nickname
    user.image = access_token.info.image
    user.uid = access_token.uid
    user.provider = access_token.provider
    user.save
    user
  end

  def admin?
    admin
  end
end
