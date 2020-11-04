class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postalcode_id, :prefecture_id, :city, :housenumber, :building, :phonenumber, :token

  with_options presence: true do
    validates :postalcode_id, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :housenumber
    validates :phonenumber, format: { with: /\A\d{10}\z|\A\d{11}\z/, message: 'is invalid.' }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postalcode_id: postalcode_id, prefecture_id: prefecture_id, city: city, housenumber: housenumber, phonenumber: phonenumber, building: building, order_id: order.id)
  end
end
