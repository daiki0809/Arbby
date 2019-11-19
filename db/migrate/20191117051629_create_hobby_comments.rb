class CreateHobbyComments < ActiveRecord::Migration[5.2]
  def change
    create_table :hobby_comments do |t|
      t.integer :user_id
      t.integer :hobby_id
      t.text :comment
      t.integer :reply_comment
      t.boolean :private, default: false

      t.timestamps
    end
  end
end
