class ItemPurchase
  include ActiveModel::Model
  attr_accessor :zip_code, :ship_address_id, :city, :house_number, :apartment, :phone_number, :user_id, :item_id, :token

  validates :ship_address_id, numericality: { other_than: 1, message: 'Select' }

  with_options presence: true do
    validates :phone_number, format: { with: /\A\d{10}$|^\d{11}\z/ }
    validates :token, :city, :house_number
    ZIP_CODE_REGEX = /\A\d{3}[-]\d{4}\z/.freeze
    validates :zip_code, format: { with: ZIP_CODE_REGEX, message: 'Input correctly' }
  end

  def save
    item_purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(zip_code: zip_code, ship_address_id: ship_address_id, city: city, house_number: house_number, apartment: apartment, phone_number: phone_number, purchase_id: item_purchase.id)
  end
end
