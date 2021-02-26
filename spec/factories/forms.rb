FactoryBot.define do
  factory :form do
    user_id                           {3}
    item_id                           {3}
    post                        {'000-0000'}
    shipping_area_id               { 2 }
    municipality                  {'飯山市'}
    address                       {'青山1-2-3'}
    phone_number               {'09012345678'}
    price                               {3000}
    token       {'tok_xxxxxxxxxxxxxxxxxxxxxxxx'}
 



  end
end
