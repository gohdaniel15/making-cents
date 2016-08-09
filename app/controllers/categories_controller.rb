class CategoriesController < ApplicationController

	def loans
		@category = Category.includes(consultants: :user).where("category_name like ?", "Loans")
	end

	def index
		@categories = Category.all
	end
end
