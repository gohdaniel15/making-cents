class ConfirmationMailer < ApplicationMailer
	def confirmation_email(user)
	    @user = user
	    mg_client = Mailgun::Client.new ENV['MAILGUN_API_KEY']
	    message_params = {:from    => ENV['gmail_username'],
	                      :to      => @user.email,
	                      :subject => 'Sample Mail using Mailgun API',
	                      :text    => 'This mail is sent using Mailgun API via mailgun-ruby'}
	    mg_client.send_message ENV['DOMAIN'], message_params
	  end
end
