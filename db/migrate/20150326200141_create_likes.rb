class CreateLikes < ActiveRecord::Migration
  def up
    create_table :likes do |t|

		t.column "answer_id", :integer
		t.column "user_id", :integer

      t.timestamps
	  
    end
  end
  
  def down
  drop_table :likes
  end
end
