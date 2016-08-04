class ConsultantsController < ApplicationController
	before_action :require_login #, :get_user_id

	def new 
		@consultant = Consultant.new
	end 

	def create
		byebug
		@consultant = User.first.consultants.new(consultant_params)
		byebug
		if @consultant.save
			redirect_to :action => 'edit'
		else
			render :action => 'new'
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

		if @consultant.update_attributes(consultant_params)
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
	   params.require(:consultant).permit(:qualifications, :languages, :location)
	end
end