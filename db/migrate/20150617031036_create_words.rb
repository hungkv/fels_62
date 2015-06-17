class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|

    	t.integer :category_id, null: false
    	t.string :content, null: false
      t.timestamps null: false
    end
  end
end
