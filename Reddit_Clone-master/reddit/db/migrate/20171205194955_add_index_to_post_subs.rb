class AddIndexToPostSubs < ActiveRecord::Migration[5.1]
  def change
    add_index :post_subs, :sub_id
  end
end
