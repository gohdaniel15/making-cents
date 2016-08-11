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
    consult_sessions = params[:payment][:consult_sessions].split(" ")
    nonce = params[:payment_method_nonce]
    render action: :new and return unless nonce
    result = Braintree::Transaction.sale(
      amount: params[:payment][:total_cost],
      payment_method_nonce: params[:payment_method_nonce]
    )
    if result.success?
      consult_sessions.each do |id|
        @consultant_session = ConsultantSession.find(id)
        @consultant_session.update(user_id: current_user.id, session_active_inactive: false)
      end 
      flash[:success] = 'Payment has been made successfully'
      redirect_to root_path
    else
      flash[:error] = 'There was a problem with payment. Please try again.'
      render :new
    end
  end
end
