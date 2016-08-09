class Consultant < ApplicationRecord
	belongs_to :user
	has_many :category_consultants
	has_many :categories, through: :category_consultants, foreign_key: 'category_id'
	has_many :users
	has_many :consultant_sessions

	validates :qualifications, :languages, :location, presence: true

end
