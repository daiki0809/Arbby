class CreateSurprises < ActiveRecord::Migration[5.2]
  def change
    create_table :surprises do |t|
      t.integer :user_id
      t.integer :hobby_id

      t.timestamps
    end
  end
end
