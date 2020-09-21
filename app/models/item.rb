class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :status
  belongs_to_active_hash :ship_address
  belongs_to_active_hash :ship_date
  has_many_attached :images

  validates :images, presence: true
  validates :name,     presence: true
  validates :price,    presence: true
  validates :describe, presence: true
  validates :user_id,  presence: true
  validates :category, :delivery_fee, :ship_address, :ship_date, :status, presence: true

  validates_inclusion_of :price, in: 300..9_999_999, message: 'が設定範囲外です'

  validates :category_id, :delivery_fee_id, :ship_address_id, :ship_date_id, :status_id, numericality: { other_than: 1, message: 'を選択して下さい' }

  belongs_to :user
  has_one :purchase
end
