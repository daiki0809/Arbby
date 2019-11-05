class CreateHobbies < ActiveRecord::Migration[5.2]
  def change
    create_table :hobbies do |t|
      t.integer :user_id
      t.integer :genre_id
      t.json :images
      t.text :title
      t.text :body
      t.integer :budget
      t.integer :hobby_point

      t.timestamps
    end
  end
end
