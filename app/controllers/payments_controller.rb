class PaymentsController < ApplicationController

  def new
    @client_token = Braintree::ClientToken.generate
    @total_cost = 0
    @consult_sessions = params[:consult_sessions].keys
    params[:consult_sessions].keys.each do |id|
      @consultant_session = ConsultantSession.find(id)
      @total_cost += @consultant_session.rate     
    end
  end

  def create
    nonce = params[:payment_method_nonce]
    render action: :new and return unless nonce
    result = Braintree::Transaction.sale(
      amount: params[:total_cost],
      payment_method_nonce: params[:payment_method_nonce]
    )
    byebug
    if result.success?
      @consult_sessions.each do |id|
        @consultant_session = ConsultantSession.find(id)
        @consultant_session.update(user_id: current_user.id, session_active_inactive: false)
      end
      redirect_to root_path
    else
      render :new
    end
    
  end
  
end
