class Donation

  include ActiveModel::Model
  attr_accessor  :zip_code, :ship_address_id, :city, :house_number, :apartment, :phone_number, :purchase_id, :token

end