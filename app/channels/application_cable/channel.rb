module ApplicationCable
  class Channel < ActionCable::Channel::Base
    def current_user
      @request.env[:clearance].current_user
    end
  end
end
