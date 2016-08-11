class ConsultantSession < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :consultant, class_name: 'User'
  has_many :chat_rooms
end
