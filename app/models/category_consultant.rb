class CategoryConsultant < ApplicationRecord
  belongs_to :category
  belongs_to :consultant
end
