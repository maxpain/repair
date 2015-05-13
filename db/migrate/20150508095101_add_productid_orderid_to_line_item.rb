class AddProductidOrderidToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :product_id, :integer, null: false
    add_column :line_items, :order_id, :integer, null: false
  end
end
