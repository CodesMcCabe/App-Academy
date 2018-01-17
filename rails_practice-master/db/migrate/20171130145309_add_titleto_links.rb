class AddTitletoLinks < ActiveRecord::Migration[5.1]
  def change
    change_table :links do |t|
      t.remove :body, :link_id
      t.string :title, null: false
      t.string :url, null: false
    end
  end
end
