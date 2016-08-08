class ChangeConsultantsColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :consultants, :users_id, :user_id
  end
end
