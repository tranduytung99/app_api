class User < ApplicationRecord
  attr_accessor :access_token
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  has_one :authentication_token, dependent: :destroy

  after_create :generate_authentication_token


  def generate_authentication_token
    token =  SecureRandom.urlsafe_base64
    AuthenticationToken.create(user_id: self.id, token: token)
  end
end
