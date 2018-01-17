class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :session_key, null: false
      t.timestamps
    end
    
    add_index :users, :session_key, unique: true
  end
end
