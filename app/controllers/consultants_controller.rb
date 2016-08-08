class ConsultantsController < ApplicationController
	before_action :require_login

	def new
		@consultant = Consultant.new
	end

	def create
		@user_id = :user_id
		@consultant = current_user.consultants.new(consultant_params)
		if @consultant.save
			redirect_to edit_consultant_path(@consultant)
		else
			render :action => "new"
		end
	end

	def show
		@consultant = Consultant.find(params[:id])
	end

	def index
		@consultants = Consultant.all
	end

	def edit
		@consultant = Consultant.find(params[:id])
	end

	def update
		@consultant = Consultant.find(params[:id])
		#	@consultant = Consultant.find_by(user_id: params[:user_id])?

		if  @consultant.update_attributes(consultant_params)
			@consultant.user.name = params[:consultant][:user][:name]
			@consultant.description = params[:consultant][:description]
			@consultant.save!
			@consultant.user.save!
			redirect_to :action => 'show', :id => @consultant
		else
			render :action => 'edit'
	 	end
	end

   def delete
      Consultant.find(params[:id]).destroy
      redirect_to :action => 'list'
   end

	private
		def consultant_params
	   params.require(:consultant).permit(:qualifications, :languages, :location, :user_id)
	   # params.require(:user).permit(:name, :email)
		end

		# def updated_consultant_params
		# 	params.require(:consultant).permit(:name)
		# end
end
