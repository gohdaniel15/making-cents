class ChatroomWorker
  include Sidekiq::Worker

  def perform(method, user_id, title)
    if method == "create"
      @chat_room = User.find(user_id).chat_rooms.build(title: title)
      @chat_room.save
    elsif method == "destroy"
      @chatroom = ChatRoom.find_by(title: title).destroy
    end
  end
end

# ChatroomWorker.perform(method_name: "destroy", chatroom_id: 5)
# Add after action in model?
