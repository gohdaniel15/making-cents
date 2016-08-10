class ConsultantSessionsController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_consultant_session, only: [:destroy, :show, :edit, :update]

  def index
    @consultant_sessions = ConsultantSession.all
  end

  def show
  end

  def new
    @consultant_session = ConsultantSession.new
  end

  def edit
  end

  def create
    @consultant_session_default = current_user.consultant_sessions.new(listing_params)
    # save 1st one here
    @consultant_session = current_user.consultant_sessions.new(listing_params)
    @consultant_session.end_time = @consultant_session.start_time + (15*60)
    @consultant_session.save
    @consultant_session_default.start_time = @consultant_session.start_time + (15*60)
    #start loop
    until @consultant_session_default.start_time == @consultant_session_default.end_time do
      @consultant_session = current_user.consultant_sessions.new(listing_params)
      @consultant_session.start_time = @consultant_session_default.start_time
      @consultant_session.end_time = @consultant_session.start_time + (15*60)
      @consultant_session.save
      @consultant_session_default.start_time += (15*60)
    end

    redirect_to consultant_path(current_user.consultants.last)

    # @consultantSession = current_user.consultantSession.new(listing_params)
    # number_of_slots = @consultantSession.end_time - @consultantSession.start_time)/(15*60)

    # number_of_slots.times do
      # @consultantSession = current_user.consultantSessions.new(listing_params)
      # @consultantSession.update(end_time: @consultantSession.start_time+ 15*60)
      # @consultantSession.save
    # end

    # if @consultantSession.save
      # redirect_to @consultant_session #redirect to show path of this particular found object
      # #same as redirect_to consultant_session_path(@consultant_session)
    # else
      # render :new
    # end
  end

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
  
  def book
    params[:consult_sessions].keys.each do |id|
      @consultant_session = ConsultantSession.find(id)
      @consultant_session.update(user_id: current_user.id, session_active_inactive: false)
    end
    
  redirect_to root_path

  #add user_id to consultant_session
  # disable session marked
  end

  private
  def listing_params #white list of permitted parameters only
    params.require(:consultant_session).permit(:start_time, :end_time, :session_active_inactive, :rate, :consultant_id)
  end

  def set_consultant_session
     @session = ConsultantSession.find(params[:id])
  end

end
