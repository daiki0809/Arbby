class CreateLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :levels do |t|
      t.integer :level_point

      t.timestamps
    end
  end
end
