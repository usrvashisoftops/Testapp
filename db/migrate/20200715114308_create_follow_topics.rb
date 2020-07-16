class CreateFollowTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :follow_topics do |t|
      t.integer :topic_id
      t.integer :user_id
      t.timestamps
    end
  end
end
