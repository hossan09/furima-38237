class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :area_id, :municipalities, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :token
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :user_id
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipalities
    validates :address
    validates :phone_number,
              numericality: { only_integer: true, greater_than_or_equal_to: 1_000_000_000, less_than_or_equal_to: 99_999_999_999,
                              message: 'is invalid' }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, area_id: area_id, municipalities: municipalities, address: address,
                   building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
