class Consultant < ApplicationRecord
	belongs_to :user
	has_many :users
	validates :qualifications, :languages, :location, presence: true

end