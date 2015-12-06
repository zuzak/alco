module CurrentCart
    extend ActiveSupport::Concern

    private

    # give cart an ID, if there isn't one, make a new one
    def set_cart
        @cart = Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
        @cart = Cart.create
        session[:cart_id] = @cart.id
    end
end
