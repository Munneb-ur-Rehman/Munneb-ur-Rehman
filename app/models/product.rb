class Product < ApplicationRecord
    
    has_one_attached :image
    validates :name, presence: true
    validates :price, presence: true
    validates :description, presence: true
    validates :image, presence: true
    has_many :comments, dependent: :destroy 
    has_many :product_items
    belongs_to :user
    
    def ensure_not_product_item
    
        if product_items.empty?
            return true
            else
                    errors.add(:base, 'you have product items')
                    return false
            end
    end
end
