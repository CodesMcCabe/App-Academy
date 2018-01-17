class CreateQuestion < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :poll_id, null: false
      t.string :body, null: false
      t.timestamps
    end
    add_index :questions, :poll_id
  end
end
