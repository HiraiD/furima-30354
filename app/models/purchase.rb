class Purchase
  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:post,:prefecture_id,:municipality,:address,:building_name,:phone_number,:buy  

  # ここにバリデーションの処理を書く
with_options presence: true do
  validates :user_id
  validates :item_id
  validates :post,format: { with: /\A\d{3}[-]\d{4}\z/, message: "郵便番号の記載をお願いいたします." }
  validates :prefecture_id,numericality: { other_than: 1 }
  validates :municipality, { with: /\A\d{3}[-]\d{4}\z/, message: "市町村の記載をお願いいたします." }
  validates :address,{ with:  /\A[a-zA-Z0-9]+\z/, message: "番地の記載を半角英数字での記載をお願いいたします." }
  validates :building_name
  validates :phone_number{ with:  /-/, message: "ハイフン（ー）無しで記載をお願いいたします." }
  validates :buy_id
  def save
    # 各テーブルにデータを保存する処理を書く
  buys = Buys.create(user: user, item: item)
  Street_address.create (post: post, prefecture_id: prefecture_id, municipality: municipality, address: address, address: address, phone_number: phone_number )
  

  end
end