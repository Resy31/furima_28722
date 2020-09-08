class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :ship_address

  validates :zip_code,     presence: true
  validates :city,         presence: true
  validates :house_number, presence: true
  validates :phone_number, presence: true
  validates :ship_address, presence: true

  validates :ship_address_id { other_than: 1, message: ' Select' }

end
