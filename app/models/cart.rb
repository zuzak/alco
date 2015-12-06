class Cart < ActiveRecord::Base
    has_many :orders, dependent: :destroy

    def add_wine(wine_id)
        curr = orders.find_by(wine_id: wine_id)
        if curr
            curr.quantity += 1
        else
            curr = orders.build(wine_id: wine_id)
        end
        curr
    end
end
