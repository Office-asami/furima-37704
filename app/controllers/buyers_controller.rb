class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :find_item, only: [:index, :create]
  before_action :check_user, only: [:index]

  def index
    if @item.buyer.present?
      redirect_to root_path
    else
      @buyer_shipping = BuyerShipping.new
    end
  end

  def new
  end

  def create
    @buyer_shipping = BuyerShipping.new(buyer_params)
    if @buyer_shipping.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item[:price],
        card: buyer_params[:token],
        currency: 'jpy'
      )
      @buyer_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:buyer_shipping).permit(:zip_code, :prefecture_id, :city, :address1, :address2, :telephone).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

  def check_user
    redirect_to root_path if current_user.id == @item.user.id
  end
end
