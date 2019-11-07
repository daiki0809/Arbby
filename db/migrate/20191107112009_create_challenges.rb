class CreateChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :challenges do |t|
      t.integer :user_id
      t.integer :hobby_id
      t.integer :times, default: 0

      t.timestamps
    end
  end
end
