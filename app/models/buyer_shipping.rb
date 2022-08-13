class BuyerShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zip_code, :prefecture_id, :city, :address1, :address2, :telephone, :token


  with_options presence: true do
    validates :user_id, :city, :address1
    validates :prefecture_id, numericality: {only_integer: true, other_than: 1 , message: "can't be blank"}
    validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :telephone, format: {with: /\A\d{10,11}\z/, message: "is invalid. Can't Include hyphen(-)"}
  end

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Shipping.create(zip_code: zip_code, prefecture_id: prefecture_id, city: city, address1: address1, address2: address2, telephone: telephone, buyer_id: buyer.id)
  end

end