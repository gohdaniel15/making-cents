class ConsultantSessionsController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_consultant_session, only: [:destroy, :show, :edit, :update]
  
  def index
    @consultant_sessions = ConsultantSession.all
  end
  
  # def show
  # end
  
  # def new
    # @consultant_session = ConsultantSession.new
  # end
  
  # def edit
  # end
  
  # def create
    # @consultant_session = current_user.consultantSessions.new(listing_params)
    # if @consultantSession.save
      # redirect_to @consultant_session #redirect to show path of this particular found object
      # #same as redirect_to consultant_session_path(@consultant_session)
    # else
      # render :new
    # end
  # end
  
  # def update
    # @consultant_session.update(listing_params)
    # if @consultant_session.save
      # redirect_to @consultant_session
    # else
      # render :edit
    # end
  # end
  
  # def destroy
    # if @consultant_session.destroy
      # redirect_to consultant_sessions_path
    # end
  # end
  
  # private
  # def listing_params #white list of permitted parameters only
    # params.require(:consultant_session).permit()
  # end
  
  def set_consultant_session
     @session = ConsultantSession.find(params[:id])
  end
  
end
