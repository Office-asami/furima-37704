class BuyerShipping
  include ActiveModel::Model
  atter_accessor :user_id, :item, :zip_code, :prefecture, :city, :address1, :address2, :telephone, :buyer_id

  def save
  end

end