class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @items = Item.new
  end

  def create
    @items = Items.new(item_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :image, :items_name, :explains,
      :category_id, :condition_id,:shipping_method_id,
      :item_location_id, :days_to_ship_id, :price
      ).merge(user_id: current_user.id)
  end

end
