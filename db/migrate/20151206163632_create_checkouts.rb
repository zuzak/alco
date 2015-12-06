class CreateCheckouts < ActiveRecord::Migration
  def change
    create_table :checkouts do |t|
      t.string :name
      t.text :address
      t.string :email

      t.timestamps null: false
    end
  end
end
