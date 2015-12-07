class Order < ActiveRecord::Base
  belongs_to :wine
  belongs_to :checkout
  belongs_to :cart
end
