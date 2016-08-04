class User < ApplicationRecord
  include Clearance::User
  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy

end
