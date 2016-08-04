class CreateConsultants < ActiveRecord::Migration[5.0]
  def change
    create_table :consultants do |t|
    	t.references :users, foreign_key: true
    	t.string :qualifications #, null: false
    	t.string :languages
    	t.float :ratings, default: 0.00
    	t.string :location # null: false 
    	t.string :description
    	t.integer :availability, default: 1 
    	#set as 1 being available and 0 as not available? 
    	t.integer :class_size, default: 1  

    	t.timestamps null: false
    end
  end
end

# add_index :users
# polymorphic: true, index: true