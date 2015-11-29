class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :name
      t.text :desc
      t.string :short_desc
      t.decimal :price, precision: 5, scale: 2
      t.string :image,
      t.string :origin
      t.boolean :vegetarian
      t.string :supplier

      t.timestamps null: false
    end
  end
end
