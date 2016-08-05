class RemoveColumnsFromConsultants < ActiveRecord::Migration[5.0]
  def change
  		remove_column :consultants, :availability, :integer
  		remove_column :consultants, :ratings, :float
  		remove_column :consultants, :class_size, :integer
  end
end
