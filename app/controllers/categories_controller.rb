class CategoriesController < ApplicationController

	def loans
		@category = Category.includes(consultants: :user).where("category_name like ?", "Loans")
	end

	def tax
		@category = Category.includes(consultants: :user).where("category_name like ?", "Tax")
	end

	def investments
		@category = Category.includes(consultants: :user).where("category_name like ?", "Investments")
	end

	def personal_finance
		@category = Category.includes(consultants: :user).where("category_name like ?", "Personal Finance")
	end

	def insurance
		@category = Category.includes(consultants: :user).where("category_name like ?", "Insurance")
	end

	def trading
		@category = Category.includes(consultants: :user).where("category_name like ?", "Trading")
	end

	def index
		@categories = Category.all
	end

  def create
    Category.create(category_params)
  end

  private

  def category_params
    params.require(:category).permit(:category_name)
  end
end
