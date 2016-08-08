class CreateCategoryConsultants < ActiveRecord::Migration[5.0]
  def change
    create_table :category_consultants do |t|
      t.references :category, foreign_key: true
      t.references :consultant, foreign_key: true

      t.timestamps
    end
  end
end
