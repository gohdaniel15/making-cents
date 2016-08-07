class AddBirthdayToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :birthday, :string
  end
end
