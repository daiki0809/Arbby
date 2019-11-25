class CreateNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :notices do |t|
      t.boolean :judgement
      t.text :reason

      t.timestamps
    end
  end
end
