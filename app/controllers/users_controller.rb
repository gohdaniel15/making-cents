class UsersController < Clearance::UsersController

	def create
	    @user = user_from_params
	    if @user.save
	      # ConfirmationMailer.confirmation_email(@user).deliver
	      sign_in @user
	      redirect_back_or url_after_create
	    else
	      render template: "users/new"
	    end
	  end


	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
        if @user.update(filtered_user_params)
          redirect_to root_path
        else
          flash[:alert] = 'Error'
          render :edit
        end
    end

	private

	def user_from_params
	    email = user_params.delete(:email)
	    password = user_params.delete(:password)
	    birthday = user_params.delete(:birthday)
	    profile_picture = user_params.delete(:avatar)

	    Clearance.configuration.user_model.new(user_params).tap do |user|
	      user.email = email
	      user.password = password
	      user.avatar = profile_picture
	    end
	end

	def edit_user_params
		params.require(:user).permit(:email, :password, :birthday, :avatar)
	end

	def filtered_user_params
		if edit_user_params[:password].empty?
			edit_user_params.except(:password)
		else
			edit_user_params
		end
	end

end
