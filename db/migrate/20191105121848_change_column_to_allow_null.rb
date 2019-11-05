class ChangeColumnToAllowNull < ActiveRecord::Migration[5.2]
  def up
  	change_column :users, :nickname,:text, null: true
  end

  def down
  	change_column :users, :nickname,:text, null: false
  end
end
