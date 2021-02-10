FactoryBot.define do
  factory :item do
  name                              {'セーター'}
  informaion                        {'商品の説明'}
  category_id                       {'子ども用'}
  burden_of_shipping_charges_id     {'送料の負担いくら'}
  shipping_area_id                  {'配送エリア'}
  estimated_shipping_id             {'発送までの日数'}
  product_condition_id              {'商品の状態'}
  # user                              {'田中'}
  association :user
  end
end
