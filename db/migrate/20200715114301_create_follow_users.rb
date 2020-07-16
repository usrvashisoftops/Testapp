class CreateFollowUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :follow_users do |t|
      t.integer :folow_user_id
      t.integer :user_id
      t.timestamps
    end
  end
end
