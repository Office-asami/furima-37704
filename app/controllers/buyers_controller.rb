class BuyersController < ApplicationController

  def index
    @item = Item.find(params[:item_id]) 
    @buyer_shipping = BuyerShipping.new
  end

  def new
  end

  def create
    @buyer_shipping = BuyerShipping.new(buyer_params)
    if @buyer_shipping.valid?
      @buyer_shipping.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id]) 
      render :index
    end
  end


  private

  def buyer_params
    params.require(:buyer_shipping).permit(:zip_code, :prefecture_id, :city, :address1, :address2, :telephone).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
