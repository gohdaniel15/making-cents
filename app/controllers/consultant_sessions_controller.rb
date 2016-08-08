class ConsultantSessionsController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_consultant_sessions, only: [:destroy, :show, :edit, :update]
  
  def index
  end
  
  def show
  end
  
  def new
  end
  
  def edit
  end
  
  def create
  end
  
  def update
  end
  
  def destroy
  end
  
    def set_consultant_session
     @session = consultant_session.find(params[:id])
  end
  
end
