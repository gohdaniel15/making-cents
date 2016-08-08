class CategoriesController < ApplicationController

	def loans
		@category = Category.find_by(category_name: "Loans")
	end

	def index
		@categories = Category.all
	end
end
