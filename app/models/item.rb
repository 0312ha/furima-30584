class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :product_condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :days_to_ship
  belongs_to :user

  with_options numericality: { other_than: 1 } do
    validates :product_category_id
    validates :product_status_id
    validates :delivery_burden_id
    validates :prefecture_id
    validates :delivery_day_id
  end

  with_options presence: true do
    validates :image
    validates :product_name
    validates :product_introduction
    validates :product_category_id
    validates :product_status_id
    validates :delivery_burden_id
    validates :prefecture_id
    validates :delivery_day_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
end
