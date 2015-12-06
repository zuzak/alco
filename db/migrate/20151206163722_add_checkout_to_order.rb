class AddCheckoutToOrder < ActiveRecord::Migration
  def change
    add_reference :orders, :checkout, index: true, foreign_key: true
  end
end
