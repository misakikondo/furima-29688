class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create, :pay_item]

  def index
    if @item.user == current_user || @item.order.present? 
      redirect_to root_path
    end
    @order = ItemOrder.new
  end

  def create
    @order = ItemOrder.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit(:token, :zip_code, :prefecture_id, :city, :block, :building_name, :phone, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
