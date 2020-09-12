FactoryBot.define do
  factory :item_purchase do
    token           { 'kfkwoi90930jfiw923' }
    zip_code        { '123-4567' }
    ship_address_id { 2 }
    city            { '東京都' }
    house_number    { '1-1' }
    apartment       { '東京ハイツ' }
    phone_number    { '01012345678' }
  end
end
