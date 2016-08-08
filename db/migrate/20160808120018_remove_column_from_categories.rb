class RemoveColumnFromCategories < ActiveRecord::Migration[5.0]
  def change
    remove_column :categories, :consultant_id
  end
end
