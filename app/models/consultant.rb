class Consultant < ApplicationRecord
	belongs_to :user
	validates :qualifications, :languages, :location, presence: true

end