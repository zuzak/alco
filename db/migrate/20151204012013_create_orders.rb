class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :wine, index: true, foreign_key: true
      t.belongs_to :cart, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
