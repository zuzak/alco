class AddImageToWines < ActiveRecord::Migration
  def change
    add_column :wines, :image, :string
  end
end
