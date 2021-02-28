class Purchase
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post, :shipping_area_id, :municipality, :address, :building_name, :phone_number, :token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post, format: { with: /\A\d{3}-\d{4}\z/, message: '郵便番号の記載をお願いいたします.' }
    validates :shipping_area_id, numericality: { other_than: 1 }
    validates :municipality
    validates :address
    validates :phone_number, length: { maximum: 11, message: 'Too long' }
    validates :phone_number, numericality: { only_integer: true }
    validates :token, presence: true
  end

  def save
    # 各テーブルにデータを保存する処理を書く
    buy = Buy.create(user_id: user_id, item_id: item_id)
    StreetAddress.create(post: post, shipping_area_id: shipping_area_id, municipality: municipality, address: address,
                         building_name: building_name, phone_number: phone_number, buy_id: buy.id)
  end
end
