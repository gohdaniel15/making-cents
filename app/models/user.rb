class User < ApplicationRecord
  include Clearance::User
  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_one :consultant
  has_many :consultant_sessions
  has_many :user_consultants, through: :consultant_sessions

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.email = auth[:info][:email]
      user.password = ('0'..'z').to_a.shuffle.first(8).join
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

end
