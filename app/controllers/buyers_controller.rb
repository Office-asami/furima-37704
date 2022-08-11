class BuyersController < ApplicationController

  def index
    @item = Item.find(params[:item_id]) 
  end

  def new
    @buyer_shipping = BuyerShipping.new
  end

  def create
    @buyer_shipping = BuyerShipping.new(buyer_params)
    if @buyer_shipping.valid?
      @buyer_shipping.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def buyer_params
    params.require(:buyer_shipping).permitpermit(:zip_code, :prefecture, :city, :address1, :address2, :telephone).merge(user_id: current_user.id, item_id: item.id)
  end

end
