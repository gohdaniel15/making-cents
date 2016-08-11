class CreateConsultantSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :consultant_sessions do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :session_active_inactive

      t.references :consultant
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
