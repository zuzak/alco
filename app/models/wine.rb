class Wine < ActiveRecord::Base
    has_many :orders

    before_destroy :ensure_unreferenced

    validates :name, :short_desc, presence: true
    validates :price, numericality: {greater_than_or_equal_to: 0.01}
    validates :origin, length: {maximum: 2} # fairly pointless

    validate :origin_is_iso
    validate :image_exists

    def origin_is_iso
        # http://stackoverflow.com/a/25061130
        errors.add(:origin, "must be a valid country") unless ISO3166::Country[origin]
    end

    def image_exists
        errors.add(:image, "must exist on the server") unless File::exists?('app/assets/images/' + image.to_s)
    end

    private

    def ensure_unreferenced
        if orders.empty?
            return true
        else
            errors.add(:base, 'Still has orders!')
            return false
        end
    end
end
