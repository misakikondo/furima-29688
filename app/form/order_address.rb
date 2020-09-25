class OrderAdress
  include ActiveModel: :Model
  attr_accesor :item_id, :user_id, :zip_code, :prefecture, :city, :block, :building_name, :phone, :order_id


  with_options presence: true do
    validates :zip_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :block
    validates :phone, format: { with: /\A[0-9]+\z/ }, length: { maximum: 11 }
  end

  validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }

  def save
    order = Order.create(item_id: item.id, user_id: user.id)
    Adress.create(zip_code: zip_code, prefecture: prefecture_id, bulimg_name: bulimg_name, city: city, block: block, phone: phone, order_id: order.id)
  end

end