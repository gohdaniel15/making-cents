class Payment < ApplicationRecord

  before_action do_some_security_activity_available, only: [:new, :create]

  def new
    @client_token = Braintree::ClientToken.generate
    @consultant_session = ConsultantSession.find_by(consultant_session_id: params[:])
    @payment = Payment.new
  end

  def create
    nonce = params[:payment_method_nonce]
    render action: :new and return unless nonce
    result = Braintree::Transaction.sale
      amount: "10.00",
      payment_method_nonce: params[:payment_method_nonce]
    )

    # reserve to save the transaction details into database

    redirect_to user_path
    
  def do_some_security_activity_available
  end

end
