class Category < ApplicationRecord
	has_many :category_consultants
	has_many :consultants, through: :category_consultants, foreign_key: 'consultant_id'

end
