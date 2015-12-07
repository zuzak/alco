require 'httparty'
class Checkout < ActiveRecord::Base
    has_many :line_items, dependent: :destroy
    validates :address, presence: true
    validates :email, presence: true, uniqueness: true, email_format: { message: 'is not an email address' }
    validates :name, presence: true

    def add_orders_from_cart(cart,params)
        dispatches = {"Contoso Ltd."=>[], "Northwind Traders"=>[]}
        cart.orders.each do |item|
            currentwine = Wine.find(item.wine_id)
            item.cart_id = nil
            dispatches[currentwine.supplier].push({currentwine.name => item.quantity})
        end
        dispatches["customer"] = params
        dispatch(dispatches)
    end

    def dispatch(dispatch)
        suppliers = {
            "Contoso Ltd." => "http://contoso.upstream.localhost",
            "Northwind Traders" => "http://northwind.upstream.localhost"
        }
        suppliers.each do | name, url |
            payload = {
                "customer": dispatch['customer'],
                "orders": dispatch[name]
            }
            HTTParty.post(url + '/SendOrder', body: payload.to_json, headers: { "Content-Type" => "application/json" })
        end
    end

end
