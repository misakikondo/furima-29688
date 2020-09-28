class ItemOrder
  include ActiveModel::Model
  attr_accessor :token, :item_id, :user_id, :zip_code, :prefecture_id, :city, :block, :building_name, :phone, :order_id


  
  with_options presence: true do
    validates :zip_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :block
    validates :phone, format: { with: /\A[0-9]+\z/ }, length: { maximum: 11 }
    validates :token
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(zip_code: zip_code, prefecture_id: prefecture_id, building_name: building_name, city: city, block: block, phone: phone, order_id: order.id)
  end

end