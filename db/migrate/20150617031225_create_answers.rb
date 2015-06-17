class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|

    	t.integer :word_id, null: false
    	t.boolean :is_true
      t.timestamps null: false
    end
  end
end
