class UsersController < Clearance::UsersController
	
	private

	def user_from_params
	    email = user_params.delete(:email)
	    password = user_params.delete(:password)
	    birthday = user_params.delete(:birthday)
	    profile_picture = user_params.delete(:profile_picture)

	    Clearance.configuration.user_model.new(user_params).tap do |user|
	      user.email = email
	      user.password = password
	      user.avatar = profile_picture
	    end
	end

end