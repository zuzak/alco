class AddSizeToWines < ActiveRecord::Migration
  def change
    add_column :wines, :size, :decimal, precision: 2, scale: 3
  end
end
