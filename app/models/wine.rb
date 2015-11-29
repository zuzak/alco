class Wine < ActiveRecord::Base
    validates :name, :short_desc, presence: true
    validates :price, numericality: {greater_than_or_equal_to: 0.01}
    validates :origin, length: {maximum: 2} # fairly pointless

    # http://stackoverflow.com/a/25061130
    validate :origin_is_iso

    def origin_is_iso
        errors.add(:origin, "must be a valid country") unless ISO3166::Country[origin]
    end
end
