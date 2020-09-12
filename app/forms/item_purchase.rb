class ItemPurchase

  include ActiveModel::Model
  attr_accessor  :zip_code, :ship_address_id, :city, :house_number, :apartment, :phone_number, :user_id, :item_id, :token

  validates :token,        presence: true
  validates :city,         presence: true
  validates :house_number, presence: true
  validates :ship_address_id, numericality: { other_than: 1, message: 'Select' }

  with_options presence: true do
    validates :zip_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "Input correctly"}
    validates :phone_number, format: { with: /\A\d{10}$|^\d{11}\z/}
  end
  
  def save
    item_purchase = Purchase.create!(user_id: user_id, item_id: item_id)
    Address.create!(zip_code: zip_code, ship_address_id: ship_address_id, city: city, house_number: house_number, apartment: apartment, phone_number: phone_number, purchase_id: item_purchase.id)
  end

end