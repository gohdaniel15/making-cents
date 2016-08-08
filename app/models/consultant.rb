class Consultant < ApplicationRecord
	belongs_to :user
	has_many :category_consultants
	has_many :categories, through: :category_consultants, foreign_key: 'category_id'
	has_many :users

	validates :qualifications, :languages, :location, presence: true

end
