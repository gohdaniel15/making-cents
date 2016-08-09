class AddRateToConsultantSessions < ActiveRecord::Migration[5.0]
  def change
    add_column :consultant_sessions, :rate, :integer, null: false
  end
end
