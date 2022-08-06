class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.all.order(created_at: :desc)
    @fee_burden = FeeBurden.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :overview, :category_id, :status_id, :fee_burden_id, :prefecture_id, :handling_time_id,
                                 :price, :image).merge(user_id: current_user.id)
  end
end
