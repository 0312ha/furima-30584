class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to_active_hash :product_category
  belongs_to_active_hash :product_status
  belongs_to_active_hash :delivery_burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_day
  belongs_to :user
  has_one :order

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
