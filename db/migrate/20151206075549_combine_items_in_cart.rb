class CombineItemsInCart < ActiveRecord::Migration
    def up
        sums = cart.orders.group(:wine_id).sum(:quantity)
        sums.each do |wine_id, quantity|
            if quantity > 1
                cart.orders.where(wine_id: wine_id).delete_all

                item = cart.orders.build(wine_id: wine_id)
                item.quantity = quantity
                item.save!
            end
        end
    end

  def change
  end
end
