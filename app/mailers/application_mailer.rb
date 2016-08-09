class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  # First, instantiate the Mailgun Client with your API key
  # mg_client = Mailgun::Client.new ENV['MAILGUN_API_KEY']

  # Define your message parameters
  # message_params =  { :from => "Mailgun Sandbox <postmaster@sandboxcf16d4ca185444e6a351a8d698085083.mailgun.org>",
  #                     :to => "Shalina Abdul Gaffor <shalina_gaffor@hotmail.com>",
  #                     :subject => "Hello Shalina Abdul Gaffor",
  #                     :text => "Congratulations Shalina Abdul Gaffor"
  #                 }

  # Send your message through the client
  # mg_client.send_message ENV['DOMAIN'], message_params
# end
