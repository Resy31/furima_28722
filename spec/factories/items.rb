FactoryBot.define do
  factory :item do
    name            { 'テスト商品' }
    describe        { 'これはテストの商品です' }
    category_id     { 2 }
    status_id       { 2 }
    delivery_fee_id { 2 }
    ship_address_id { 2 }
    ship_date_id    { 2 }
    price           { '1000' }
    association :user
  end
end
