class BuyerShipping
  include ActiveModel::Model
  atter_accessor :user_id, :item, :zip_code, :prefecture_id, :city, :address1, :address2, :telephone

  with_options presence: true do
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000000, message: 'is invalid'}
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}
  
  end



  def save
  end

end