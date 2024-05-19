class Product < ApplicationRecord
    belongs_to :user 
    belongs_to :company
    enum product_type: { raw: 0, finish: 1 }
    validates :name, presence: true, length: { maximum: 255 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :color, presence: true, length: { maximum: 50 }
  validates :product_type, presence: true, inclusion: { in: product_types.keys }
end
