FactoryBot.define do
  factory :item do
    name                              { 'セーター' }
    informaion                        { '商品の説明' }
    category_id                       { 2 }
    burden_of_shipping_charges_id     { 2 }
    shipping_area_id                  { 2 }
    estimated_shipping_id             { 2 }
    product_condition_id              { 2 }
    price                             { '300' }
    # user                              {'田中'}
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('spec/fixtures/sample.png'), filename: 'sample.png')
    end
  end
end
