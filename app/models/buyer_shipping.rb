class BuyerShipping
  include ActiveModel::Model
  atter_accessor :user_id, :item, :zip_code, :prefecture, :city, :address1, :address2, :telephone, :buyer_id


  with_options presence: true do
    validates :user_id, :item_id
    validates :prefecture_id, numericality: {only_integer: true, greater_than_or_equal_to: 1}
    validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :telephone, format: {with: /\A[0-9]{9,10}/\z/, message: "is invalid. Can't Include hyphen(-)"}
  end
  

  def save

  end

end