class AddBodytoComments < ActiveRecord::Migration[5.1]
  def change
    change_table :comments do |t|
      t.remove :title, :url
      t.text :body, null: false
    end
  end
end
