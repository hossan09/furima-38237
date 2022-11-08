class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :content, :user, :category_id, :situation_id, :delivery_charge_id, :delivery_area_id, :delivery_days_id, :price, :image)
  end
end
