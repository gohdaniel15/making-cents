class AddVideoSessionIdToConsultantSessions < ActiveRecord::Migration[5.0]
  def change
    add_column :consultant_sessions, :video_sessions_id, :string
  end
end
