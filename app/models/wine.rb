class Wine < ActiveRecord::Base
    validates :name, :short_desc, presence: true
    validates :price, numericality: {greater_than_or_equal_to: 0.01}
end
