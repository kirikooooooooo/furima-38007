class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "不正な値です。-（半角ハイフン）を含む値を入力してください"}
    validates :prefecture_id, numericality: { other_than: 1 , message: "を選択してください"} 
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A[0-9]{10,11}\z/, message: "半角数字10桁以上11桁以内で入力してください"}
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end