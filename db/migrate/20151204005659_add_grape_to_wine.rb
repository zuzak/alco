class AddGrapeToWine < ActiveRecord::Migration
  def change
    add_column :wines, :grape, :string
  end
end
