class CreateConsultantSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :consultant_sessions do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.datetime :actual_end_time
      t.boolean :session_status
      t.float :rating
      t.string :review
     
      t.timestamps
    end
  end
end
